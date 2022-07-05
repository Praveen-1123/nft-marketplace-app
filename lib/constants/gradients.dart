import 'package:flutter/material.dart';

class AppGradients {
  final appGradient = LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0.3, 0.7, 1],
      colors: [Color(0xFFe6215f), Color(0xFF6d3086), Color(0xFF261d6f)]);
}
