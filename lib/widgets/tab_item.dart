import 'package:flutter/widgets.dart';
import 'package:tailwind/utilities/colors.dart';
import 'package:tailwind/utilities/font_heights.dart';
import 'package:tailwind/utilities/font_sizes.dart';
import 'package:tailwind/utilities/font_weights.dart';
import 'package:tailwind/widgets/hoverable_builder.dart';

class TabItem extends StatelessWidget {
  final bool current;
  final String label;

  const TabItem({
    Key? key,
    required this.current,
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
    return _buildItem(context, Colors.pink500, Colors.gray900);
  }

  Widget _buildHoveredItem(BuildContext context) {
    return _buildItem(context, Colors.gray300, Colors.gray700);
  }

  Widget _buildDefaultItem(BuildContext context) {
    return _buildItem(context, Colors.transparent, Colors.gray500);
  }

  Widget _buildItem(
    BuildContext context,
    Color borderColor,
    Color labelColor,
  ) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            width: 2,
            color: borderColor,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 1 * 4,
        vertical: 4 * 4,
      ),
      child: _buildLabel(context, labelColor),
    );
  }

  Widget _buildLabel(BuildContext context, Color color) {
    return Text(
      label,
      style: TextStyle(
        fontSize: FontSizes.sm,
        height: FontHeights.sm,
        fontWeight: FontWeights.medium,
        color: color,
      ),
    );
  }
}
