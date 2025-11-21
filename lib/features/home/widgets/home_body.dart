import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:ocr/constants/typography.dart';
import 'package:ocr/features/home/cubit/home_cubit.dart';
import 'package:ocr/features/home/widgets/custome_btn.dart';
import 'package:ocr/features/home/widgets/document_objects.dart';
import 'package:ocr/features/home/widgets/selections.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

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

  void _handleFilePicked(PlatformFile? file) {
    if (file != null) {
      // Show success dialog or navigate to next screen
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('File Selected'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Name: ${file.name}'),
              Text('Size: ${(file.size / 1024).toStringAsFixed(2)} KB'),
              Text('Extension: ${file.extension}'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        ),
      );
      
      // You can also navigate to another screen or process the file here
      // Navigator.push(context, MaterialPageRoute(builder: (context) => NextScreen(file: file)));
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is HomeSuccess) {
          _handleFilePicked(state.file);
        } else if (state is HomeFailure) {
          _showError(state.message);
        }
      },
      child: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 30.h),
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
              SizedBox(height: 30.h),
              BlocBuilder<HomeCubit, HomeState>(
                builder: (context, state) {
                  if(state == HomeLoading){
                    return CircularProgressIndicator();
                  }
                  return CustomeBtn(
                    context: context,
                    
                    onImport: () {
                      context.read<HomeCubit>().pickFile();
                    },
                  );
                },
              ),
              SizedBox(height: 30.h),
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
              SizedBox(height: 20.h),
              DocumentObject(
                onTap: () {},
                documentObjectIcon: Icons.file_present_outlined,
                documentText: 'Document1',
                documentSubText: 'Extracted Text from the file',
              ),
            ],
          ),
        ),
      ),
    );
  }
}