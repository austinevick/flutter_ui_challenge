import 'package:flutter/material.dart';

class Todo2 extends StatefulWidget {
  @override
  _Todo2State createState() => _Todo2State();
}

class _Todo2State extends State<Todo2> with TickerProviderStateMixin {
  List<CardModel> cardList = [
    CardModel(
        title: 'Personal',
        icon: Icons.account_circle,
        taskCompletion: 2.0,
        tasksRemaining: 5),
    CardModel(
        title: 'Personal',
        icon: Icons.account_circle,
        taskCompletion: 5.0,
        tasksRemaining: 7)
  ];
  var currentColor = Color.fromRGBO(231, 129, 109, 1.0);
  var appColors = [
    Color.fromRGBO(231, 129, 109, 1.0),
    Color.fromRGBO(99, 138, 223, 1.0),
    Color.fromRGBO(111, 194, 173, 1.0)
  ];
  var cardIndex = 0;
  ScrollController scrollController;
  AnimationController animationController;
  ColorTween colorTween;
  CurvedAnimation curvedAnimation;
  @override
  void initState() {
    scrollController = new ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      drawer: Drawer(),
      appBar: AppBar(backgroundColor: Colors.indigo,
        title: Text('TODO'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(icon: Icon(Icons.search), onPressed: () {})
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  image: DecorationImage(
                      fit: BoxFit.cover, image: AssetImage('images/img.jpeg'))),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Hello, Jane.',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Loooks like feel good.\n You have 3 task to do today',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            'TODAY: JUL 21, 2015',
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: cardList.length,
                  itemBuilder: (context, index) {
                    var card = cardList[index];
                    return GestureDetector(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: Container(
                            width: 250,
                            child: Column(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Icon(card.icon),
                                      IconButton(
                                          icon: Icon(Icons.more_vert),
                                          onPressed: () {})
                                    ],
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        card.tasksRemaining.toString(),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        card.title,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: LinearProgressIndicator(
                                        value: card.taskCompletion,
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}

class CardModel {
  final String title;
  final IconData icon;
  final tasksRemaining;
  final double taskCompletion;

  CardModel({this.title, this.icon, this.tasksRemaining, this.taskCompletion});
}
