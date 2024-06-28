import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:veryreal_common/veryreal_common.dart';
import 'package:record/record.dart';
import 'package:sprintf/sprintf.dart';

enum VeryAudioRecorder2Status {
  ready,
  recording,
}

class VeryAudioRecorder2 extends StatefulWidget {
  const VeryAudioRecorder2({
    super.key,
    this.maxRecordSec = 15,
    this.minRecordSec = 10,
    this.showRecordingHint = true,
    this.fileName = 'voice_prompt',
    this.holdToRecordText,
    this.onRecordingStart,
    this.onCompleted,
  });
  final int maxRecordSec;
  final int minRecordSec;
  final bool showRecordingHint;
  final String fileName;
  final String? holdToRecordText;
  final Future<void> Function()? onRecordingStart;
  final Future<void> Function(String? path)? onCompleted;

  @override
  State<VeryAudioRecorder2> createState() => _VeryAudioRecorder2State();
}

class _VeryAudioRecorder2State extends State<VeryAudioRecorder2> {
  static const _dir = "voice";
  static const _ext = ".m4a";
  late String _path;
  final _audioRecorder = AudioRecorder();
  int _startTimestamp = 0;
  Timer? _timer;
  int _duration = 0;
  VeryAudioRecorder2Status status = VeryAudioRecorder2Status.ready;
  bool showMinRecordSecAlert = false;

  static int _now() => DateTime.now().millisecondsSinceEpoch;

  void logFileData({required String path}) async {
    // Create a File object
    File file = File(path);

    // Check if the file exists
    if (await file.exists()) {
      // Get the size of the file in bytes
      int fileSize = await file.length();
      Logger.print('creturn File size: $fileSize bytes at $path');
    } else {
      Logger.print('creturn File does not exist.');
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    _timer = null;
    _audioRecorder.dispose();
    super.dispose();
  }

  void startRecording() {
    (() async {
      if (await _audioRecorder.hasPermission()) {
        status = VeryAudioRecorder2Status.recording;
        showMinRecordSecAlert = false;
        if (!mounted) return;
        setState(() {});

        // _path = await IMUtils.createTempFile(dir: _dir, name: '${_now()}$_ext');
        _path = await IMUtils.createTempFile(
            dir: _dir, name: '${widget.fileName}$_ext');
        widget.onRecordingStart?.call();
        await _audioRecorder.start(const RecordConfig(), path: _path);
        _startTimestamp = _now();
        _timer?.cancel();
        _timer = null;
        _timer = Timer.periodic(const Duration(seconds: 1), (timer) async {
          _duration = ((_now() - _startTimestamp) ~/ 1000);
          if (!mounted) return;
          setState(() {});
          if (_duration >=
              (Platform.isAndroid
                  ? (widget.maxRecordSec + 1)
                  : widget.maxRecordSec)) {
            stopRecording();
          }
        });
      }
    })();
  }

  void stopRecording() {
    (() async {
      if (!(await _audioRecorder.isRecording())) return;

      await _audioRecorder.stop();

      if (_duration < widget.minRecordSec) {
        deleteRecording();
        showMinRecordSecAlert = true;
        widget.onCompleted?.call(null);
      } else {
        logFileData(path: _path);
        widget.onCompleted?.call(_path);
      }

      status = VeryAudioRecorder2Status.ready;
      _timer?.cancel();
      _timer = null;
      _duration = 0;

      if (!mounted) return;
      setState(() {});
    })();
  }

  void deleteRecording() {
    (() async {
      if (_path.isNotEmpty) {
        await IMUtils.deleteFile(_path);
      }
    })();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          visible: status == VeryAudioRecorder2Status.recording,
          child: IMUtils.seconds2HMS(_duration).toText
            ..style = Styles.ts_8E8E8E_16sp_regular,
        ),
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTapDown: (details) {},
          onTapUp: (details) {},
          onTapCancel: () {},
          onLongPressStart: (details) {
            HapticFeedback.heavyImpact();
            Future.delayed(100.milliseconds,
                startRecording); // add future to fix haptic feedback bug
          },
          onLongPressEnd: (details) {
            stopRecording();
          },
          onLongPressMoveUpdate: (details) {},
          child: Container(
            height: 64,
            width: double.infinity,
            decoration: BoxDecoration(
              color: status == VeryAudioRecorder2Status.recording
                  ? Styles.c_B3B3B3
                  : Styles.c_FFFFFF,
              borderRadius: BorderRadius.circular(100),
              border: Border.all(color: Styles.c_8E8E8E, width: 1),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                (status == VeryAudioRecorder2Status.recording
                        ? StrRes.releaseToStop
                        : (widget.holdToRecordText ?? StrRes.holdToRecord))
                    .toText
                  ..style = Styles.ts_000000_16sp_regular,
              ],
            ),
          ),
        ),
        Visibility(
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          visible: status == VeryAudioRecorder2Status.ready,
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: showMinRecordSecAlert
                  ? (sprintf(StrRes.audioRecordingLengthAlert,
                      [widget.minRecordSec]).toText
                    ..style = Styles.ts_D30000_14sp_regular
                    ..textAlign = TextAlign.center)
                  : (sprintf(StrRes.recordVoicePromptCaption,
                      [widget.minRecordSec, widget.maxRecordSec]).toText
                    ..style = widget.showRecordingHint
                        ? Styles.ts_8E8E8E_14sp_regular
                        : Styles.ts_transparent_14sp_regular
                    ..textAlign = TextAlign.center)),
        ),
      ],
    );
  }
}
