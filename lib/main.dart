import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ocr/routes/routes.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

const supabaseUrl = 'https://nksffffgkybuucmilvqr.supabase.co';
const supabaseKey = String.fromEnvironment('SUPABASE_KEY');

Future<void> main() async {
  try {
    await Supabase.initialize(url: supabaseUrl, anonKey: supabaseKey);
    log('Supabase Initialized successfully');
  } on Exception catch (e) {
    log('Failed to connecto to supabase');
    log(e.toString());
    log(StackTrace.current.toString());
  }
  runApp(Ocr());
}

class Ocr extends StatelessWidget {
  const Ocr({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(390, 844),
      child: MaterialApp.router(routerConfig: Routes.router),
    );
  }
}
