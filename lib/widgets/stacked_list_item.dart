import 'package:flutter/widgets.dart';
import 'package:tailwind/utilities/colors.dart';
import 'package:tailwind/widgets/hoverable_builder.dart';
import 'package:tailwind/widgets/image_tile.dart';

class StackedListItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtitle;

  const StackedListItem({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HoverableBuilder(
      builder: (BuildContext context, bool hovered) {
        return Container(
          color: hovered ? Colors.gray50 : null,
          padding: const EdgeInsets.symmetric(
            horizontal: 6 * 4,
            vertical: 5 * 4,
          ),
          child: ImageTile(
            imageUrl: imageUrl,
            title: title,
            subtitle: subtitle,
          ),
        );
      },
    );
  }
}
