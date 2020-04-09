import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui/UI/chat_app/message_screen.dart';

class ChatAppPage extends StatefulWidget {
  
  @override
  _ChatAppPageState createState() => _ChatAppPageState();
}

class _ChatAppPageState extends State<ChatAppPage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark));
    return Scaffold(
      //  backgroundColor: Color(0xff0060e3),
      appBar: AppBar(
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
          style:
              TextStyle(color: Color(0xff0060e3), fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        height: double.infinity,
        child: ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return Card(
                elevation: 0,
                shape: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.zero,
                      bottomLeft: Radius.zero,
                      bottomRight: Radius.circular(10),
                      topRight: Radius.circular(10)),
                ),
                color: Colors.white,
                child: ListTile(
                  leading: Container(
                    width: 50,
                    height: 50,
                    child: Stack(
                      children: <Widget>[
                        Positioned.fill(
                            child: CircleAvatar(
                          backgroundImage: AssetImage('images/img.jpeg'),
                        )),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            height: 15,
                            width: 15,
                            decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 3),
                                shape: BoxShape.circle,
                                color: Colors.green),
                          ),
                        )
                      ],
                    ),
                  ),
                  title: Text('Augustine Victor',
                      style: Theme.of(context).textTheme.title),
                  subtitle: Text(
                    'Hi, Have you slept today?',
                    style: Theme.of(context).textTheme.subtitle,
                  ),
                  trailing: Text(
                    '15:00',
                    style: Theme.of(context).textTheme.subtitle,
                  ),
                ),
              );
            }),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 5,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.message,
                  color: Color(0xff0060e3),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MessageScreen()));
                }),
            Container(
              decoration: BoxDecoration(
                color: Color(0xff0060e3),
                borderRadius: BorderRadius.circular(50),
              ),
              height: 40,
              width: 40,
              child: IconButton(
                  icon: Icon(Icons.home, color: Colors.white),
                  onPressed: () {}),
            ),
            IconButton(
                icon: Icon(
                  Icons.location_on,
                  color: Colors.grey,
                ),
                onPressed: () {})
          ],
        ),
      ),
    );
  }
}
