import 'package:flutter/widgets.dart';
import 'package:tailwind/utilities/colors.dart';
import 'package:tailwind/utilities/font_heights.dart';
import 'package:tailwind/utilities/font_sizes.dart';
import 'package:tailwind/utilities/font_weights.dart';
import 'package:tailwind/widgets/circular_avatar.dart';
import 'package:tailwind/widgets/hoverable_builder.dart';

class SidebarProfileTile extends StatelessWidget {
  final bool floating;
  final String imageUrl;
  final String name;

  const SidebarProfileTile({
    Key? key,
    this.floating = false,
    required this.imageUrl,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HoverableBuilder(builder: (BuildContext context, bool hovered) {
      return Row(
        children: [
          CircularAvatar(
            imageUrl: imageUrl,
            size: (floating ? 10 : 9) * 4,
          ),
          const SizedBox(
            width: 3 * 4,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildName(context, hovered),
              _buildViewProfile(context, hovered),
            ],
          ),
        ],
      );
    });
  }

  Widget _buildName(BuildContext context, bool hovered) {
    return Text(
      name,
      style: TextStyle(
        fontSize: floating ? FontSizes.base : FontSizes.sm,
        height: floating ? FontHeights.base : FontHeights.sm,
        fontWeight: FontWeights.medium,
        color: hovered ? Colors.gray900 : Colors.gray700,
      ),
    );
  }

  Widget _buildViewProfile(BuildContext context, bool hovered) {
    return Text(
      'View profile',
      style: TextStyle(
        fontSize: floating ? FontSizes.sm : FontSizes.xs,
        height: floating ? FontHeights.sm : FontHeights.xs,
        fontWeight: FontWeights.medium,
        color: hovered ? Colors.gray700 : Colors.gray500,
      ),
    );
  }
}
