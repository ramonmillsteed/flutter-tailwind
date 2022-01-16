import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tailwind/utilities/colors.dart';
import 'package:tailwind/utilities/asset_paths.dart';
import 'package:tailwind/widgets/hoverable_builder.dart';

class Navbar extends StatelessWidget {
  static const String _logoName = 'workflow-mark-pink-500';

  final VoidCallback onMenuPressed;

  const Navbar({
    Key? key,
    required this.onMenuPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.gray200,
          ),
        ),
        color: Colors.gray50,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 1.5 * 4,
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 4 * 4,
          ),
          SvgPicture.asset(logo(_logoName)),
          const Spacer(),
          _buildMenuButton(context),
          const SizedBox(
            width: 1 * 4,
          ),
        ],
      ),
    );
  }

  Widget _buildMenuButton(BuildContext context) {
    return HoverableBuilder(
      builder: (BuildContext context, bool hovered) {
        return Container(
          height: 12 * 4,
          width: 12 * 4,
          alignment: Alignment.center,
          child: SvgPicture.asset(
            outlineIcon('menu'),
            color: hovered ? Colors.gray900 : Colors.gray500,
          ),
        );
      },
      onTap: onMenuPressed,
    );
  }
}
