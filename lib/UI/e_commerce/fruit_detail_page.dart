import 'package:flutter/material.dart';
import 'package:flutter_ui/UI/e_commerce/fruit_juice_app.dart';

class FruitJuiceDetailPage extends StatelessWidget {
  final FruitJuiceModel fruitJuiceModel;
  FruitJuiceDetailPage({this.fruitJuiceModel});
  final TextStyle fruitStyle =
      TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.w800);
  final TextStyle fruitJuiceStyle2 =
      TextStyle(color: Colors.black, fontWeight: FontWeight.w800, fontSize: 18);
  final TextStyle fruitJuiceStyle1 =
      TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height / 2,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.contain,
                    image: AssetImage(fruitJuiceModel.image)),
                color: Colors.pink,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30))),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  flex: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Container(
                        height: 48,
                        width: 50,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.5),
                            borderRadius: BorderRadius.all(Radius.circular(4))),
                        child: IconButton(icon: Icon(
                          Icons.arrow_back_ios,
                          color: Colors.white,
                        ), onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>JuiceAppPage()));})),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: IconButton(
                      icon: Icon(Icons.more_vert, color: Colors.white),
                      onPressed: () {}),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              fruitJuiceModel.title,
              style: fruitStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2,left: 8),
            child: Text(
              'Lemonade juice',
              style: fruitJuiceStyle2,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('N'+fruitJuiceModel.price.toString(),style: fruitJuiceStyle2,),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.pink, borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    children: <Widget>[
                      IconButton(
                          icon: Icon(
                            Icons.remove,
                            color: Colors.white,
                          ),
                          onPressed: () {}),
                      Text(
                        '1',
                        style: TextStyle(color: Colors.white),
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
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8),
            child: Text(
              'About Product',
              style: fruitStyle,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2,left: 8,right: 8,bottom: 2),
            child: Text(
              'Lorem ipsum sit amet, consectetur adipisicing elit sed do eiusmod consectetur adipisicing',
              style: fruitJuiceStyle2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Container(width: MediaQuery.of(context).size.width/1.1,
              height: 65,
                child: FlatButton(
                    shape: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    color: Colors.pink,
                    onPressed: () {},
                    child: Text(
                      'Add to Cart',style: TextStyle(fontSize: 20,color: Colors.white),
                    )),
              ),
            ),
          )
      ],
    ),
        ));
  }
}
