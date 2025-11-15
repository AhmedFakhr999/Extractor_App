import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ocr/constants/typography.dart';

class DocumentObject extends StatelessWidget {
  const DocumentObject({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: 30.w),
          Container(
            width: 48.w,
            height: 48.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.r),
              color: Color.fromARGB(170, 232, 237, 242),
            ),
            child: Icon(Icons.upload_file_rounded, color: Colors.grey),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Document 1',
                style: Typogaphy.medium.copyWith(fontSize: 16),
              ),
              Text(
                'Extracted text from document',
                style: Typogaphy.regular.copyWith(
                  color: Color.fromARGB(196, 77, 115, 153),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
