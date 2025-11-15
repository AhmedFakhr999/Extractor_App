import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ocr/constants/typography.dart';
import 'package:ocr/helper/bottom_bar/show_bottom.dart';

class CustomeBtn extends StatelessWidget {
  BuildContext? context;
  CustomeBtn({super.key, this.context});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        show_bottom_bar(context);
      },
      child: Container(
        alignment: Alignment.center,
        width: 189.w,
        height: 48.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: Color.fromARGB(255, 18, 127, 237),
        ),
        child: Row(
          spacing: 10.w,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.camera_alt_outlined, color: Colors.white),
            Text(
              'Start Scanning',
              style: Typogaphy.bold.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
