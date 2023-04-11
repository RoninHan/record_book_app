import 'dart:core';

import 'package:flutter/material.dart';

class GridItem {
  late String menoyType;
  late Color color;
  late IconData icon;
  GridItem({required this.menoyType, required this.color, required this.icon});
}

class ButtonGrid extends StatefulWidget {
  final List<GridItem> gridItem;
  final Function(GridItem) onTextChanged;
  const ButtonGrid(
      {Key? key, required this.gridItem, required this.onTextChanged})
      : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ButtonGridState createState() => _ButtonGridState();
}

class _ButtonGridState extends State<ButtonGrid> {
  String menoyType = "餐饮";

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 16),
        child: GridView(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4, //横轴三个子widget
                childAspectRatio: 1.6 //宽高比为1时，子widget
                ),
            children: widget.gridItem
                .map(
                  (item) => TextButton(
                    onPressed: () {
                      widget.onTextChanged(item);
                    },
                    child: Column(
                      children: [
                        Icon(
                          item.icon,
                          color: item.color,
                        ),
                        Text(
                          item.menoyType,
                          style: TextStyle(color: item.color),
                        )
                      ],
                    ),
                  ),
                )
                .toList()));
  }
}
