import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ocr/constants/typography.dart';

class CustomeBtn extends StatelessWidget {
  const CustomeBtn({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
