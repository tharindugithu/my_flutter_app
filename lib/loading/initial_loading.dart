import 'dart:async';  
import 'package:flutter/material.dart';
import 'package:my_flutter_app/auth/login_page.dart'; 

class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  late Timer _timer;  

  @override
  void initState() {
    super.initState();
    _timer = Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),  
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFF8F8FF),
      body: Container(
        width: w,
        height: h,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF19779B), 
              Color(0xFF17B3A6), 
            ],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(40.0), 
          child: DecoratedBox(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/img/logo.png"),
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
