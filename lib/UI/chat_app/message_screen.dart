import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_ui/UI/chat_app/chat_app_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MessageScreen extends StatelessWidget {
  final TextStyle textStyle =
      TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.w800);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Color(0xff0060e3),
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ChatAppPage()));
              }),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.view_headline,
                  color: Color(0xff0060e3),
                  size: 30,
                ),
                onPressed: null)
          ],
          backgroundColor: Colors.white,
          shape: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15))),
          title: Text(
            'Study\n insider',
            style: TextStyle(
                color: Color(0xff0060e3), fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 20,
                  itemBuilder: (
                    context,
                    index,
                  ) {
                    return Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  '04:35AM',
                                  style: TextStyle(
                                      color: Color(0xff0060e3),
                                      fontWeight: FontWeight.w800),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  padding: EdgeInsets.all(20),
                                  decoration: BoxDecoration(
                                      color: Color(0xff0060e3),
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(15),
                                          bottomLeft: Radius.circular(15),
                                          topLeft: Radius.circular(15))),
                                  child: Text(
                                    'Hey, Fred check your inbox, I just sent you a message',
                                    style: textStyle,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 0,
                                child: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image:
                                              AssetImage('images/img.jpeg'))),
                                ),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    padding: EdgeInsets.all(20),
                                    decoration: BoxDecoration(
                                        color: Colors.indigo,
                                        borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(15),
                                            topRight: Radius.circular(15),
                                            bottomLeft: Radius.circular(15))),
                                    child: Text(
                                      'Alright, I will get back to you',
                                      style: textStyle,
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                '06:22AM',
                                style: TextStyle(
                                    color: Color(0xff0060e3),
                                    fontWeight: FontWeight.w800),
                              )
                            ],
                          ),
                        )
                      ],
                    );
                  }),
            ),
            Expanded(
                flex: 0,
                child: Container(
                  color: const Color(0xff0060e3),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                          child: TextField(
                        style: TextStyle(fontSize: 20),
                        decoration: InputDecoration(
                            prefixIcon: IconButton(
                                icon: Icon(Icons.attach_file),
                                onPressed: () {}),
                            border: InputBorder.none,
                            suffixIcon: IconButton(
                                icon: Icon(Icons.send), onPressed: () {}),
                            hintText: 'Type a message',
                            filled: true,
                            fillColor: Colors.white,
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)))),
                      )),
                    ],
                  ),
                ))
          ],
        ));
  }
}
