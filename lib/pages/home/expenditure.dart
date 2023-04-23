import 'package:flutter/material.dart';
import 'package:record_book_app/widgets/button-grid.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../utils/utils.dart';

class Expenditure extends StatefulWidget {
  const Expenditure({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ExpenditureState createState() => _ExpenditureState();
}

class _ExpenditureState extends State<Expenditure> {
  String menoyType = "餐饮";
  Color bgColor = Colors.amber;

  static List<GridItem> gridItem = [
    GridItem(
        menoyType: "餐饮",
        color: Utils.getColorFromString(""),
        icon: IconData(0xf858,
            fontFamily: 'FontAwesomeSolid',
            fontPackage: 'font_awesome_flutter')),
    // GridItem(
    //     menoyType: "零食",
    //     color: Color.fromARGB(255, 215, 85, 238),
    //     icon: IconData(0xf858, fontFamily: 'FontAwesomeSolid', fontPackage: 'font_awesome_flutter')),
    // GridItem(
    //     menoyType: "烟酒饮料",
    //     color: Color.fromARGB(255, 62, 161, 243),
    //     icon: Icons.local_drink),
    // GridItem(
    //     menoyType: "购物",
    //     color: Color.fromARGB(255, 246, 92, 92),
    //     icon: Icons.shopping_cart),
    // GridItem(
    //     menoyType: "交通", color: Colors.greenAccent, icon: Icons.directions_bus),
    // GridItem(
    //     menoyType: "话费",
    //     color: Color.fromARGB(255, 46, 153, 247),
    //     icon: Icons.phone_android),
    // GridItem(
    //     menoyType: "居住",
    //     color: const Color.fromRGBO(231, 140, 104, 1.0),
    //     icon: Icons.home_outlined),
    // GridItem(
    //     menoyType: "水电",
    //     color: Color.fromARGB(255, 220, 132, 97),
    //     icon: Icons.energy_savings_leaf_outlined),
  ];

  final TextEditingController _menoyController = TextEditingController();

  void _handleTextChanged(GridItem item) {
    setState(() {
      menoyType = item.menoyType;
      bgColor = item.color;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: bgColor,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              autofocus: true,
              keyboardType: TextInputType.number,
              controller: _menoyController,
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                  prefixIcon: Text(
                    menoyType,
                    textAlign: TextAlign.center,
                  ),
                  prefixIconConstraints:
                      const BoxConstraints(minWidth: 0, minHeight: 0),
                  border: InputBorder.none,
                  hintText: "0.00"),
            ),
          ),
        ),
        ButtonGrid(gridItem: gridItem, onTextChanged: _handleTextChanged)
      ],
    );
  }
}
