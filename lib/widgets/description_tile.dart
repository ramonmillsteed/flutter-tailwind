import 'package:flutter/widgets.dart';
import 'package:tailwind/utilities/colors.dart';
import 'package:tailwind/utilities/font_heights.dart';
import 'package:tailwind/utilities/font_sizes.dart';
import 'package:tailwind/utilities/font_weights.dart';

class DescriptionTile extends StatelessWidget {
  final String title;
  final String subtitle;

  const DescriptionTile({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle(context),
        const SizedBox(
          height: 1 * 4,
        ),
        _buildSubtitle(context),
      ],
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: FontSizes.sm,
        height: FontHeights.sm,
        fontWeight: FontWeights.medium,
        color: Colors.gray500,
      ),
    );
  }

  Widget _buildSubtitle(BuildContext context) {
    return Text(
      subtitle,
      style: const TextStyle(
        fontSize: FontSizes.sm,
        height: FontHeights.sm,
        color: Colors.gray900,
      ),
    );
  }
}
