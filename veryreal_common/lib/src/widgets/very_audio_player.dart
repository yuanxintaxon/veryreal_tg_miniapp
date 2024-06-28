import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:sprintf/sprintf.dart';

import '../../veryreal_common.dart';

enum VeryAudioPlayerStatus {
  paused,
  stopped,
  playing,
}

class VeryAudioPlayer extends StatefulWidget {
  const VeryAudioPlayer({
    super.key,
    this.sourcePath,
    this.url,
    this.allowDeletion = true,
    this.compactSize = false,
    this.onLoadingListener,
    this.interruptListener,
    this.deleteListener,
    this.onDeleted,
    this.onPlaying,
  });
  final String? sourcePath;
  final String? url;
  final bool allowDeletion;
  final bool compactSize;
  final Stream<bool>? interruptListener;
  final Stream<bool>? deleteListener;
  final Stream<String>? onLoadingListener;

  final Future<void> Function(String path)? onDeleted;
  final Future<void> Function()? onPlaying;

  @override
  State<VeryAudioPlayer> createState() => _VeryAudioPlayerState();
}

class _VeryAudioPlayerState extends State<VeryAudioPlayer> {
  MeetingBridge? meetingBridge = PackageBridge.meetingBridge;
  RTCBridge? rtcBridge = PackageBridge.rtcBridge;

  VeryAudioPlayerStatus status = VeryAudioPlayerStatus.stopped;
  bool isExistSource = false;
  final _audioPlayer = AudioPlayer();
  Duration minDuration = Duration.zero,
      maxDuration = Duration.zero,
      currentDuration = Duration.zero;
  StreamSubscription? _interruptSub;
  StreamSubscription? _deleteSub;
  StreamSubscription? _onLoadingSub;
  bool isLoading = false;
  late String sourcePath;

  // for loading count down
  Timer? _loadingTimer;
  static const int _loadingTimeCountdownFrom = 20;
  int? _loadingTimeLeft = _loadingTimeCountdownFrom;

  @override
  void initState() {
    sourcePath = widget.sourcePath ?? '';
    _initPlayListener();
    _initVoiceSourceNowOrLater();
    _initInterruptListener();
    _initDeleteListener();
    super.initState();
  }

  @override
  void dispose() {
    
    _audioPlayer.dispose();
    _interruptSub?.cancel();
    _deleteSub?.cancel();
    _onLoadingSub?.cancel();
    super.dispose();
  }

  void _initInterruptListener() {
    _interruptSub = widget.interruptListener?.listen((_) {
      if (status == VeryAudioPlayerStatus.playing) {
        pauseAudio();
      }
    });
  }

  void _initDeleteListener() {
    _deleteSub = widget.deleteListener?.listen((_) {
      deleteAudio();
    });
  }

  void _initOnLoadingListener() {
    isLoading = true;
    startLoadingTimer();
    _onLoadingSub = widget.onLoadingListener?.listen((value) async {
      sourcePath = value;
      await _initVoiceSource();
      stopLoadingTimer();
      isLoading = false;
      if (!mounted) return;
      setState(() {});
    });
  }

  void _initVoiceSourceNowOrLater() {
    if (widget.onLoadingListener != null) {
      _initOnLoadingListener();
    } else {
      _initVoiceSource();
    }
  }

  void _initPlayListener() {
    _audioPlayer.playerStateStream.listen((state) async {
      switch (state.processingState) {
        case ProcessingState.idle:
        case ProcessingState.loading:
        case ProcessingState.buffering:
        case ProcessingState.ready:
          break;
        case ProcessingState.completed:
          await stopAudio();
          resetAudioPosition();
          break;
      }
    });
  }

  void startLoadingTimer() {
    if (_loadingTimer != null) return;
    _loadingTimer = Timer.periodic(1.seconds, (Timer timer) {
      _loadingTimeLeft = (_loadingTimeCountdownFrom - timer.tick);
      setState(() {});
      if (timer.tick >= _loadingTimeCountdownFrom) {
        stopLoadingTimer();
        return;
      }
    });
  }

  void stopLoadingTimer() {
    _loadingTimer?.cancel();
    _loadingTimer = null;
    _loadingTimeLeft = null;
  }

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

  bool get rtcIsBusy =>
      meetingBridge?.hasConnection == true || rtcBridge?.hasConnection == true;

  Future<void> _initVoiceSource() async {
    // logFileData(path: sourcePath);
    if (sourcePath.isNotEmpty &&
        sourcePath.trim().isNotEmpty &&
        File(sourcePath).existsSync()) {
      isExistSource = true;
      await _audioPlayer.setFilePath(sourcePath);
      _audioPlayer.positionStream.listen((duration) {
        currentDuration = duration;
        if (!mounted) return;
        setState(() {});
      });
      maxDuration = _audioPlayer.duration ?? currentDuration;
      if (!mounted) return;
      setState(() {});
    }
  }

