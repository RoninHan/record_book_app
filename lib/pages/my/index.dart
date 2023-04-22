import 'package:flutter/material.dart';
import 'package:record_book_app/mobx/user/userStore.dart';
import 'package:record_book_app/utils/token.dart';

class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('我的'),
        backgroundColor: Colors.white,
        titleTextStyle: const TextStyle(color: Colors.black),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.all(20.0),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: CircleAvatar(
                    radius: 30.0,
                    backgroundImage: NetworkImage(
                        'https://picsum.photos/seed/picsum/200/300'),
                  ),
                  onTap: () {
                    debugPrint(userStore.user.toString());
                    // removeToken();
                    Navigator.pushNamed(context, "/");
                  },
                ),
                const SizedBox(width: 20.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userStore.user["UserName"] ?? "",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24.0,
                      ),
                    ),
                    SizedBox(height: 5.0),
                    Text(
                      userStore.user["email"] ?? "",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                // ElevatedButton(
                //   onPressed: () {},
                //   child: const Text('编辑资料'),
                // ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          ListTile(
            leading: const Icon(Icons.account_balance_wallet),
            title: const Text('我的账户'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to account page
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('设置'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to settings page
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('退出登录'),
            onTap: () {
              removeToken();
              Navigator.pushNamed(context, "/login");
              // Log out user and navigate to login page
            },
          ),
        ],
      ),
    );
  }
}
