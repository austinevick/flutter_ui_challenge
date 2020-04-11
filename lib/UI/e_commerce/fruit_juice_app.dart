import 'package:flutter/material.dart';
import 'package:flutter_ui/UI/e_commerce/fruit_detail_page.dart';

class JuiceAppPage extends StatelessWidget {
  final TextStyle fruitStyle =
      TextStyle(color: Colors.white, fontWeight: FontWeight.w800);
  final TextStyle fruitJuiceStyle2 =
      TextStyle(color: Colors.black, fontWeight: FontWeight.w800, fontSize: 16);
  final TextStyle fruitJuiceStyle1 =
      TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22);
  final FruitList fruitJuiceList = FruitList();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 250,
            decoration: BoxDecoration(
                color: Colors.pink,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              decoration: InputDecoration(border: InputBorder.none,
                                  suffixIcon: Icon(
                                    Icons.search,
                                    color: Colors.pink,
                                  ),
                                  hintText: 'Search juice here',
                                  hintStyle: TextStyle(
                                      fontSize: 15, color: Colors.pink)),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 100,
                    ),
                    Expanded(
                      flex: 0,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                            height: 48,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.5),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4))),
                            child: Icon(
                              Icons.more_vert,
                              color: Colors.white,
                            )),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    buildFruitCards('images/avocado.jpeg'),
                    buildFruitCards('images/mango.jpeg'),
                    buildFruitCards('images/apple.jpeg'),
                    buildFruitCards('images/grape.jpeg'),
                    buildFruitCards('images/banana.jpeg'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Avocado',
                        style: fruitStyle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Mango',
                        style: fruitStyle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Apple',
                        style: fruitStyle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Grape',
                        style: fruitStyle,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Banana',
                        style: fruitStyle,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(padding: EdgeInsets.all(8),
                  shrinkWrap: true,
                  itemCount: fruitJuiceList.fruitJuiceList.length,
                  itemBuilder: (context, index) {
                    var fruit = fruitJuiceList.fruitJuiceList[index];
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(color: Colors.white,margin: EdgeInsets.all(5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  fruit.title,
                                  style: fruitJuiceStyle1,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  fruit.desc,
                                  style: fruitJuiceStyle2,
                                ),
                              ),
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'N' + fruit.price.toString(),
                                      style: fruitJuiceStyle2,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(margin: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        color: fruit.color,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: <Widget>[
                                          IconButton(
                                              icon: Icon(
                                                Icons.remove,
                                                color: Colors.white,
                                              ),
                                              onPressed: () {}),
                                          Text(
                                            fruit.quantity.toString(),
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                          IconButton(
                                              icon: Icon(
                                                Icons.add,
                                                color: Colors.white,
                                              ),
                                              onPressed: () {}),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          FruitJuiceDetailPage(fruitJuiceModel: fruit,)));
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Container(
                                height: 180,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: fruit.color.withOpacity(0.8),
                                    image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(fruit.image))),
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  }))
        ],
      ),
    );
  }

  buildFruitCards(
    String image,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.2),
            borderRadius: BorderRadius.circular(5),
            image:
                DecorationImage(fit: BoxFit.cover, image: AssetImage(image))),
      ),
    );
  }
}

class FruitJuiceModel {
  final String title;
  final String desc;
  final double price;
  final int quantity;
  final String image;
  final Color color;

  FruitJuiceModel(
      {this.title,
      this.desc,
      this.price,
      this.quantity,
      this.image,
      this.color});
}

class FruitList {
  List<FruitJuiceModel> fruitJuiceList = [
    FruitJuiceModel(
        title: 'Apple Juice',
        desc:
            'Lorem ipsum sit amet, \nconsectetur adipisicing\n elit sed do eiusmod',
        price: 12.45,
        quantity: 1,
        image: 'images/apple_juice.png',
        color: Colors.pink.withOpacity(0.7)),
    FruitJuiceModel(
        title: 'Pineapple Juice',
        desc:
            'Lorem ipsum sit amet, \nconsectetur adipisicing\n elit sed do eiusmod',
        price: 15.45,
        quantity: 1,
        image: 'images/pineapple_juice.png',
        color: Colors.yellowAccent.shade700),
    FruitJuiceModel(
        title: 'Grape Juice',
        desc:
            'Lorem ipsum sit amet, \nconsectetur adipisicing\n elit sed do eiusmod',
        price: 12.45,
        quantity: 1,
        image: 'images/grape_juice.png',
        color: Colors.purple.shade700),
  ];
}
