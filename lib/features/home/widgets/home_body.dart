import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:ocr/constants/typography.dart';
import 'package:ocr/features/home/widgets/custome_btn.dart';
import 'package:ocr/features/home/widgets/document_objects.dart';
import 'package:ocr/features/home/widgets/selections.dart';

class HomeBody extends StatefulWidget {
  HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  Map<IconData, String> icons = {
    Icons.camera_alt: 'Camera',
    Icons.image: 'Gallery',
    Icons.text_fields: 'Text',
    Icons.settings: 'Settings',
  };
  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          spacing: 30.h,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                SizedBox(width: 120.w),
                Text(
                  'Extractor',
                  style: Typogaphy.bold.copyWith(fontSize: 18.sp),
                ),
                SizedBox(width: 100.w),
                Icon(Icons.settings),
              ],
            ),

            CustomeBtn(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: 30.w),
                Container(
                  child: Text(
                    'Recent Scans',
                    style: Typogaphy.bold.copyWith(fontSize: 22),
                  ),
                ),
              ],
            ),
            DocumentObject(),
          ],
        ),
      ),
    );
  }
}
