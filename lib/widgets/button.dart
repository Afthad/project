import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Button extends StatelessWidget {
  final String text;
  final Widget? widget;
  final Color color;
  final Color textColor;
  final double width;
  final Function()? onPressed;
  const Button(
      {super.key,
      required this.text,
      required this.color,
      this.width = 180,
      this.widget,
      this.onPressed,
      required this.textColor});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        minWidth: width,
        height: 48,
        shape: RoundedRectangleBorder(
            side: const BorderSide(width: .1),
            borderRadius: BorderRadius.circular(8)),
        color: color,
        elevation: 0,
        onPressed: onPressed,
        child: widget ??
            Text(
              style: GoogleFonts.quicksand(
                  textStyle: TextStyle(
                      fontSize: 14,
                      color: textColor,
                      fontWeight: FontWeight.w700)),
              text,
            ));
  }
}
