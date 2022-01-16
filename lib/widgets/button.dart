import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tailwind/utilities/colors.dart';
import 'package:tailwind/utilities/font_heights.dart';
import 'package:tailwind/utilities/font_sizes.dart';
import 'package:tailwind/utilities/font_weights.dart';
import 'package:tailwind/utilities/rounded.dart';
import 'package:tailwind/utilities/shadows.dart';
import 'package:tailwind/widgets/hoverable_builder.dart';

class Button extends StatelessWidget {
  final String icon;
  final String? label;

  const Button({Key? key, required this.icon, this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HoverableBuilder(
      builder: (BuildContext context, bool hovered) {
        return Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.gray300,
            ),
            borderRadius: Rounded.md,
            color: hovered ? Colors.gray50 : Colors.white,
            boxShadow: Shadows.sm,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 3.5 * 4,
            vertical: 2 * 4,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildIcon(context),
              if (label != null) ...[
                const SizedBox(
                  width: 2 * 4,
                ),
                _buildLabel(context),
              ],
            ],
          ),
        );
      },
    );
  }

  Widget _buildIcon(BuildContext context) {
    return SvgPicture.asset(
      icon,
      color: Colors.gray400,
    );
  }

  Widget _buildLabel(BuildContext context) {
    return Text(
      label ?? '',
      style: const TextStyle(
        fontSize: FontSizes.sm,
        height: FontHeights.sm,
        fontWeight: FontWeights.medium,
        color: Colors.gray700,
      ),
    );
  }
}
