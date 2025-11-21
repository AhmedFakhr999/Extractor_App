import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ocr/constants/typography.dart';
import 'package:ocr/helper/bottom_bar/show_bottom.dart';

class CustomeBtn extends StatelessWidget {
  final BuildContext? context;
  final VoidCallback? onImport;
  final VoidCallback? onLive;
  final bool isLoading;

  const CustomeBtn({
    super.key,
    this.context,
    this.onImport,
    this.onLive,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: isLoading
          ? null
          : () {
              show_bottom_bar(context, onImport);
            },
      child: Container(
        alignment: Alignment.center,
        width: 189.w,
        height: 48.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: const Color.fromARGB(255, 18, 127, 237),
        ),
        child: isLoading
            ? const CircularProgressIndicator(color: Colors.white)
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.camera_alt_outlined, color: Colors.white),
                  SizedBox(width: 10.w),
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
