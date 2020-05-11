import 'package:flutter/material.dart';

class CalculatorAppPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.black,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Flexible(
                flex: 3,
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.bottomRight,
                  height: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('0',style: TextStyle(fontSize: 50,
                    color: Colors.white),),
                  ),
                
                )),
            Flexible(
                flex: 5,
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Flexible(
                          flex: 1,
                          child: Container(
                            color: Colors.black12,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Flexible(
                                    child: CustomButton(
                                  text: 'C',
                                )),
                                Flexible(
                                    child: CustomButton(
                                  text: '+/-',
                                )),
                                Flexible(
                                    child: CustomButton(
                                  text: '%',
                                )),
                                Flexible(
                                    child: CustomButton(
                                  text: '\u00F7',
                                )),
                              ],
                            ),
                          )),
                      Flexible(
                          flex: 1,
                          child: Container(
                            color: Colors.black26,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Flexible(
                                    child: CustomButton(
                                  text: '7',
                                )),
                                Flexible(
                                    child: CustomButton(
                                  text: '8',
                                )),
                                Flexible(
                                    child: CustomButton(
                                  text: '9',
                                )),
                                Flexible(
                                    child: CustomButton(
                                  text: 'x',
                                )),
                              ],
                            ),
                          )),
                      Flexible(
                          flex: 1,
                          child: Container(
                            color: Colors.black38,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Flexible(
                                    child: CustomButton(
                                  text: '4',
                                )),
                                Flexible(
                                    child: CustomButton(
                                  text: '5',
                                )),
                                Flexible(
                                    child: CustomButton(
                                  text: '6',
                                )),
                                Flexible(
                                    child: CustomButton(
                                  text: '-',
                                )),
                              ],
                            ),
                          )),
                      Flexible(
                          flex: 1,
                          child: Container(
                            color: Colors.black45,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Flexible(
                                    child: CustomButton(
                                  text: '1',
                                )),
                                Flexible(
                                    child: CustomButton(
                                  text: '2',
                                )),
                                Flexible(
                                    child: CustomButton(
                                  text: '3',
                                )),
                                Flexible(
                                    child: CustomButton(
                                  text: '+',
                                )),
                              ],
                            ),
                          )),
                      Flexible(
                          flex: 1,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Flexible(
                                  flex: 2,
                                  child: CustomButton(
                                    text: '0',
                                  )),
                              Flexible(
                                  child: CustomButton(
                                text: '.',
                              )),
                              Flexible(
                                  child: CustomButton(
                                text: '',
                              )),
                            ],
                          )),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;

  const CustomButton({Key key, this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(4),
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.white24,
          borderRadius: BorderRadius.all(Radius.circular(16))),
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 26),
      ),
    );
  }
}
