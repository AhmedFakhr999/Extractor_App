import 'package:flutter/material.dart';

class Selections extends StatelessWidget {
  const Selections({super.key, required this.icon});
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.white, width: 2),
          bottom: BorderSide(color: Colors.white, width: 2),
          left: BorderSide(color: Colors.white, width: 2),
          right: BorderSide(color: Colors.white, width: 2),
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Icon(icon, size: 50, color: Colors.white),
    );
  }
}
