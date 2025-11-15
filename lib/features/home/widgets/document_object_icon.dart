import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DocumentObjectIcon extends StatelessWidget {
  DocumentObjectIcon({super.key, required this.documentIcon});
  IconData documentIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48.w,
      height: 48.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: Color.fromARGB(170, 232, 237, 242),
      ),
      child: Icon(documentIcon, color: Colors.grey),
    );
  }
}
