import 'package:flutter/material.dart';
import 'package:record_book_app/pages/home/income.dart';

import 'expenditure.dart';

class MakeNote extends StatefulWidget {
  const MakeNote({super.key});

  @override
  createState() => _MakeNoteState();
}

class _MakeNoteState extends State<MakeNote>
    with SingleTickerProviderStateMixin {
  static const List<Tab> myTabs = <Tab>[
    Tab(text: '支出'),
    Tab(text: '收入'),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: myTabs.length);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: const Text("日常账本"),
          leading: Builder(builder: (context) {
            return IconButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                icon: const Icon(
                  Icons.chevron_left_sharp,
                  color: Colors.black,
                ));
          }),
          backgroundColor: Colors.white,
          titleTextStyle: const TextStyle(color: Colors.black),
          bottom: TabBar(
            controller: _tabController,
            tabs: myTabs,
            labelColor: Colors.black,
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: const [Expenditure(), Income()],
        ));
  }
}
