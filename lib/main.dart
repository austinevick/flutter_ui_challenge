import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_ui/UI/todo_ui/todo2.dart';

import 'UI/chat_app/chat_app_ui.dart';
import 'UI/e_commerce/fruit_juice_app.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: JuiceAppPage());
  }
}

class FlutterAnimation extends StatefulWidget {
  @override
  _FlutterAnimationState createState() => _FlutterAnimationState();
}

class _FlutterAnimationState extends State<FlutterAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<TextStyle> _animation;

  @override
  void initState() {
   _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 4));
        _animation = TextStyleTween(
            begin: TextStyle(fontSize: 15, color: Colors.teal),
            end: TextStyle(fontSize: 50, color: Colors.pink))
        .animate(_controller);
         _animation.addListener(() {
      setState(() {});
    });
   _controller.addListener(() {
      setState(() {});
    });
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Animate UI',style: _animation.value,)),
    );
  }
}
