import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_ui/UI/e_commerce/food_course_app.dart';

class FoodCourseDetailPage extends StatelessWidget {
  final FoodCourseModel foodCourseModel;

  const FoodCourseDetailPage({Key key, this.foodCourseModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double rating = 3.5;
    var headerText = Theme.of(context).textTheme.title;
    var decs = Theme.of(context).textTheme.subtitle;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(top: 15,left: 12),
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(50)),
                child: IconButton(
                    icon: Icon(
                      Icons.keyboard_backspace,
                      size: 28,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }),
              ),
            ),
            height: MediaQuery.of(context).size.height / 2,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(foodCourseModel.image)),
                color: Colors.indigo),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              height: MediaQuery.of(context).size.height / 1.5,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          foodCourseModel.title,
                          style: headerText,
                        ),
                        IconButton(
                            icon: Icon(
                              Icons.favorite,
                              color: Colors.black.withOpacity(0.3),
                            ),
                            onPressed: () {})
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'By Sarah Smith',
                      style: decs,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: RatingBar(
                        initialRating: 3,
                        itemSize: 25,
                        itemCount: 5,
                        itemBuilder: (context, i) => Icon(
                              Icons.star,
                              size: 10,
                            ),
                        allowHalfRating: true,
                        onRatingUpdate: (rating) {
                          rating = rating;
                        }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                              'Calories',
                              style: decs,
                            ),
                            Text(
                              '175Cal',
                              style: decs,
                            )
                          ],
                        ),
                        height: 50,
                        width: 80,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 2,
                                  color: Colors.black,
                                  offset: Offset(0, 0))
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadiusDirectional.circular(5)),
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                              'Ingredients',
                              style: decs,
                            ),
                            Text(
                              '06',
                              style: decs,
                            )
                          ],
                        ),
                        height: 50,
                        width: 80,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 2,
                                  color: Colors.black,
                                  offset: Offset(0, 0))
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadiusDirectional.circular(5)),
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                              'Total Time',
                              style: decs,
                            ),
                            Text(
                              '25 min',
                              style: decs,
                            )
                          ],
                        ),
                        height: 50,
                        width: 80,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 2,
                                  color: Colors.black,
                                  offset: Offset(0, 0))
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadiusDirectional.circular(5)),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'About Product',
                      style: headerText,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, \nsed do eiusmod tempor incididunt ut\n labore et dolore magna aliqua.Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.',
                      style: decs,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                            child: Text(
                          'Reviews',
                          style: headerText,
                        )),
                        Text(
                          '4.0',
                          style: decs,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Text(
                      'Catherine James',
                      style: decs,
                    ),
                  ),
                  Center(
                    child: Container(
                      width: 300,
                      child: FlatButton(
                          color: Colors.black,
                          shape: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(5)),
                          onPressed: () {},
                          child: Text(
                            'Cook now',
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
