import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:flutter_ui/UI/movie_app/movie_page.dart';

class MovieDetailPage extends StatefulWidget {
  final Movies m;

  const MovieDetailPage({Key key, this.m}) : super(key: key);

  @override
  _MovieDetailPageState createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  final MoviesList movies = MoviesList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          ClipPath(
            clipper: OvalBottomBorderClipper(),
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(fit: BoxFit.cover, image: AssetImage(widget.m.image))),
              width: MediaQuery.of(context).size.width,
              height: 280,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                      icon: Icon(Icons.keyboard_backspace,size: 32,color: Colors.white,),
                      onPressed: () {
                        Navigator.pop(context);
                      }),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                    icon: Icon(
                      Icons.add,
                      size: 35,
                    ),
                    onPressed: () {}),
                IconButton(
                    icon: Icon(
                      Icons.share,
                      size: 35,
                    ),
                    onPressed: () {}),
              ],
            ),
          ),
          SizedBox(
            height: 25,
          ),
          Text(
            widget.m.title,
            style: TextStyle(fontSize: 20, color: Colors.black,fontWeight:FontWeight.w800)
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            widget.m.subtitle,
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            widget.m.time,
            style: TextStyle(fontSize: 18, color: Colors.black),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('More',
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600  )),
                IconButton(
                    icon: Icon(
                      Icons.arrow_forward,
                      size: 35,
                    ),
                    onPressed: () {}),
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movies.imageList.length,
            itemBuilder: (context, i) {
              return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(movies.imageList[i].image)),
                    ),
                  ));
            },
          ))
        ],
      ),
    );
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => MovieDetailPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, 1.0);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
