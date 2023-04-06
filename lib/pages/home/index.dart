import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  void onGoMakeNote(context){
    Navigator.pushNamed(context, "/make-note");
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
            icon: const Icon(Icons.add,color: Colors.black),
            onPressed: () {
              onGoMakeNote(context);
              },
          ),
        ],
        backgroundColor: Colors.white,
        titleTextStyle: const TextStyle(color: Colors.black),
        centerTitle: false,
      ),
      body: ListView(
        children: const [
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '今日',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                Text(
                  '总收入: 0.00  总支出: 0.00',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
           Divider(),
           ListTile(
            leading: Icon(Icons.arrow_upward, color: Colors.green),
            title: Text('工资'),
            subtitle: Text('2022-04-01'),
            trailing: Text(
              '+1000.00',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ),
           Divider(),
           ListTile(
            leading: Icon(Icons.arrow_downward, color: Colors.red),
            title: Text('购物'),
            subtitle: Text('2022-03-29'),
            trailing: Text(
              '-199.99',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          ),
           Divider(),
           ListTile(
            leading: Icon(Icons.arrow_downward, color: Colors.red),
            title: Text('外卖'),
            subtitle: Text('2022-03-28'),
            trailing: Text(
              '-56.00',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          ),
           Divider(),
           ListTile(
            leading: Icon(Icons.arrow_downward, color: Colors.red),
            title: Text('水电费'),
            subtitle: Text('2022-03-28'),
            trailing: Text(
              '-98.00',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
