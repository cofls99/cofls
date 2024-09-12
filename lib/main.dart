import 'package:flutter/material.dart';
import 'package:untitled1/screen/oneboarding.dart';  // 온보딩 첫 화면을 불러오기
import 'package:untitled1/screen/oneborading2.dart';  // 온보딩 두 번째 화면을 불러오기
import 'package:untitled1/screen/chat_screen.dart';  // 채팅 화면 불러오기

void main() {
  runApp(const MyApp());  // const 생성자 사용
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);  // const 생성자 추가

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat and Onboarding App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // 앱의 시작 화면을 온보딩 첫 화면으로 설정
      home: HomeScreen(),  // OnboardingScreen을 시작 화면으로 설정
    );
  }
}
