import 'dart:async';

import 'package:flip_board/flip_widget.dart';
import 'package:flutter/material.dart';
import 'package:veryreal_common/veryreal_common.dart';

class VeryCountdownClock extends StatefulWidget {
  final DateTime targetDate;

  const VeryCountdownClock({super.key, required this.targetDate});

  @override
  _VeryCountdownClockState createState() => _VeryCountdownClockState();
}

class _VeryCountdownClockState extends State<VeryCountdownClock> {
  late Timer _timer;
  Duration _timeDifference = const Duration();
  var daysTensController = StreamController<int>();
  var daysOnesController = StreamController<int>();
  var hoursTensController = StreamController<int>();
  var hoursOnesController = StreamController<int>();
  var minutesTensController = StreamController<int>();
  var minutesOnesController = StreamController<int>();
  var secondsTensController = StreamController<int>();
  var secondsOnesController = StreamController<int>();

  @override
  void initState() {
    super.initState();
    _updateTimeDifference();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _updateTimeDifference();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    daysTensController.close();
    daysOnesController.close();
    hoursTensController.close();
    hoursOnesController.close();
    minutesTensController.close();
    minutesOnesController.close();
    secondsTensController.close();
    secondsOnesController.close();
    super.dispose();
  }

  void _updateTimeDifference() {
    final now = DateTime.now();
    final difference = widget.targetDate.difference(now);
    if (difference.isNegative) {
      _timer.cancel();
    } else {
      _timeDifference = difference;
      daysTensController.add(_timeDifference.inDays ~/ 10);
      hoursTensController.add(_timeDifference.inHours.remainder(24) ~/ 10);
      minutesTensController.add(_timeDifference.inMinutes.remainder(60) ~/ 10);
      secondsTensController.add(_timeDifference.inSeconds.remainder(60) ~/ 10);

      daysOnesController.add(_timeDifference.inDays % 10);
      hoursOnesController.add(_timeDifference.inHours.remainder(24) % 10);
      minutesOnesController.add(_timeDifference.inMinutes.remainder(60) % 10);
      secondsOnesController.add(_timeDifference.inSeconds.remainder(60) % 10);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    _flipContainer(daysTensController),
                    2.hSpace,
                    _flipContainer(daysOnesController),
                  ],
                ),
                2.vSpace,
                _label(StrRes.days.capitalizeFirstLetterOnly),
              ],
            ),
            _seperator(),
            Column(
              children: [
                Row(
                  children: [
                    _flipContainer(hoursTensController),
                    2.hSpace,
                    _flipContainer(hoursOnesController),
                  ],
                ),
                2.vSpace,
                _label(StrRes.hours.capitalizeFirstLetterOnly),
              ],
            ),
            _seperator(),
            Column(
              children: [
                Row(
                  children: [
                    _flipContainer(minutesTensController),
                    2.hSpace,
                    _flipContainer(minutesOnesController),
                  ],
                ),
                2.vSpace,
                _label(StrRes.minutes.capitalizeFirstLetterOnly),
              ],
            ),
            _seperator(),
            Column(
              children: [
                Row(
                  children: [
                    _flipContainer(secondsTensController),
                    2.hSpace,
                    _flipContainer(secondsOnesController),
                  ],
                ),
                2.vSpace,
                _label(StrRes.seconds.capitalizeFirstLetterOnly),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _flipContainer(StreamController<int> controller) => FlipWidget(
        flipType: FlipType.middleFlip,
        itemStream: controller.stream,
        itemBuilder: (_, val) => _container(val.toString()),
        flipDirection: AxisDirection.down,
        hingeWidth: 1.0,
        hingeLength: 28.0,
        hingeColor: Styles.c_FFFFFF,
      );

  Widget _container(String value) => Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Styles.c_ECEBF0,
          border: Border.all(width: 1, color: Styles.c_ECEBF0),
          borderRadius: BorderRadius.circular(4.0),
        ),
        width: 28.0,
        height: 38.0,
        child: value.toText..style = Styles.ts_000000_16sp_semibold,
      );

  Widget _label(String label) =>
      label.toText..style = Styles.ts_8E8E8E_12sp_regular;

  Widget _seperator() => Container(
      margin: const EdgeInsets.only(bottom: 20, left: 2, right: 2),
      child: ":".toText..style = Styles.ts_000000_16sp_semibold);
}
