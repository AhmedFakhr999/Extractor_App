import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ocr/constants/typography.dart';
import 'package:ocr/features/home/widgets/document_object_icon.dart';

class DocumentObject extends StatelessWidget {
  DocumentObject({
    super.key,
    required this.documentObjectIcon,
    required this.documentText,
   required this.documentSubText,
   required this.onTap
  });
  IconData documentObjectIcon;
  String documentText;
  String documentSubText;
  void Function() onTap;


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(width: 30.w),
            DocumentObjectIcon(documentIcon: documentObjectIcon),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  documentText,
                  style: Typogaphy.medium.copyWith(fontSize: 16),
                ),
                Text(
                  documentSubText!,
                  style: Typogaphy.regular.copyWith(
                    color: Color.fromARGB(196, 77, 115, 153),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
