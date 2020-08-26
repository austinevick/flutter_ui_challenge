import 'package:flutter/material.dart';

import 'login_page.dart';

class SignUpScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    colorFilter:
                        ColorFilter.mode(Colors.black12, BlendMode.lighten),
                    fit: BoxFit.cover,
                    image: AssetImage('images/green.jpg'))),
            child: ClipPath(
              clipper: Clippers(),
              child: Container(
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
              left: 20,
              top: 75,
              child: Text(
                'Register',
                style: TextStyle(fontSize: 25, color: Colors.white),
              )),
          Positioned(
            left: 20,
            top: 112,
            child: Text('Create your new account',
                style: TextStyle(fontSize: 15, color: Colors.white60)),
          ),
          Center(
            child: Material(
              elevation: 10,
              borderRadius: BorderRadius.circular(15),
              child: Container(
                height: 420,
                width: 350,
                padding: EdgeInsets.all(25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Form(
                        child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Full Name'),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Your email address',
                          ),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Password',
                          ),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Confirm password',
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                            width: double.infinity,
                            height: 40,
                            child: FlatButton(
                                shape: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(50),
                                    borderSide: BorderSide.none),
                                color: Colors.green,
                                onPressed: () {},
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.white),
                                ))),
                      ],
                    ))
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 650,
            left: 80,
            child: Text('Already have an account?',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey)),
          ),
          Positioned(
            top: 635,
            left: 240,
            child: FlatButton(
                onPressed: () {},
                child: Text('Sign in',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w800,
                        color: Colors.green))),
          )
        ],
      ),
    );
  }
}
