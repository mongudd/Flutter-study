import 'dart:async';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const twentyFiveMinute = 1500;
  int totalSecond = twentyFiveMinute;
  late Timer timer;
  bool isRunning = false;
  int totalPomodoro = 0;

  void onTick(Timer timer) {
    if (totalSecond == 0) {
      setState(() {
        totalPomodoro = totalPomodoro + 1;
        isRunning = false;
        totalSecond = twentyFiveMinute;
      });
      timer.cancel();
    } else {
      setState(() {
        totalSecond = totalSecond - 1;
      });
    }
  }

  void onStartPressed() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      onTick,
    );
    setState(() {
      isRunning = true;
    });
  }

  void onPausePressed() {
    setState(() {
      isRunning = false;
      timer.cancel();
    });
  }

  void onResetPressed() {
    setState(() {
      totalSecond = twentyFiveMinute;
      isRunning = false;
      timer.cancel();
    });
  }

  String format(int seconds) {
    var duration = Duration(seconds: seconds);

    return duration
        .toString() // 1. make duration in String (0:25:00.000000)
        .split(".") // 2. split in "." ([0:25:00, 000000])
        .first // 3. selct the first one (0:25:00)
        .substring(2, 7); // 4. cut from index2 to index7 (25:00)
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                format(totalSecond),
                style: TextStyle(
                    color: Theme.of(context).cardColor,
                    fontSize: 98,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Flexible(
            flex: 2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  iconSize: 120,
                  color: Theme.of(context).cardColor,
                  onPressed: isRunning ? onPausePressed : onStartPressed,
                  icon: Icon(
                    isRunning
                        ? Icons.pause_circle_outline_outlined
                        : Icons.play_circle_outline_outlined,
                  ),
                ),
                IconButton(
                  iconSize: 60,
                  color: Theme.of(context).cardColor.withAlpha(100),
                  mouseCursor: SystemMouseCursors.click,
                  hoverColor: Theme.of(context).cardColor,
                  onPressed: onResetPressed,
                  icon: const Icon(Icons.restart_alt),
                ),
              ],
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Pomodoros",
                          style: TextStyle(
                            fontSize: 20,
                            color: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .color,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "$totalPomodoro",
                          style: TextStyle(
                            fontSize: 58,
                            color: Theme.of(context)
                                .textTheme
                                .headlineLarge!
                                .color,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
