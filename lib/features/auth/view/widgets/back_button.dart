// import 'package:e_commerce/core/theme/color.dart';
import 'package:flutter/material.dart';

class Back extends StatelessWidget {
  const Back({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
        minimumSize: Size(40, 40),
        maximumSize: Size(40, 40),

        // backgroundColor: ThemeColor.bg_light,
        padding: EdgeInsets.all(12),
      ),
      onPressed: () {
        // Navigator.pop(context);
      },
      child: Icon(Icons.arrow_back_ios, size: 16),
    );
  }
}
