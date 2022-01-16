import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tailwind/utilities/colors.dart';
import 'package:tailwind/utilities/asset_paths.dart';
import 'package:tailwind/utilities/unsplash_avatar.dart';
import 'package:tailwind/widgets/divider.dart';
import 'package:tailwind/widgets/sidebar_item.dart';
import 'package:tailwind/widgets/sidebar_profile_tile.dart';

class Sidebar extends StatelessWidget {
  static const String _logoName = 'workflow-logo-pink-500-mark-gray-900-text';

  final bool floating;

  const Sidebar({Key? key, this.floating = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: (floating ? 80 : 64) * 4,
      decoration: BoxDecoration(
        border: floating
            ? null
            : const Border(
                right: BorderSide(
                  color: Colors.gray200,
                ),
              ),
        color: floating ? Colors.white : Colors.gray100,
      ),
      child: Column(
        children: [
          Expanded(
            child: _buildLogoAndItems(context),
          ),
          const Divider(),
          Padding(
            padding: const EdgeInsets.all(4 * 4),
            child: SidebarProfileTile(
              floating: floating,
              imageUrl: unsplashAvatar('1472099645785-5658abf4ff4e'),
              name: 'Tom Cook',
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLogoAndItems(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(
        vertical: 5 * 4,
      ),
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 4 * 4,
          ),
          alignment: Alignment.centerLeft,
          child: SvgPicture.asset(logo(_logoName)),
        ),
        const SizedBox(
          height: 5 * 4,
        ),
        _buildItems(context),
      ],
    );
  }

  Widget _buildItems(BuildContext context) {
    return Column(
      children: [
        _buildItem(context, false, outlineIcon('home'), 'Dashboard'),
        const SizedBox(
          height: 1 * 4,
        ),
        _buildItem(context, false, outlineIcon('calendar'), 'Calendar'),
        const SizedBox(
          height: 1 * 4,
        ),
        _buildItem(context, false, outlineIcon('user-group'), 'Teams'),
        const SizedBox(
          height: 1 * 4,
        ),
        _buildItem(context, true, outlineIcon('search-circle'), 'Directory'),
        const SizedBox(
          height: 1 * 4,
        ),
        _buildItem(
          context,
          false,
          outlineIcon('speakerphone'),
          'Announcements',
        ),
        const SizedBox(
          height: 1 * 4,
        ),
        _buildItem(context, false, outlineIcon('map'), 'Office Map'),
        const Padding(
          padding: EdgeInsets.symmetric(
            vertical: 5 * 4,
          ),
          child: Divider(),
        ),
        _buildItem(context, false, outlineIcon('view-grid-add'), 'Apps'),
        const SizedBox(
          height: 1 * 4,
        ),
        _buildItem(context, false, outlineIcon('cog'), 'Settings'),
      ],
    );
  }

  Widget _buildItem(
    BuildContext context,
    bool current,
    String icon,
    String label,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 2 * 4,
      ),
      child: SidebarItem(
        current: current,
        floating: floating,
        icon: icon,
        label: label,
      ),
    );
  }
}
