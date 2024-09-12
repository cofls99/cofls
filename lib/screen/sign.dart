import 'package:flutter/material.dart';
import 'package:untitled1/const/const.dart';
import 'package:flutter/gestures.dart';
import 'package:untitled1/screen/create_account.dart';
import 'package:untitled1/screen/login.dart';
import 'package:google_fonts/google_fonts.dart';

class new_button extends StatelessWidget {
  final int type;
  final int word;
  new_button(this.word, this.type);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        if (type == 2) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => create_account(),
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => sign_sns[word], //각 sns에 맞는 화면으로
            ),
          );
        }
      },
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

class sign extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background_color[0],
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: SizedBox(
                height: 80,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  sign_titles[0],
                  style: GoogleFonts.abhayaLibre(
                    color: font_colors[0],
                    fontSize: 32,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  sign_texts[0],
                  style: TextStyle(
                    fontSize: 14,
                    color: font_colors[2],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 28,
            ),
            new_button(4, 2),
            SizedBox(
              height: 6,
            ),
            new_button(0, 6),
            SizedBox(
              height: 6,
            ),
            new_button(1, 6),
            SizedBox(
              height: 6,
            ),
            new_button(2, 6),
            SizedBox(
              height: 6,
            ),
            new_button(3, 6),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: sign_texts[1],
                    style: TextStyle(
                      fontSize: 12,
                      color: font_colors[1],
                    ),
                  ),
                  TextSpan(
                    text: sign_texts[2],
                    style: TextStyle(
                      fontSize: 12,
                      color: font_colors[4],
                    ),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
