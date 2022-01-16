import 'package:flutter/widgets.dart';
import 'package:tailwind/utilities/colors.dart';
import 'package:tailwind/utilities/font_heights.dart';
import 'package:tailwind/utilities/font_sizes.dart';
import 'package:tailwind/utilities/font_weights.dart';
import 'package:tailwind/utilities/asset_paths.dart';
import 'package:tailwind/views/profile_stacked_list.dart';
import 'package:tailwind/widgets/button.dart';
import 'package:tailwind/widgets/search_field.dart';

class DirectoryList extends StatelessWidget {
  const DirectoryList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _buildHeader(context),
        const Expanded(
          child: ProfileStackedList(),
        ),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 6 * 4,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 6 * 4,
          ),
          _buildTitle(context),
          const SizedBox(
            height: 1 * 4,
          ),
          _buildSubtitle(context),
          const SizedBox(
            height: 6 * 4,
          ),
          _buildSearchAndFilter(context),
          const SizedBox(
            height: 4 * 4,
          ),
        ],
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return const Text(
      'Directory',
      style: TextStyle(
        fontSize: FontSizes.lg,
        height: FontHeights.lg,
        fontWeight: FontWeights.medium,
        color: Colors.gray900,
      ),
    );
  }

  Widget _buildSubtitle(BuildContext context) {
    return const Text(
      'Search directory of 3,018 employees',
      style: TextStyle(
        fontSize: FontSizes.sm,
        height: FontHeights.sm,
        color: Colors.gray600,
      ),
    );
  }

  Widget _buildSearchAndFilter(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(
            child: SearchField(),
          ),
          const SizedBox(
            width: 4 * 4,
          ),
          Button(
            icon: solidIcon('filter'),
          ),
        ],
      ),
    );
  }
}
