import 'package:flutter/material.dart';
import 'package:flutter_ui/UI/movie_app/movie_detail.dart';

class MoviePage extends StatefulWidget {
  @override
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  MoviesList movies = MoviesList();
  
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            'Movies',
            style: TextStyle(color: Colors.black),
          ),
          actions: <Widget>[
            IconButton(
                icon: Icon(
                  Icons.search,
                  size: 30,
                  color: Colors.black,
                ),
                onPressed: () {})
          ],
          bottom: TabBar(
              labelColor: Colors.black,
              labelStyle: TextStyle(
                fontSize: 16,
              ),
              controller: _tabController,
              unselectedLabelColor: Colors.grey,
              tabs: [
                new Tab(
                  text: 'Recommend',
                ),
                new Tab(
                  text: 'Recent',
                ),
                new Tab(
                  text: 'Popular',
                ),
              ]),
        ),
        body: TabBarView(controller: _tabController, children: [
          Column(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: movies.imageList.length,
                  itemBuilder: (context, i) {
                    return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 250,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(movies.imageList[i].image)),
                          ),
                        ));
                  },
                ),
              ),
              Expanded(
                  flex: 4,
                  child: ListView.builder(
                      itemCount: movies.imageList.length,
                      itemBuilder: (context, index) {
                        final m = movies.imageList[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                flex: 2,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MovieDetailPage(
                                                  m: m,
                                                )));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(m.image))),
                                    width: 20,
                                    height: 150,
                                  ),
                                ),
                              ),
                              Expanded(
                                  flex: 4,
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(m.title,
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.w800)),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(m.subtitle,
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500)),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(m.time)
                                      ],
                                    ),
                                  )),
                            ],
                          ),
                        );
                      }))
            ],
          ),
          Placeholder(),
          Placeholder()
        ]));
  }
}

class Movies {
  final String image;
  final String title;
  final String subtitle;
  final String time;

  Movies({this.image, this.title, this.subtitle, this.time});
}

class MoviesList {
  List<Movies> imageList = [
    Movies(
        title: 'Avengers',
        time: '1h 30m',
        subtitle: 'Action, Adventure, Sci-Fi',
        image: 'images/avengers.png'),
    Movies(
        title: 'Justice League',
        time: '2h 30m',
        subtitle: 'Action, Adventure, Sci-Fi',
        image: 'images/justice_league.png'),
    Movies(
        title: 'the lords of the ring',
        time: '1h 30m',
        subtitle: 'Action, Adventure, Sci-Fi',
        image: 'images/lord_of_the_ring.jpg'),
    Movies(
        title: 'Transformers',
        time: '1h 30m',
        subtitle: 'Action, Adventure, Sci-Fi',
        image: 'images/transformers.jpg'),
    Movies(
        title: 'Wonder Woman',
        time: '1h 30m',
        subtitle: 'Action, Adventure, Sci-Fi',
        image: 'images/wonderwoman.jpg'),
  ];
}
