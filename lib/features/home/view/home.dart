import 'package:flutter/material.dart';
import 'package:ocr/features/home/widgets/home_body.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      body: HomeBody(),
    );
  }
}