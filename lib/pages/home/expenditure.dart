import 'package:flutter/material.dart';
import 'package:record_book_app/api/categories.dart';
import 'package:record_book_app/api/records.dart';
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
  String menoyType = "";
  Color? bgColor;
  String categoryId = "";
  List<GridItem> gridItem = [];

  @override
  initState() {
    // TODO: implement initState
    CategoriesApi().getCategories({"Type": "expenditure"}).then((value) {
      var gridItems = value.map<GridItem>((item) {
        var hexIcon =
            item["icon"].toString().toLowerCase().replaceAll("0x", "");
        int icon16 = int.parse(hexIcon, radix: 16);
        return GridItem(
            id: item["id"],
            menoyType: item["name"],
            color: Utils.getColorFromString(item["color"]),
            icon: IconData(icon16,
                fontFamily: 'FontAwesomeSolid',
                fontPackage: 'font_awesome_flutter'));
      }).toList();
      setState(() {
        gridItem = gridItems;
        menoyType = value[0]["name"].toString();
        bgColor = Utils.getColorFromString(value[0]["color"]);
        categoryId = value[0]["id"].toString();
      });
    });

    super.initState();
  }

  final TextEditingController _menoyController = TextEditingController();

  void _handleTextChanged(GridItem item) {
    setState(() {
      menoyType = item.menoyType;
      bgColor = item.color;
      categoryId = item.id;
    });
  }

  void onSubmit(val) {
    Map<String, dynamic> map = new Map<String, dynamic>();
    map["amount"] = double.parse(val).toStringAsFixed(2);
    map["category_id"] = categoryId;
    map["description"] = menoyType;
    RecordApi()
        .createRecord(map)
        .then((value) => Navigator.pushNamed(context, "/home"));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          color: bgColor,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: TextFormField(
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
              onFieldSubmitted: (value) {
                onSubmit(value);
              },
            ),
          ),
        ),
        ButtonGrid(gridItem: gridItem, onTextChanged: _handleTextChanged)
      ],
    );
  }
}
