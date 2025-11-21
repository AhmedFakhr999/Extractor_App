import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ocr/features/home/widgets/document_objects.dart';

Future<dynamic> show_bottom_bar(BuildContext context, Function()? onTap) {
  return showModalBottomSheet(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    builder: (context) {
      return Container(
        height: 200.h,
        child: Column(
          children: [
            SizedBox(height: 30.h),
            DocumentObject(
              onTap: () {
                try {
                  Navigator.pop(context); // Close the bottom sheet first
                  onTap?.call();
                } catch (e) {
                  log(e.toString());
                  log(StackTrace.current.toString());
                }
                // Then call the function
              },
              documentObjectIcon: Icons.photo_library,
              documentText: 'Import',
              documentSubText: 'Gallery',
            ),
          ],
        ),
      );
    },
    context: context,
    isDismissible: true,
    isScrollControlled: true,
  );
}
