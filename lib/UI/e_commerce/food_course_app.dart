import 'package:flutter/material.dart';
import 'package:flutter_ui/UI/e_commerce/food_course_detail_page.dart';

class FoodCoursePage extends StatefulWidget {
  @override
  _FoodCoursePageState createState() => _FoodCoursePageState();
}

class _FoodCoursePageState extends State<FoodCoursePage> {
  int selectedIndex = 0;
  List<String> selectedPage = ['Home', 'Cart', 'Subscription', 'More'];
  List<FoodCourseModel> foodList1 = [
    FoodCourseModel(title: 'Soup Recipes', image: 'images/african_dish.png'),
    FoodCourseModel(
        title: 'Main Course Special', image: 'images/friedcheese.jpg'),
    FoodCourseModel(title: 'Grill Recipes', image: 'images/pasta.png'),
    FoodCourseModel(title: 'Main Course Special', image: 'images/pastry.jpg'),
  ];
  List<FoodCourseModel> foodList2 = [
    FoodCourseModel(
        title: 'Soup Recipes',
        image: 'images/cheese.png',
        name: 'by sarah Smith'),
    FoodCourseModel(
        title: 'Main Course Special',
        image: 'images/friedcheese.jpg',
        name: 'by sarah Smith'),
    FoodCourseModel(
        title: 'Grill Recipes',
        image: 'images/pasta.png',
        name: 'by sarah Smith'),
    FoodCourseModel(
        title: 'Main Course Special',
        image: 'images/pastry.jpg',
        name: 'by sarah Smith'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 20,),
                  child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded(
                                              child: Padding(
                                                padding: const EdgeInsets.only(left: 10),
                                                child: Text(
                            'Looking for your\nfavourite meal',
                            style: Theme.of(context).textTheme.title,
                          ),
                                              ),
                      ),
                      IconButton(
                          icon: Icon(
                            Icons.notifications,
                            size: 28,
                          ),
                          onPressed: () {}),
                      IconButton(
                          icon: Icon(
                            Icons.search,
                            size: 28,
                          ),
                          onPressed: () {})
                    ],
                  ),
                ),
                Positioned(
                    right: 63,
                    top: 30,
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(50)),
                      height: 8,
                      width: 8,
                    )),
              ],
            ),
            Expanded(
                          child: Container(
                height: 150,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: foodList1.length,
                    itemBuilder: (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: 150,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image:
                                            AssetImage(foodList1[index].image)),
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                          ),
                          SizedBox(height: 5,),
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  foodList1[index].title,
                                  style: Theme.of(context).textTheme.subtitle,
                                ),
                              )
                            ],
                          )
                        ],
                      );
                    }),
              ),
            ),
            SizedBox(height: 10,),
            Container(
                height: 300,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: foodList2.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (c) => FoodCourseDetailPage(
                                        foodCourseModel: foodList2[index],
                                      )));
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 200,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              foodList2[index].image)),
                                      borderRadius: BorderRadius.circular(10)),
                                ),
                              ),
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10,
                                  ),
                                  child: Text(
                                    foodList2[index].title,
                                    style: Theme.of(context).textTheme.subtitle,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 10,
                              ),
                              child: Text(
                                foodList2[index].name,
                                style: Theme.of(context).textTheme.subtitle,
                              ),
                            )
                          ],
                        ),
                      );
                    }))
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
            onTap: (itemSelected) {
              setState(() {
                selectedIndex = itemSelected;
              });
            },
            type: BottomNavigationBarType.fixed,
            items: [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home), title: Text(selectedPage[0])),
              BottomNavigationBarItem(
                  icon: Icon(Icons.local_grocery_store),
                  title: Text(selectedPage[1])),
              BottomNavigationBarItem(
                  icon: Icon(Icons.subscriptions),
                  title: Text(selectedPage[2])),
              BottomNavigationBarItem(
                  icon: Icon(Icons.more), title: Text(selectedPage[3]))
            ]));
  }
}

class FoodCourseModel {
  String image;
  String title;
  String name;
  FoodCourseModel({this.image, this.name, this.title});
}
