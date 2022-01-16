import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tailwind/utilities/colors.dart';
import 'package:tailwind/utilities/font_heights.dart';
import 'package:tailwind/utilities/font_sizes.dart';
import 'package:tailwind/utilities/font_weights.dart';
import 'package:tailwind/utilities/rounded.dart';
import 'package:tailwind/widgets/hoverable_builder.dart';

class SidebarItem extends StatelessWidget {
  final bool current;
  final bool floating;
  final String icon;
  final String label;

  const SidebarItem({
    Key? key,
    required this.current,
    this.floating = false,
    required this.icon,
    required this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HoverableBuilder(
      builder: (BuildContext context, bool hovered) {
        if (current) {
          return _buildCurrentItem(context);
        } else if (hovered) {
          return _buildHoveredItem(context);
        } else {
          return _buildDefaultItem(context);
        }
      },
    );
  }

  Widget _buildCurrentItem(BuildContext context) {
    return _buildItem(
      context,
      floating ? Colors.gray100 : Colors.gray200,
      Colors.gray500,
      Colors.gray900,
    );
  }

  Widget _buildHoveredItem(BuildContext context) {
    return _buildItem(context, Colors.gray50, Colors.gray500, Colors.gray900);
  }

  Widget _buildDefaultItem(BuildContext context) {
    return _buildItem(context, null, Colors.gray400, Colors.gray600);
  }

  Widget _buildItem(
    BuildContext context,
    Color? backgroundColor,
    Color iconColor,
    Color labelColor,
  ) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: Rounded.md,
        color: backgroundColor,
      ),
      padding: const EdgeInsets.all(2 * 4),
      child: Row(
        children: [
          _buildIcon(context, iconColor),
          SizedBox(
            width: (floating ? 4 : 3) * 4,
          ),
          _buildLabel(context, labelColor),
        ],
      ),
    );
  }

  Widget _buildIcon(BuildContext context, Color color) {
    return SvgPicture.asset(
      icon,
      color: color,
    );
  }

  Widget _buildLabel(BuildContext context, Color color) {
    return Text(
      label,
      style: TextStyle(
        fontSize: floating ? FontSizes.base : FontSizes.sm,
        height: floating ? FontHeights.base : FontHeights.sm,
        fontWeight: FontWeights.medium,
        color: color,
      ),
    );
  }
}
