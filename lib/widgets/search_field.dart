import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tailwind/utilities/colors.dart';
import 'package:tailwind/utilities/font_heights.dart';
import 'package:tailwind/utilities/font_sizes.dart';
import 'package:tailwind/utilities/asset_paths.dart';
import 'package:tailwind/utilities/rounded.dart';
import 'package:tailwind/utilities/shadows.dart';

class SearchField extends StatefulWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  final TextEditingController _controller = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  bool _empty = true;
  bool _focused = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {
        _empty = _controller.text.isEmpty;
      });
    });
    _focusNode.addListener(() {
      setState(() {
        _focused = _focusNode.hasFocus;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: MouseRegion(
        cursor: SystemMouseCursors.text,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: Rounded.md,
            border: Border.all(
              color: Colors.gray300,
            ),
            boxShadow: Shadows.sm,
            color: Colors.white,
          ),
          foregroundDecoration: BoxDecoration(
            borderRadius: Rounded.md,
            border: Border.all(
              width: 2,
              color: _focused ? Colors.pink500 : Colors.transparent,
            ),
          ),
          padding: const EdgeInsets.all(2.5 * 4),
          child: Row(
            children: [
              _buildIcon(context),
              const SizedBox(
                width: 2 * 4,
              ),
              Expanded(
                child: _buildTextField(context),
              ),
            ],
          ),
        ),
      ),
      onTap: () => _focusNode.requestFocus(),
    );
  }

  Widget _buildIcon(BuildContext context) {
    return SvgPicture.asset(
      solidIcon('search'),
      color: Colors.gray400,
    );
  }

  Widget _buildTextField(BuildContext context) {
    return Stack(
      children: [
        if (_empty) ...[
          _buildPlaceholder(context),
        ],
        _buildEditableText(context),
      ],
    );
  }

  Widget _buildPlaceholder(BuildContext context) {
    return const Text(
      'Search',
      style: TextStyle(
        fontSize: FontSizes.sm,
        height: FontHeights.sm,
        color: Colors.gray500,
      ),
    );
  }

  Widget _buildEditableText(BuildContext context) {
    return EditableText(
      forceLine: false,
      controller: _controller,
      focusNode: _focusNode,
      style: const TextStyle(
        fontSize: FontSizes.sm,
        height: FontHeights.sm,
        color: Colors.gray900,
      ),
      backgroundCursorColor: Colors.transparent,
      cursorColor: Colors.gray900,
    );
  }
}
