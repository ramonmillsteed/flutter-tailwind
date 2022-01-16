import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tailwind/utilities/breakpoints.dart';
import 'package:tailwind/utilities/colors.dart';
import 'package:tailwind/utilities/font_heights.dart';
import 'package:tailwind/utilities/font_sizes.dart';
import 'package:tailwind/utilities/font_weights.dart';
import 'package:tailwind/utilities/asset_paths.dart';
import 'package:tailwind/views/description_grid_list.dart';
import 'package:tailwind/views/profile_grid_list.dart';
import 'package:tailwind/views/tab_list.dart';
import 'package:tailwind/widgets/button.dart';
import 'package:tailwind/widgets/circular_avatar.dart';
import 'package:tailwind/widgets/description_tile.dart';
import 'package:tailwind/widgets/divider.dart';
import 'package:tailwind/widgets/hoverable_builder.dart';

class DirectoryProfile extends StatelessWidget {
  static const String _unsplashUrl = 'https://images.unsplash.com/photo';
  static const String _bannerUrl = '$_unsplashUrl-1444628838545-ac4016a5418a'
      '?fit=crop&w=1950&q=80';
  static const String _avatarUrl = '$_unsplashUrl-1463453091185-61582044d556'
      '?fit=facearea&facepad=8&w=1024&h=1024&q=80';

  const DirectoryProfile({Key? key}) : super(key: key);

  double _horizontalPadding(double width) =>
      (width < Breakpoints.sm ? 4 : (width < Breakpoints.lg ? 6 : 8));

  double _avatarTopPadding(double width) =>
      (width < Breakpoints.sm ? 19 : (width < Breakpoints.lg ? 15 : 31));

  @override
  Widget build(BuildContext context) {
    double pageWidth = MediaQuery.of(context).size.width;
    return ListView(
      children: [
        if (pageWidth < Breakpoints.xl) ...[
          _buildBreadcrumb(context, pageWidth),
        ],
        Stack(
          children: [
            _buildBanner(context, pageWidth),
            _buildHeader(context, pageWidth),
          ],
        ),
        const Divider(),
        _buildBody(context, pageWidth),
      ],
    );
  }

  Widget _buildBreadcrumb(BuildContext context, double pageWidth) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: (_horizontalPadding(pageWidth) - 2) * 4,
        vertical: 3 * 4,
      ),
      alignment: Alignment.centerLeft,
      child: _buildDirectoryButton(context),
    );
  }

  Widget _buildDirectoryButton(BuildContext context) {
    return HoverableBuilder(
      builder: (BuildContext context, bool hovered) {
        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              solidIcon('chevron-left'),
              color: Colors.gray400,
            ),
            const SizedBox(
              width: 3 * 4,
            ),
            const Text(
              'Directory',
              style: TextStyle(
                fontSize: FontSizes.sm,
                height: FontHeights.sm,
                fontWeight: FontWeights.medium,
                color: Colors.gray900,
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildHeader(BuildContext context, double pageWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: _horizontalPadding(pageWidth) * 4,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: _avatarTopPadding(pageWidth) * 4,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              _buildAvatar(context, pageWidth),
              if (pageWidth >= Breakpoints.sm) ...[
                _buildWideButtons(context),
              ],
            ],
          ),
          const SizedBox(
            height: 5 * 4,
          ),
          _buildName(context),
          const SizedBox(
            height: 2 * 4,
          ),
          if (pageWidth < Breakpoints.sm) ...[
            _buildNarrowButtons(context),
          ],
          const TabList(),
        ],
      ),
    );
  }

  Widget _buildBanner(BuildContext context, double pageWidth) {
    return Image.network(
      _bannerUrl,
      width: double.maxFinite,
      height: (pageWidth < Breakpoints.lg ? 32 : 48) * 4,
      fit: BoxFit.cover,
    );
  }

  Widget _buildAvatar(BuildContext context, double pageWidth) {
    return Container(
      decoration: const ShapeDecoration(
        shape: CircleBorder(),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(1 * 4),
      child: CircularAvatar(
        imageUrl: _avatarUrl,
        size: (pageWidth < Breakpoints.sm ? 24 : 32) * 4,
      ),
    );
  }

  Widget _buildWideButtons(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 1 * 4,
      ),
      child: Row(
        children: [
          _buildMessageButton(context),
          const SizedBox(
            width: 4 * 4,
          ),
          _buildCallButton(context),
        ],
      ),
    );
  }

  Widget _buildName(BuildContext context) {
    return const Text(
      'Ricardo Cooper',
      style: TextStyle(
        fontSize: FontSizes.xxl,
        height: FontHeights.xxl,
        fontWeight: FontWeights.bold,
        color: Colors.gray900,
      ),
    );
  }

  Widget _buildNarrowButtons(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 4 * 4,
        ),
        _buildMessageButton(context),
        const SizedBox(
          height: 3 * 4,
        ),
        _buildCallButton(context),
        const SizedBox(
          height: 6 * 4,
        ),
      ],
    );
  }

  Widget _buildMessageButton(BuildContext context) {
    return Button(
      icon: solidIcon('mail'),
      label: 'Message',
    );
  }

  Widget _buildCallButton(BuildContext context) {
    return Button(
      icon: solidIcon('phone'),
      label: 'Call',
    );
  }

  Widget _buildBody(BuildContext context, double pageWidth) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: _horizontalPadding(pageWidth) * 4,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 6 * 4,
          ),
          DescriptionGridList(
            rows: pageWidth < Breakpoints.sm ? 1 : 2,
          ),
          const SizedBox(
            height: 8 * 4,
          ),
          _buildAboutDescriptionTile(context),
          const SizedBox(
            height: 8 * 4,
          ),
          _buildTeamMemberHeader(context),
          const SizedBox(
            height: 1 * 4,
          ),
          ProfileGridList(
            rows: pageWidth < Breakpoints.sm ? 1 : 2,
          ),
          const SizedBox(
            height: 12 * 4,
          ),
        ],
      ),
    );
  }

  Widget _buildAboutDescriptionTile(BuildContext context) {
    return const DescriptionTile(
      title: 'About',
      subtitle:
          'Tincidunt quam neque in cursus viverra orci, dapibus nec tristique. '
          'Nullam ut sit dolor consectetur urna, dui cras nec sed. Cursus '
          'risus congue arcu aenean posuere aliquam.\n'
          '\n'
          'Et vivamus lorem pulvinar nascetur non. Pulvinar a sed platea '
          'rhoncus ac mauris amet. Urna, sem pretium sit pretium urna, '
          'senectus vitae. Scelerisque fermentum, cursus felis dui suspendisse '
          'velit pharetra. Augue et duis cursus maecenas eget quam lectus. '
          'Accumsan vitae nascetur pharetra rhoncus praesent dictum risus '
          'suspendisse.',
    );
  }

  Widget _buildTeamMemberHeader(BuildContext context) {
    return const Text(
      'Team members',
      style: TextStyle(
        fontSize: FontSizes.sm,
        height: FontHeights.sm,
        fontWeight: FontWeights.medium,
        color: Colors.gray500,
      ),
    );
  }
}
