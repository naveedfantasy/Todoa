import 'package:flutter/material.dart';

import 'home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor:Colors.purple.shade200,
          title: Center(child: Text("Todo App", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),)),
        ),
        body: Todo(),
      ),
    );
  }
}