  Future<void> playAudio({bool updateStatus = true}) async {
    if (updateStatus) {
      status = VeryAudioPlayerStatus.playing;
      if (!mounted) return;
      setState(() {});
    }

    if (isExistSource) {
      _audioPlayer.setVolume(rtcIsBusy ? 0 : 1.0);
      _audioPlayer.seek(
          currentDuration == Duration.zero ? Duration.zero : currentDuration);
      _audioPlayer.play();
      widget.onPlaying?.call();
    }
  }

  Future<void> pauseAudio({bool updateStatus = true}) async {
    if (updateStatus) {
      status = VeryAudioPlayerStatus.paused;
      if (!mounted) return;
      setState(() {});
    }

    if (_audioPlayer.playerState.playing) {
      await _audioPlayer.pause();
    }
  }

  Future<void> stopAudio() async {
    status = VeryAudioPlayerStatus.stopped;
    if (!mounted) return;
    setState(() {});

    if (_audioPlayer.playerState.playing) {
      await _audioPlayer.stop();
    }
  }

  Future<void> deleteAudio() async {
    if (sourcePath.isNotEmpty) {
      await stopAudio();
      await IMUtils.deleteFile(sourcePath);
      widget.onDeleted?.call(sourcePath);
    }
  }

  void resetAudioPosition() {
    currentDuration = Duration.zero;
    if (!mounted) return;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Offstage(
          offstage: widget.compactSize,
          child: Visibility(
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            visible: false,
            child: IMUtils.seconds2HMS(30).toText
              ..style = Styles.ts_8E8E8E_16sp_regular,
          ),
        ),
        Container(
          height: 64,
          width: double.infinity,
          padding: const EdgeInsets.only(left: 12, right: 16),
          decoration: BoxDecoration(
            color: Styles.c_EBEBEB,
            borderRadius: BorderRadius.circular(100),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isLoading) ...[
                (_loadingTimer != null
                        ? sprintf(StrRes.processingPleaseWaitXSeconds,
                            [_loadingTimeLeft])
                        : StrRes.processingPleaseWaitABitMoreTime)
                    .fixOverflowEllipsis
                    .toText
                  ..style = Styles.ts_808080_14sp_regular
                  ..maxLines = 1
                  ..overflow = TextOverflow.ellipsis,
              ] else ...[
                Row(
                  children: [
                    if (status == VeryAudioPlayerStatus.playing) ...[
                      ImageRes.pauseRecording.toImage
                        ..width = 48
                        ..height = 48
                        ..onTap = pauseAudio,
                    ] else if (status == VeryAudioPlayerStatus.paused ||
                        status == VeryAudioPlayerStatus.stopped) ...[
                      ImageRes.playRecording.toImage
                        ..width = 48
                        ..height = 48
                        ..onTap = playAudio,
                    ],
                    7.hSpace,
                    IMUtils.seconds2HMS(status == VeryAudioPlayerStatus.stopped
                            ? maxDuration.inSeconds
                            : currentDuration.inSeconds)
                        .toText
                      ..style = Styles.ts_8E8E8E_16sp_regular,
                    8.hSpace,
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 8.0),
                        overlayShape: SliderComponentShape.noOverlay,
                        trackHeight: 3.0,
                      ),
                      child: Flexible(
                        child: Slider(
                          activeColor: Styles.c_808080,
                          inactiveColor: Styles.c_FFFFFF,
                          thumbColor: Styles.c_808080,
                          value: currentDuration.inSeconds.toDouble(),
                          min: minDuration.inSeconds.toDouble(),
                          max: maxDuration.inSeconds.toDouble(),
                          onChanged: (value) async {
                            currentDuration = Duration(seconds: value.toInt());
                            if (!mounted) return;
                            setState(() {});
                          },
                          onChangeStart: (value) async {
                            if (status == VeryAudioPlayerStatus.playing) {
                              await pauseAudio(updateStatus: false);
                            }
                          },
                          onChangeEnd: (value) async {
                            if (status == VeryAudioPlayerStatus.playing) {
                              await playAudio(updateStatus: false);
                            }
                          },
                        ),
                      ),
                    ),
                    8.hSpace,
                    if (sourcePath.isNotEmpty && widget.allowDeletion)
                      ImageRes.deleteRecording.toImage
                        ..width = 24
                        ..height = 24
                        ..onTap = deleteAudio,
                  ],
                )
              ]
            ],
          ),
        ),
        Offstage(
          offstage: widget.compactSize,
          child: Visibility(
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            visible: false,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: StrRes.recordVoicePromptCaption.toText
                ..style = Styles.ts_8E8E8E_14sp_regular
                ..textAlign = TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
