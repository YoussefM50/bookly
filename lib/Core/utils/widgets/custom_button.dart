// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bookly/Core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {Key? key,
      required this.backgroundColor,
      required this.textColor,
      required this.borderRadius,
      required this.buttonText, required this.onPressed})
      : super(key: key);
  final Color backgroundColor;
  final Color textColor;
  final BorderRadius? borderRadius;
  final String buttonText;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
          style: TextButton.styleFrom(
              backgroundColor: backgroundColor,
              shape: RoundedRectangleBorder(
                  borderRadius: borderRadius ?? BorderRadius.circular(12))),
          onPressed: onPressed,
          child: Text(
            buttonText,
            style: Styles.textstyle18
                .copyWith(fontWeight: FontWeight.w900, color: textColor),
          )),
    );
  }
}
