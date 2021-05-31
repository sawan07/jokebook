import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:jokebook/assets/brand_colors.dart';

class CategoryButton extends StatelessWidget {
  final String title;
  final Color color;
  final Function onPressed;

  CategoryButton({ this.title, this.color, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          alignment: Alignment.center,
            minimumSize: Size(400, 70),
            padding: EdgeInsets.all(40),
            textStyle: const TextStyle(fontSize: 20), primary: color),
        child: Text(title),
      ),
    );
  }
}

class CustomAnimatedButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  CustomAnimatedButton({this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AnimatedButton(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 22,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        onPressed: onPressed,
        color: BrandColors.colorPrimary,
      ),
    );
  }
}
