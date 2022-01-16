import 'package:flutter/widgets.dart';
import 'package:tailwind/utilities/colors.dart';
import 'package:tailwind/utilities/rounded.dart';
import 'package:tailwind/utilities/shadows.dart';
import 'package:tailwind/widgets/hoverable_builder.dart';

class Card extends StatelessWidget {
  final Widget child;

  const Card({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HoverableBuilder(
      builder: (BuildContext context, bool hovered) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: hovered ? Colors.gray400 : Colors.gray300,
            ),
            borderRadius: Rounded.lg,
            color: Colors.white,
            boxShadow: Shadows.sm,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 6 * 4,
            vertical: 5 * 4,
          ),
          child: child,
        );
      },
    );
  }
}
