import 'package:flutter/material.dart';
import 'package:untitled1/const/const.dart';

class success extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background_color[0],
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: 325,
              height: 429,
              color: ui_colors[2],
            )
          ],
        ),
      ),
    );
  }
}
