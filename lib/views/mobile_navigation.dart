import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tailwind/utilities/asset_paths.dart';
import 'package:tailwind/utilities/breakpoints.dart';
import 'package:tailwind/utilities/colors.dart';
import 'package:tailwind/views/navbar.dart';
import 'package:tailwind/widgets/hoverable_builder.dart';

class MobileNavigation extends StatefulWidget {
  final Widget sidebar;
  final Widget child;

  const MobileNavigation({
    Key? key,
    required this.sidebar,
    required this.child,
  }) : super(key: key);

  @override
  State<MobileNavigation> createState() => _MobileNavigationState();
}

class _MobileNavigationState extends State<MobileNavigation> {
  static const Curve _animationCurve = Curves.easeInOut;
  static const Duration _animationDuration = Duration(
    milliseconds: 300,
  );

  bool _showSidebar = false;

  void showSidebar() {
    setState(() {
      _showSidebar = true;
    });
  }

  void hideSidebar() {
    setState(() {
      _showSidebar = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    double pageWidth = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (pageWidth < Breakpoints.lg) ...[
              Navbar(
                onMenuPressed: showSidebar,
              ),
            ],
            Expanded(
              child: widget.child,
            ),
          ],
        ),
        if (pageWidth < Breakpoints.lg) ...[
          _buildModal(context),
          _buildSidebar(context),
        ],
      ],
    );
  }

  Widget _buildModal(BuildContext context) {
    return AnimatedOpacity(
      curve: _animationCurve,
      duration: _animationDuration,
      opacity: _showSidebar ? 1 : 0,
      child: IgnorePointer(
        ignoring: !_showSidebar,
        child: GestureDetector(
          child: Container(
            width: double.maxFinite,
            height: double.maxFinite,
            color: Colors.gray600.withOpacity(0.75),
          ),
          onTap: hideSidebar,
        ),
      ),
    );
  }

  Widget _buildSidebar(BuildContext context) {
    return AnimatedPositioned(
      curve: _animationCurve,
      duration: _animationDuration,
      left: _showSidebar ? 0 : -90 * 4,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            child: widget.sidebar,
          ),
          Padding(
            padding: const EdgeInsets.all(4 * 4),
            child: _buildCloseButton(context),
          ),
        ],
      ),
    );
  }

  Widget _buildCloseButton(BuildContext context) {
    return HoverableBuilder(
      builder: (BuildContext context, bool hovered) {
        return SvgPicture.asset(
          outlineIcon('x'),
          color: Colors.white,
        );
      },
      onTap: hideSidebar,
    );
  }
}
