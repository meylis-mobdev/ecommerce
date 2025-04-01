import 'package:e_commerce/core/theme/color.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
    this.value, {
    super.key,
    required this.onPressed,
    this.widget,
  });

  final Widget? widget;

  final String value;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(backgroundColor: ThemeColor.primary_100),
      child:
          widget ?? Text(value, style: TextStyle(color: ThemeColor.white_100)),
    );
  }
}
