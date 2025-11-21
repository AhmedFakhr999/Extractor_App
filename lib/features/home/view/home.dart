import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ocr/core/services/file_picker/file_picker_helper.dart';
import 'package:ocr/features/home/cubit/home_cubit.dart';
import 'package:ocr/features/home/widgets/home_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      body: BlocProvider(
        create:(context) => HomeCubit(FileService()),
        child: HomeBody()),
    );
  }
}