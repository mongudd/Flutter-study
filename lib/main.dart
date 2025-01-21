import 'package:flutter/material.dart';
import 'package:toonflix/screens/home_screen.dart';

//stateful : 데이터 변경시, 변화를 UI에 반영하여 실시간으로 확인 가능 (데이터 저장 -> 실시간 데이터 변화 확인)
//stateless : 데이터 X, 그저 UI를 보여주는 것

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xffE7626C),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            color: Color(0xff232B55),
          ),
        ),
        cardColor: const Color(0xffF4EDDB),
      ),
      home: const HomeScreen(),
    );
  }
}
