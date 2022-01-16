import 'package:flutter/widgets.dart';
import 'package:tailwind/pages/multi_column_directory.dart';
import 'package:tailwind/utilities/colors.dart';
import 'package:tailwind/utilities/font_heights.dart';
import 'package:tailwind/utilities/font_sizes.dart';
import 'package:tailwind/utilities/font_weights.dart';

class TailwindApp extends StatelessWidget {
  const TailwindApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery.fromWindow(
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: DefaultTextStyle(
          style: _buildTextStyle(context),
          child: ColoredBox(
            color: Colors.white,
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              child: const MultiColumnDirectory(),
              onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            ),
          ),
        ),
      ),
    );
  }

  TextStyle _buildTextStyle(BuildContext context) {
    return const TextStyle(
      fontFamily: 'Inter',
      fontSize: FontSizes.base,
      height: FontHeights.base,
      fontWeight: FontWeights.normal,
      color: Colors.black,
    );
  }
}
