import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ocr/core/widgets/image_manager/cubit/cubit/image_manager_state.dart';
import 'package:ocr/core/widgets/image_manager/image_manager_view.dart';
import 'package:ocr/features/home/widgets/document_objects.dart';
import 'package:ocr/helper/bottom_bar/cubit/bottom_bar_cubit.dart';

Future<dynamic> show_bottom_bar(BuildContext context) {
  return showModalBottomSheet(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ), //for the round edges
    builder: (context) {
      return Container(
        height: 200.h,
        child: Column(
          children: [
            SizedBox(height: 30),
            DocumentObject(
              onTap: () {
                ImageManagerView(
                      onImagePicked: (image)=> BottomBarCubit.get(context).image = image,
                      imageBuilder:(image){
                        return CustomAuthImage(image: FileImage(File(image.path)),);
                      },
                      
                    ),
              },
              documentObjectIcon: Icons.photo_library,
              documentText: 'Import',
              documentSubText: 'Gallery',
            ),
          ],
        ), //what you want to have inside, I suggest using a column
      );
    },
    context: context,
    isDismissible: true, //boolean if you want to be able to dismiss it
    isScrollControlled: true, //boolean if something does not display, try that
  );
}
