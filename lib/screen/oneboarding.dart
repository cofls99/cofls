import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled1/screen/login.dart';  // 로그인 화면을 불러오기
import 'package:untitled1/const/const.dart';  // 필요한 상수 파일 추가
import 'package:untitled1/screen/oneborading2.dart';  // 온보딩 2 화면 불러오기

class next_button extends StatelessWidget {
  final int type;
  final String word;

  next_button(this.word, this.type);
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        if (type == 4) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => oneboarding2(),
            ),
          );
        } else if (type == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),  // 로그인 화면으로 이동
            ),
          );
        }
      },
      child: Container(
        width: 165,
        height: 60,
        decoration: BoxDecoration(
          gradient: type == 4
              ? LinearGradient(
              colors: [ui_colors[3], ui_colors[4]],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight)
              : null,
          color: ui_colors[type],
          borderRadius: BorderRadius.all(Radius.circular(80)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              style: TextStyle(
                color: font_colors[0],
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              word,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class progress_bar extends StatefulWidget {
  @override
  progress_bar({required this.type});
  final int type;
  _progress_bar createState() => _progress_bar();
}

class _progress_bar extends State<progress_bar> {
  int type = 0;
  @override
  void initState() {
    super.initState();
    type = widget.type;
  }

  final List<double> wid = [
    32,
    16,
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      width: wid[type],
      height: 8,
      decoration: BoxDecoration(
        color: ui_colors[type],
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background_color[0],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                onboarding_images[0],
                fit: BoxFit.fitWidth,
              ),
              const SizedBox(
                height: 14,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    intro_titles[0],
                    style: GoogleFonts.abhayaLibre(
                      color: font_colors[0],
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    intro_texts[0],
                    style: TextStyle(
                      fontSize: 24,
                      color: font_colors[1],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  progress_bar(type: 0),
                  SizedBox(
                    width: 6,
                  ),
                  progress_bar(type: 1),
                  SizedBox(
                    width: 6,
                    // Todo
                    // 반응형으로 변경해야 함
                  ),
                  progress_bar(type: 1),
                  SizedBox(
                    width: 100,
                  ),
                  Image(
                    height: 100,
                    width: 190,
                    image: AssetImage(
                      'assets/cut_embargo.png',
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  next_button('건너뛰기', 2),  // 로그인 화면으로 이동
                  next_button('다음', 4),  // 온보딩 2 화면으로 이동
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
