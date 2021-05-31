import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:jokebook/assets/brand_colors.dart';
import 'package:jokebook/const/consts.dart';

class AnimatedTextWidget extends StatelessWidget {
  final String text;
  final AnimatedTextType animatedTextType;

  AnimatedTextWidget({this.text, this.animatedTextType});

  static const colorizeColors = [
    Colors.purple,
    Colors.cyan,
    Colors.blue,
    Colors.tealAccent,
  ];

  static const colorizeTextStyle = TextStyle(
    fontSize: 50.0,
    fontFamily: 'Travis-Zone',
  );

  @override
  Widget build(BuildContext context) {
    switch(animatedTextType){
      case(AnimatedTextType.Colorize):
        return Container(
            child:AnimatedTextKit(
              animatedTexts: [
                ColorizeAnimatedText(
                  text,
                  textStyle: colorizeTextStyle,
                  colors: colorizeColors,
                ),
              ],

              totalRepeatCount: 100,
              pause: const Duration(milliseconds: 1000),
              displayFullTextOnTap: true,
              stopPauseOnTap: true,
            )
        );
        break;
      case(AnimatedTextType.Typewriter):
        return Container(
          child: DefaultTextStyle(
            style: const TextStyle(
              fontSize: 45.0,
              fontFamily: 'spider-king-regular',
              color: BrandColors.colorPrimaryDark
            ),
            child: AnimatedTextKit(
              animatedTexts: [
                TypewriterAnimatedText(text,
                speed: Duration(milliseconds: 100)),
              ],
            ),
          ),
        );
        break;
    }
  }
}
