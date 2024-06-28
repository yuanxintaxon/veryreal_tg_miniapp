import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:veryreal_common/veryreal_common.dart';
import 'package:record/record.dart';

enum VeryAudioRecorderStatus {
  ready,
  recording,
}

class VeryAudioRecorder extends StatefulWidget {
  const VeryAudioRecorder({
    super.key,
    this.maxRecordSec = 15,
    this.minRecordSec = 10,
    this.onCompleted,
  });
  final int maxRecordSec;
  final int minRecordSec;
  final Future<void> Function(String? path)? onCompleted;

  @override
  State<VeryAudioRecorder> createState() => _VeryAudioRecorderState();
}

class _VeryAudioRecorderState extends State<VeryAudioRecorder> {
  static const _dir = "voice";
  static const _ext = ".m4a";
  late String _path;
  int _startTimestamp = 0;
  final _audioRecorder = AudioRecorder();
  Timer? _timer;
  int _duration = 0;
  VeryAudioRecorderStatus status = VeryAudioRecorderStatus.ready;
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
        status = VeryAudioRecorderStatus.recording;
        showMinRecordSecAlert = false;
        if (!mounted) return;
        setState(() {});

        // _path = await IMUtils.createTempFile(dir: _dir, name: '${_now()}$_ext');
        _path =
            await IMUtils.createTempFile(dir: _dir, name: 'voice_prompt$_ext');

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
      if (await _audioRecorder.isRecording()) {
        await _audioRecorder.stop();
      }

      if (_duration < widget.minRecordSec) {
        deleteRecording();
        showMinRecordSecAlert = true;
        widget.onCompleted?.call(null);
      } else {
        logFileData(path: _path);
        widget.onCompleted?.call(_path);
      }

      status = VeryAudioRecorderStatus.ready;
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
          visible: status == VeryAudioRecorderStatus.recording,
          child: IMUtils.seconds2HMS(_duration).toText
            ..style = Styles.ts_8E8E8E_16sp_regular,
        ),
        Container(
          height: 64,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Styles.c_EBEBEB,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (status == VeryAudioRecorderStatus.recording) ...[
                ImageRes.stopRecording.toImage
                  ..width = 48
                  ..height = 48
                  ..onTap = stopRecording,
              ] else if ((status == VeryAudioRecorderStatus.ready)) ...[
                ImageRes.startRecording.toImage
                  ..width = 48
                  ..height = 48
                  ..onTap = startRecording,
              ]
            ],
          ),
        ),
        Visibility(
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          visible: status == VeryAudioRecorderStatus.ready,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: showMinRecordSecAlert
                ? (StrRes.audioRecordingLengthAlert.toText
                  ..style = Styles.ts_D30000_14sp_regular
                  ..textAlign = TextAlign.center)
                : (StrRes.recordVoicePromptCaption.toText
                  ..style = Styles.ts_8E8E8E_14sp_regular
                  ..textAlign = TextAlign.center),
          ),
        ),
      ],
    );
  }
}
