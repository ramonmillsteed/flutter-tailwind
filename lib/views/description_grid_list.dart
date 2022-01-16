import 'package:flutter/widgets.dart';
import 'package:tailwind/widgets/description_tile.dart';
import 'package:tailwind/widgets/grid_list.dart';

class DescriptionGridList extends StatelessWidget {
  final int rows;

  const DescriptionGridList({Key? key, required this.rows}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridList(
      rows: rows,
      columnSpacing: 8,
      children: const [
        DescriptionTile(
          title: 'Phone',
          subtitle: '(555) 123-4567',
        ),
        DescriptionTile(
          title: 'Email',
          subtitle: 'ricardocooper@example.com',
        ),
        DescriptionTile(
          title: 'Title',
          subtitle: 'Senior Front-End Developer',
        ),
        DescriptionTile(
          title: 'Team',
          subtitle: 'Product Development',
        ),
        DescriptionTile(
          title: 'Location',
          subtitle: 'San Francisco',
        ),
        DescriptionTile(
          title: 'Sits',
          subtitle: 'Oasis, 4th floor',
        ),
        DescriptionTile(
          title: 'Salary',
          subtitle: '\$145,000',
        ),
        DescriptionTile(
          title: 'Birthday',
          subtitle: 'June 8, 1990',
        ),
      ],
    );
  }
}
