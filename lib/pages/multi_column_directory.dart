import 'package:flutter/widgets.dart';
import 'package:tailwind/views/directory_list.dart';
import 'package:tailwind/views/directory_profile.dart';
import 'package:tailwind/views/mobile_navigation.dart';
import 'package:tailwind/views/sidebar.dart';
import 'package:tailwind/views/sidebar_secondary_primary.dart';

class MultiColumnDirectory extends StatelessWidget {
  const MultiColumnDirectory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MobileNavigation(
      sidebar: Sidebar(
        floating: true,
      ),
      child: SidebarSecondaryPrimary(
        sidebar: Sidebar(),
        secondary: DirectoryList(),
        primary: DirectoryProfile(),
      ),
    );
  }
}
