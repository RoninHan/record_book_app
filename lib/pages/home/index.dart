import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../api/records.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> data = [];
  int todayTotalRevenue = 0;
  int todayTotalExpenses = 0;

  @override
  void initState() {
    super.initState();
    getData();
  }

  void onGoMakeNote(context) {
    Navigator.pushNamed(context, "/make-note");
  }

  getData() {
    RecordApi().getTodayRecords().then((value) {
      var totalRevenue = getTodayTotalRevenue(value);
      var totalExpenses = getTodayTotalExpenses(value);
      var newdata = value.map((item) {
        item["record_date"] = DateFormat("yyyy-MM-dd HH:mm:ss")
            .format(DateTime.parse(item["record_date"]).toLocal());
        return item;
      }).toList();
      setState(() {
        data = newdata;
        todayTotalRevenue = totalRevenue;
        todayTotalExpenses = totalExpenses;
      });
    });
  }

  int getTodayTotalRevenue(List<dynamic> lists) {
    if (lists.isEmpty) return 0;
    int num = 0;
    for (var list in lists) {
      if (list["type"] != "expenditure") {
        num += int.parse(list["amount"].toString());
      }
    }
    return num;
  }

  int getTodayTotalExpenses(List<dynamic> lists) {
    if (lists.isEmpty) return 0;
    int num = 0;
    for (var list in lists) {
      if (list["type"] == "expenditure") {
        num += int.parse(list["amount"].toString());
      }
    }
    return num;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            '日常账本',
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.add, color: Colors.black),
              onPressed: () {
                onGoMakeNote(context);
              },
            ),
          ],
          backgroundColor: Colors.white,
          titleTextStyle: const TextStyle(color: Colors.black),
          centerTitle: false,
        ),
        body: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    '今日',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  Text(
                    "总收入: ${todayTotalRevenue.toString()}  总支出: ${todayTotalExpenses.toString()}",
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ],
              ),
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: data.length,
                itemBuilder: (BuildContext context, int index) {
                  if (data[index]["type"] == "expenditure") {
                    return ListTile(
                      leading:
                          const Icon(Icons.arrow_upward, color: Colors.red),
                      title: Text(data[index]['description']),
                      subtitle: Text(data[index]['record_date']),
                      trailing: Text(
                        data[index]['amount'].toString(),
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    );
                  }
                  return ListTile(
                    leading:
                        const Icon(Icons.arrow_downward, color: Colors.green),
                    title: Text(data[index]['description']),
                    subtitle: Text(data[index]['record_date']),
                    trailing: Text(
                      data[index]['amount'].toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  );
                }),
          ],
        ));
  }
}
