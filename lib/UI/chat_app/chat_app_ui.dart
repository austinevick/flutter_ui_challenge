import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ui/UI/chat_app/message_screen.dart';

class ChatAppPage extends StatefulWidget {
  @override
  _ChatAppPageState createState() => _ChatAppPageState();
}

class _ChatAppPageState extends State<ChatAppPage> {
  int selectedIndex = 0;
  ChatList chatList = ChatList();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark));
    return Scaffold(
      // backgroundColor: Color(0xff0060e3),

      body: Column(
        children: <Widget>[
          Material(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25)),
            elevation: 5,
            child: Container(
              height: 100,
              child: Row(
                children: <Widget>[
                  IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios,
                        size: 30,
                        color: Colors.blue,
                      ),
                      onPressed: () {}),
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                        image: DecorationImage(fit: BoxFit.cover,
                            image: AssetImage('images/tosin.jpg')),
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(50)),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Text(
                    'Chats',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: chatList.chatList.length,
                itemBuilder: (context, index) {
                  final chat = chatList.chatList[index];
                  return Card(
                    elevation: 2,
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
                              backgroundImage: AssetImage(chat.image),
                            )),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                height: 15,
                                width: 15,
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white, width: 3),
                                    shape: BoxShape.circle,
                                    color: chat.status == 1
                                        ? Colors.green
                                        : Colors.grey),
                              ),
                            )
                          ],
                        ),
                      ),
                      title: Text(chat.sender,
                          style: Theme.of(context).textTheme.title),
                      subtitle: Text(
                        chat.message,
                        style: chat.readStatus == 1
                            ? Theme.of(context).textTheme.subtitle
                            : TextStyle(fontSize: 15),
                      ),
                      trailing: Text(
                        chat.time,
                        style: Theme.of(context).textTheme.subtitle,
                      ),
                    ),
                  );
                }),
          ),
        ],
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
                color: Colors.grey,//Color(0xff0060e3),
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

class Chat {
  final image;
  final readStatus;
  final status;
  final time;
  final sender;
  final message;

  Chat(
      {this.readStatus,
      this.image,
      this.status,
      this.time,
      this.sender,
      this.message});
}

class ChatList {
  List<Chat> chatList = [
    Chat(
      status: 1,
      readStatus: 0,
      image: 'images/img.jpeg',
      time: '13:20',
      sender: 'Peter Jackson',
      message: 'Hi, Victor are you home?',
    ),
    Chat(
      status: 1,
      readStatus: 1,
      image: 'images/person3.jpg',
      time: '05:00',
      sender: 'James Chinwe',
      message: 'Have you gone back',
    ),
    Chat(
      status: 0,
      readStatus: 1,
      image: 'images/person4.jpg',
      time: '10:45',
      sender: 'Mary Okon',
      message: 'Hello',
    ),
    Chat(
      status: 0,
      readStatus: 0,
      image: 'images/person5.jpg',
      time: '17:20',
      sender: 'Johnson K',
      message: 'Hi, Victor long time',
    )
  ];
}
