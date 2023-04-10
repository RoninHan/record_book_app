import 'package:flutter/material.dart';

class MakeNote extends StatefulWidget{
  const MakeNote({super.key});

  @override
  createState() => _MakeNoteState();
}

class _MakeNoteState extends State<MakeNote>{

  String menoyType="餐饮";

  TextEditingController _menoyController = TextEditingController();

  @override
  void initState(){

    super.initState();
  }

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
      body: Column(
          children: <Widget>[
            Container(
              color: Colors.amber,
              child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: TextField(
                    autofocus:true,
                    keyboardType: TextInputType.number,
                    controller: _menoyController,
                    textAlign: TextAlign.right,
                    decoration:  InputDecoration(
                      prefix:Text(menoyType),
                      border:InputBorder.none,
                        hintText:"0.00"
                    ),

                  ),
                ),
            ),

            Padding(
              padding: EdgeInsets.only(top: 16),
              child: GridView(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4, //横轴三个子widget
                    childAspectRatio: 1.6 //宽高比为1时，子widget
                ),
                children: <Widget>[
                  TextButton(

                    onPressed: () {
                      setState((){
                        menoyType="餐饮";
                      });
                    }, child: const Column(
                    children: [
                        Icon(Icons.local_dining,color: Colors.orange,),
                        Text("餐饮",style: TextStyle(color: Colors.orange),)
                      ],
                    ),

                  ),
                  TextButton(
                      onPressed: () {
                        setState((){
                          menoyType="零食";
                        });
                      }, child: const Column(
                    children: [
                      Icon(Icons.fastfood,color: Colors.purple,),
                      Text("零食",style: TextStyle(color: Colors.purple),)
                    ],

                  )
                  ),
                  TextButton(

                      onPressed: () {
                        setState((){
                          menoyType="烟酒饮料";
                        });
                      }, child: const Column(
                    children: [
                      Icon(Icons.local_drink,color: Colors.blue,),
                      Text("烟酒饮料",style: TextStyle(color: Colors.blue),)
                    ],

                  )
                  ),
                  TextButton(

                      onPressed: () {
                        setState((){
                          menoyType="购物";
                        });
                      }, child: const Column(
                    children: [
                      Icon(Icons.shopping_cart,color:Colors.redAccent),
                      Text("购物",style: TextStyle(color: Colors.redAccent),)
                    ],

                  )
                  ),
                  TextButton(

                      onPressed: () {
                        setState((){
                          menoyType="交通";
                        });
                      }, child: const Column(
                    children: [
                      Icon(Icons.directions_bus,color: Colors.greenAccent,),
                      Text("交通",style: TextStyle(color: Colors.greenAccent),)
                    ],

                  )
                  ),
                  TextButton(

                      onPressed: () {
                        setState((){
                          menoyType="话费";
                        });
                      }, child: const Column(
                    children: [
                      Icon(Icons.phone_android,color: Color.fromRGBO(2,88, 161, 1.0)),
                      Text("话费",style: TextStyle(color: Color.fromRGBO(2,88, 161, 1.0)),)
                    ],

                  )
                  ),
                  TextButton(

                      onPressed: () {
                        setState((){
                          menoyType="居住";
                        });
                      }, child: const Column(
                    children: [
                      Icon(Icons.home_outlined,color: Color.fromRGBO(
                          231, 140, 104, 1.0)),
                      Text("居住",style: TextStyle(color: Color.fromRGBO(
                          231, 140, 104, 1.0)),)
                    ],

                  )
                  ),
                  TextButton(

                      onPressed: () {
                        setState((){
                          menoyType="水电";
                        });
                      }, child: const Column(
                    children: [
                      Icon(Icons.energy_savings_leaf_outlined,color: Color.fromRGBO(
                          143, 86, 63, 1.0)),
                      Text("水电",style: TextStyle(color: Color.fromRGBO(
                          143, 86, 63, 1.0)),)
                    ],

                  )
                  ),
                ],
              ),
            )
          ],
        )

    );
  }

}