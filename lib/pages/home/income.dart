import 'package:flutter/material.dart';
import 'package:record_book_app/widgets/button-grid.dart';

class Income extends StatefulWidget {
  const Income({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _IncomeState createState() => _IncomeState();
}

class _IncomeState extends State<Income> {
  String menoyType = "工资";
  Color bgColor = Colors.amber;

  static List<GridItem> gridItem = [
    GridItem(menoyType: "工资", color: Colors.amber, icon: Icons.local_atm),
    GridItem(
        menoyType: "奖金",
        color: Color.fromARGB(255, 210, 81, 233),
        icon: Icons.paid),
    GridItem(
        menoyType: "报销",
        color: Color.fromARGB(255, 79, 169, 243),
        icon: Icons.bookmark_added),
    GridItem(
        menoyType: "收红包",
        color: Color.fromARGB(255, 246, 100, 100),
        icon: Icons.mail),
    GridItem(
        menoyType: "退款",
        color: Colors.greenAccent,
        icon: Icons.money_off_csred),
    GridItem(
        menoyType: "提成",
        color: Color.fromARGB(255, 51, 112, 166),
        icon: Icons.currency_yen),
    GridItem(
        menoyType: "利息",
        color: const Color.fromRGBO(231, 140, 104, 1.0),
        icon: Icons.toll),
    GridItem(
        menoyType: "借款",
        color: Color.fromARGB(255, 210, 125, 91),
        icon: Icons.currency_exchange),
    GridItem(
        menoyType: "兼职",
        color: Color.fromARGB(255, 132, 210, 44),
        icon: Icons.face_outlined),
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
