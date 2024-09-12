import 'package:flutter/material.dart';
import 'package:untitled1/const/const.dart';
import 'package:flutter/gestures.dart';
import 'package:untitled1/screen/sign.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled1/screen/chat_screen.dart';  // ChatScreen 파일 불러오기

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
              builder: (context) => ChatScreen(),  // 로그인 성공 시 ChatScreen으로 이동
            ),
          );
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => sign_sns[word], // 각 SNS에 맞는 화면으로 이동
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
          gradient: type == 2
              ? LinearGradient(
              colors: [ui_colors[3], ui_colors[4]],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight)
              : null,
          color: ui_colors[type],
          borderRadius: BorderRadius.all(Radius.circular(80)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: word == 5 ? 0 : 20,
            ),
            Image.asset(sns_logos[word > 4 ? 4 : word],
                scale: word >= 5 ? 100 : 1),
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
  final int type;  // 필드 타입을 구분하는 변수
  infield(this.type);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 380,
      child: TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(
            type == 4 ? Icons.email : Icons.lock,  // 이메일과 비밀번호 아이콘
          ),
          contentPadding: EdgeInsets.all(20),
          hintText: type == 4 ? 'Email' : 'Password',  // 필드 타입에 따라 힌트 텍스트 변경
          hintStyle: TextStyle(color: Colors.grey),
          filled: true,
          fillColor: Colors.grey[200],  // 배경색 설정
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
        ),
        obscureText: type == 5,  // 비밀번호 필드는 입력 내용을 숨김 처리
      ),
    );
  }
}


class LoginScreen extends StatelessWidget {  // 기존의 login 클래스를 LoginScreen 클래스로 수정
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background_color[0],
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    login_titles[0],
                    style: GoogleFonts.abhayaLibre(
                      color: font_colors[0],
                      fontSize: 28,
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
                    login_texts[0],
                    style: TextStyle(
                      fontSize: 14,
                      color: font_colors[2],
                    ),
                  ),
                ],
              ),
              infield(4),  // 이메일 입력 필드
              SizedBox(
                height: 28,
              ),
              infield(5),  // 비밀번호 입력 필드
              SizedBox(
                height: 28,
              ),
              RichText(
                text: TextSpan(
                  text: login_texts[1],
                  style: TextStyle(
                    fontSize: 13,
                    color: font_colors[0],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              new_button(5, 2),  // 로그인 버튼을 눌렀을 때 ChatScreen으로 이동
              SizedBox(
                height: 6,
              ),
              SizedBox(
                height: 12,
              ),
              new_button(0, 6),  // SNS 로그인 버튼
              SizedBox(
                height: 6,
              ),
              new_button(1, 6),  // SNS 로그인 버튼
              SizedBox(
                height: 6,
              ),
              new_button(2, 6),  // SNS 로그인 버튼
              SizedBox(
                height: 6,
              ),
              new_button(3, 6),  // SNS 로그인 버튼
              Text(
                'Or',
                style: TextStyle(
                  color: font_colors[0],
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: login_texts[3],
                      style: TextStyle(
                        fontSize: 12,
                        color: font_colors[3],
                      ),
                    ),
                    TextSpan(
                      text: login_texts[4],
                      style: TextStyle(
                        fontSize: 12,
                        color: font_colors[4],
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => sign(),  // 회원가입 화면으로 이동
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
      ),
    );
  }
}
