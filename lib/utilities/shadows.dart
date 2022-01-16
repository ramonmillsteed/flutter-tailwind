import 'package:flutter/painting.dart';
import 'package:tailwind/utilities/colors.dart';

class Shadows {
  static final List<BoxShadow> sm = [
    BoxShadow(
      offset: const Offset(0, 1),
      blurRadius: 2,
      color: Colors.black.withOpacity(0.05),
    ),
  ];
}
