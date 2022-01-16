import 'package:flutter/widgets.dart';
import 'package:tailwind/widgets/tab_item.dart';

class TabList extends StatelessWidget {
  const TabList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        TabItem(current: true, label: 'Profile'),
        SizedBox(
          width: 8 * 4,
        ),
        TabItem(current: false, label: 'Calendar'),
        SizedBox(
          width: 8 * 4,
        ),
        TabItem(current: false, label: 'Recognition'),
      ],
    );
  }
}
