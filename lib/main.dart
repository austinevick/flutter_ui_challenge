import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_ui/UI/movie_app/movie_page.dart';

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
        home: MoviePage());
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
