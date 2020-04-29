import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_ui/UI/charts/flutter_charts.dart';
import 'package:http/http.dart';

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
        home: JsonDemo());
  }
}

class JsonDemo extends StatefulWidget {
  @override
  _JsonDemoState createState() => _JsonDemoState();
}

class _JsonDemoState extends State<JsonDemo> {
  final String url =
      "https://pixabay.com/api/?key=14864619-923ee1204c9967979dc2d22bf&q=burger&image_type=photo&pretty=true";
  Future<List<Post>> getImage() async {
    Response response = await get(url);
    if (response.statusCode == 200) {
      List body = jsonDecode(response.body)['hits'];
      List<Post> post = body.map((items) => Post.fromMap(items)).toList();
      return post;
    }
    return getImage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: getImage(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Post> post = snapshot.data;
              return ListView(
                children: post
                    .map((items) => Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              height: 200,
                              width: 150,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      colorFilter: ColorFilter.mode(
                                          Colors.black54, BlendMode.darken),
                                      fit: BoxFit.cover,
                                      image:
                                          NetworkImage(items.largeImageURL))),
                              child: Text(
                                items.tags,
                                style: TextStyle(
                                    fontSize: 25, color: Colors.white),
                              )),
                        ))
                    .toList(),
              );
            }
            return Center(
              child: CircularProgressIndicator(),
            );
          }),
    );
  }
}

class Post {
  String tags;
  String largeImageURL;
  String user;
  Post({this.largeImageURL, this.tags, this.user});
  factory Post.fromMap(Map<String, dynamic> maps) {
    return Post(
        tags: maps['tags'],
        largeImageURL: maps['largeImageURL'],
        user: maps['user']);
  }
}

class ShoePage1 extends StatelessWidget {
  final List<String> shoeCategory = [
    'BEST SELLER',
    'FEATURED',
    'NEWEST',
    'MEN'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(Icons.menu),
                Icon(Icons.add_shopping_cart)
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Text('discover the\nnewest shoes'.toUpperCase(),
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold)),
          ),
          Row(
            children: <Widget>[
              Expanded(
                  child: Card(
                      elevation: 5,
                      child: TextField(
                        decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search, size: 30),
                            labelText: 'Search shoes',
                            border: InputBorder.none),
                      ))),
              IconButton(icon: Icon(Icons.menu), onPressed: () {})
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: shoeCategory.map((lists) => Text(lists)).toList(),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: <Widget>[
                shoeCard(image: 'images/blackshoe.png', color: Colors.indigo),
                shoeCard(image: 'images/redshoe.png', color: Colors.lightBlue),
              ],
            ),
          )
        ],
      ),
    );
  }

  shoeCard({
    String image,
    Color color,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 300,
        width: 200,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30), color: color),
        child: Padding(
          padding: const EdgeInsets.only(left: 15, top: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'N125',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
              Image.asset(
                image,
                height: 150,
                width: 150,
              ),
              Text('Basketball shoe',
                  style: TextStyle(fontSize: 15, color: Colors.white60)),
              Text('Nike Zoom',
                  style: TextStyle(fontSize: 20, color: Colors.white)),
              Text('KD12', style: TextStyle(fontSize: 20, color: Colors.white))
            ],
          ),
        ),
      ),
    );
  }
}
