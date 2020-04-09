import 'package:flutter/material.dart';
import 'package:flutter_ui/UI/todo_ui/todo2.dart';

import 'UI/chat_app/chat_app_ui.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
      
        primarySwatch: Colors.blue,
      ),
      home: Todo2()
    );
  }
}





