import 'package:flutter/widgets.dart';

class GridList extends StatelessWidget {
  final int rows;
  final double rowSpacing;
  final double columnSpacing;
  final List<Widget> children;

  const GridList({
    Key? key,
    required this.rows,
    this.rowSpacing = 4,
    this.columnSpacing = 4,
    required this.children,
  }) : super(key: key);

  int _index(int i, int j) => i * rows + j;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (int i = 0; i < children.length / rows; i++) ...[
          if (i != 0) ...[
            SizedBox(
              height: columnSpacing * 4,
            ),
          ],
          Row(
            children: [
              for (int j = 0; j < rows; j++) ...[
                if (j != 0) ...[
                  SizedBox(
                    width: columnSpacing * 4,
                  ),
                ],
                Expanded(
                  child: (_index(i, j) < children.length)
                      ? children[_index(i, j)]
                      : const SizedBox(),
                ),
              ],
            ],
          ),
        ],
      ],
    );
  }
}
