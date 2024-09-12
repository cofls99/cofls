import 'package:flutter/material.dart';
import 'package:untitled1/const/const.dart';
import 'package:google_fonts/google_fonts.dart';

class new_button extends StatelessWidget {
  final int type;
  final int word;
  new_button(this.word, this.type);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Container(
        width: 382,
        height: type == 2 ? 80 : 70,
        decoration: BoxDecoration(
          border: type == 6
              ? Border.all(
                  color: ui_colors[5],
                  width: 2,
                )
              : null,
          color: ui_colors[type],
          borderRadius: BorderRadius.all(Radius.circular(80)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: word == 4 ? 0 : 20,
            ),
            Image.asset(sns_logos[word], scale: word == 4 ? 100 : 1),
            Flexible(
              child: SizedBox(
                width: 600,
              ),
            ),
            Text(
              style: TextStyle(
                color: font_colors[0],
                fontSize: 16,
              ),
              sns_login_texts[word],
              textAlign: TextAlign.center,
            ),
            Flexible(
              child: SizedBox(
                width: 600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class infield extends StatelessWidget {
  final int type;
  infield(this.type);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 380,
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: icons[type],
          contentPadding: EdgeInsets.all(20),
          hintText: sign_up_field[type],
          hintStyle: TextStyle(color: font_colors[5]),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(59),
            ),
          ),
          fillColor: ui_colors[2],
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(59)),
            borderSide: BorderSide(color: ui_colors[2]),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: ui_colors[2],
            ),
            borderRadius: BorderRadius.all(Radius.circular(59)),
          ),
        ),
        style: TextStyle(
          color: font_colors[5],
        ),
        obscureText: type == 5,
      ),
    );
  }
}

class create_account extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background_color[0],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      //페이지 이동하는 함수
                      Navigator.pop(
                        context,
                      );
                    },
                    child: Image.asset('assets/left_button.png'),
                  )
                ],
              ),
              Text(
                sign_up_texts[0],
                style: GoogleFonts.abhayaLibre(
                  color: font_colors[0],
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                height: 40,
              ),
              infield(0),
              SizedBox(
                height: 30,
              ),
              infield(1),
              SizedBox(
                height: 30,
              ),
              infield(2),
              SizedBox(
                height: 30,
              ),
              infield(3),
              SizedBox(
                height: 30,
              ),
              infield(4),
              SizedBox(
                height: 30,
              ),
              infield(5),
              SizedBox(
                height: 30,
              ),
              infield(6),
            ],
          ),
        ),
      ),
    );
  }
}
