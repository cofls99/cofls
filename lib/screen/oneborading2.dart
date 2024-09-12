import 'package:flutter/material.dart';
import 'package:untitled1/const/const.dart';
import 'package:untitled1/screen/sign.dart';
import 'package:google_fonts/google_fonts.dart';

class next_button extends StatelessWidget {
  final int type;
  final String word;

  next_button(this.word, this.type);
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => sign(),
          ),
        );
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

class oneboarding2 extends StatefulWidget {
  @override
  _oneboarding2 createState() => _oneboarding2();
}

class _oneboarding2 extends State<oneboarding2> {
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
                onboarding_images[1],
                fit: BoxFit.fitWidth,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    intro_titles[1],
                    style: GoogleFonts.abhayaLibre(
                      color: font_colors[0],
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    intro_texts[1],
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
                  progress_bar(type: 1),
                  SizedBox(
                    width: 6,
                  ),
                  progress_bar(type: 0),
                  SizedBox(
                    width: 6,
                    //Todo
                    //반응형으로 변경해야 함
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
                  next_button('건너뛰기', 2),
                  next_button('다음', 4),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
