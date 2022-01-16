import 'package:flutter/widgets.dart';
import 'package:tailwind/utilities/colors.dart';
import 'package:tailwind/utilities/font_heights.dart';
import 'package:tailwind/utilities/font_sizes.dart';
import 'package:tailwind/utilities/font_weights.dart';
import 'package:tailwind/widgets/circular_avatar.dart';

class ImageTile extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;

  const ImageTile({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircularAvatar(
          imageUrl: imageUrl,
          size: 10 * 4,
        ),
        const SizedBox(
          width: 3 * 4,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTitle(context),
              _buildSubtitle(context),
            ],
          ),
        ),
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
        color: Colors.gray900,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _buildSubtitle(BuildContext context) {
    return Text(
      subtitle,
      style: const TextStyle(
        fontSize: FontSizes.sm,
        height: FontHeights.sm,
        color: Colors.gray500,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}
