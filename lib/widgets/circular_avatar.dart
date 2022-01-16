import 'package:flutter/widgets.dart';

class CircularAvatar extends StatelessWidget {
  final String imageUrl;
  final double size;

  const CircularAvatar({
    Key? key,
    required this.imageUrl,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Image.network(
        imageUrl,
        width: size,
        height: size,
      ),
    );
  }
}
