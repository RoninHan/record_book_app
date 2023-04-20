import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:record_book_app/pages/asset/index.dart';
import 'package:record_book_app/pages/home/index.dart';
import 'package:record_book_app/pages/home/make-note.dart';
import 'package:record_book_app/pages/login/index.dart';
import 'package:record_book_app/pages/report/index.dart';
import 'package:record_book_app/utils/token.dart';

import 'pages/my/index.dart';

Future<void> main() async {
  await dotenv.load();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // ignore: unnecessary_null_comparison
        home: FutureBuilder(
          future: loadToken(),
          builder: (context, snapshot) {
            // 检查获取 token 的结果
            final hasToken = snapshot.hasData && snapshot.data != null;

            // 根据用户登录状态返回不同的页面
            if (hasToken) {
              return MyHomePage(title: 'Flutter Demo Home Page');
            } else {
              return LoginPage();
            }
          },
        ),
        routes: {
          '/home': (context) => const MyHomePage(
                title: 'Flutter Demo Home Page',
              ),
          '/make-note': (context) => const MakeNote(),
        });
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    ReportPage(),
    AssetPage(),
    MyPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    debugPrint("1");
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '首页',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.area_chart),
            label: '报表',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.monetization_on_outlined),
            label: '资产',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: '我的',
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.grey,
        selectedItemColor: const Color.fromARGB(255, 255, 85, 0),
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
