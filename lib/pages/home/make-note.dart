import 'package:flutter/material.dart';

class MakeNote extends StatelessWidget{
  const MakeNote({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
      appBar: AppBar(
        title: const Text("日常账本"),
        leading: Builder(builder: (context){
          return IconButton(onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(Icons.chevron_left_sharp,color: Colors.black,));
        }),
        backgroundColor: Colors.white,
        titleTextStyle: const TextStyle(color: Colors.black),
      ),
      body:  Container(
        margin: const EdgeInsets.all(5),
        child: const TextField(decoration: InputDecoration(
            labelText: "餐饮"
        )),
      ),
    );
  }

}