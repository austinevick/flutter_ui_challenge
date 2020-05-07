import 'package:flutter/material.dart';
import 'package:flutter_ui/UI/login_page/signup_page.dart';

class LoginPage extends StatelessWidget {
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
              top: 80,
              child: Text(
                'Welcome',
                style: TextStyle(fontSize: 25, color: Colors.white),
              )),
          Positioned(
            left: 20,
            top: 120,
            child: Text('Login to your account',
                style: TextStyle(fontSize: 15, color: Colors.white60)),
          ),
          Center(
            child: Material(
              elevation: 10,
              borderRadius: BorderRadius.circular(15),
              child: Container(
                height: 400,
                padding: EdgeInsets.all(25),
                width: 350,
                child: Column(
                  children: <Widget>[
                    Form(
                        child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Email'),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              labelText: 'Password',
                              suffixIcon: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Text(
                                  'Forgot',
                                  style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.w800),
                                ),
                              )),
                        ),
                        SizedBox(height: 25,),
                        Padding(
                          padding: const EdgeInsets.only(left: 12,right: 12),
                          child: Container(width: double.infinity,height: 40,
                              child: FlatButton(
                                  shape: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(50),
                                      borderSide: BorderSide.none),
                                  color: Colors.green,
                                  onPressed: () {},
                                  child: Text('Sign in',style: 
                                  TextStyle(fontSize: 18,color: Colors.white),))),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('or',style: 
                                  TextStyle(fontSize: 18,color: Colors.black)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 12,right: 12),
                          child: Container(width: double.infinity,height: 40,
                              child: FlatButton(shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(50),
                                borderSide: BorderSide(color: Colors.green)),
                                  onPressed: () {},
                                  child: Text('Sign in with google',style: 
                                    TextStyle(fontSize: 18,color: Colors.green)))),
                        )
                      ],
                    ))
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 600,
            left: 80,
            child: Text('Don\'t have an account?',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey)),
          ),
          Positioned(
            top: 585,
            left: 220,
            child: FlatButton(
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => SignUpScreen()));
                },
                child: Text('Sign Up',
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

class Clippers extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var roundnessFactor = 200.0;
    var path = Path();
    path.moveTo(0, size.height / 1.5);
    path.lineTo(0, size.height);
    path.quadraticBezierTo(0, size.height, roundnessFactor, size.height);
    path.lineTo(size.width - roundnessFactor, size.height);
    path.quadraticBezierTo(size.width, size.height, size.width, size.height);
    path.lineTo(size.width, roundnessFactor * 2);
    path.quadraticBezierTo(
        size.width, roundnessFactor, size.width, roundnessFactor * 1.5);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
