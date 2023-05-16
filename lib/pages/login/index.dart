// import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:record_book_app/mobx/user/userStore.dart';
import 'package:record_book_app/utils/request.dart';
import 'package:record_book_app/utils/utils.dart';

import '../../utils/token.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  String _email = '';
  String _password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登陆'),
        backgroundColor: Colors.white,
        titleTextStyle: const TextStyle(color: Colors.black),
      ),
      body: Padding(
        padding: EdgeInsets.all(13.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your email address';
                  }
                  return null;
                },
                onSaved: (value) {
                  _email = value!;
                },
              ),
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
                onSaved: (value) {
                  _password = value!;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    // TODO: Perform login operation
                    final payload = {
                      "email": _email,
                      "password": Utils.generateMD5(_password)
                    };

                    Map<String, dynamic> result =
                        await HttpService.post("/v1/user/login", payload);
                    final String token = result["data"]["token"];
                    final Map<String, dynamic> user = result["data"]["user"];

                    saveToken(token);
                    userStore.setUser(user);
                    Navigator.pushNamed(context, "/home");
                  }
                },
                child: Text('登陆'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
