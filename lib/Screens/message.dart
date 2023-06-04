import 'package:flutter/material.dart';
import 'package:foodie/utils/colors.dart';

class LastPage extends StatelessWidget {
  const LastPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final maxWidth = constraints.maxWidth;
          final fontSize = maxWidth * 0.15;
          final letterSpacing = maxWidth * 0.01;
          final padding = EdgeInsets.symmetric(horizontal: maxWidth * 0.1);

          return Center(
            child: Padding(
              padding: padding,
              child: Text(
                'GOOD JOB',
                style: TextStyle(
                  fontFamily: 'LilitaOne',
                  fontWeight: FontWeight.w400,
                  fontSize: fontSize,
                  letterSpacing: letterSpacing,
                  color: ColorsPalette.primaryColor,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

