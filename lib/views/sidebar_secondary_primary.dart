import 'package:flutter/widgets.dart';
import 'package:tailwind/utilities/breakpoints.dart';
import 'package:tailwind/utilities/colors.dart';

class SidebarSecondaryPrimary extends StatelessWidget {
  final Widget sidebar;
  final Widget secondary;
  final Widget primary;

  const SidebarSecondaryPrimary({
    Key? key,
    required this.sidebar,
    required this.secondary,
    required this.primary,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double pageWidth = MediaQuery.of(context).size.width;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (pageWidth >= Breakpoints.lg) ...[
          sidebar,
        ],
        if (pageWidth >= Breakpoints.xl) ...[
          _buildSecondary(context),
        ],
        Expanded(
          child: primary,
        ),
      ],
    );
  }

  Widget _buildSecondary(BuildContext context) {
    return Container(
      width: 96 * 4,
      decoration: const BoxDecoration(
        border: Border(
          right: BorderSide(
            color: Colors.gray200,
          ),
        ),
      ),
      child: secondary,
    );
  }
}
