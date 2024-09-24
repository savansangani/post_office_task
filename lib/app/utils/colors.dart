import 'package:flutter/material.dart';

class Colorz {
  // Gradients
  static const Color gradient2 = Color(0xffFF9153);

  static const LinearGradient gradientButton = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.4054, 0.9942],
    colors: [
      Color(0xFFef4444),
      gradient2,
    ],
  );
}
