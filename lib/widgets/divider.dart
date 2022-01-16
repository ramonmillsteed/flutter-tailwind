import 'package:flutter/widgets.dart';
import 'package:tailwind/utilities/colors.dart';

class Divider extends StatelessWidget {
  const Divider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      color: Colors.gray200,
    );
  }
}
