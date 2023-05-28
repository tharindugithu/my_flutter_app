import 'package:flutter/material.dart';
import 'package:my_flutter_app/auth/login_page.dart';
import 'package:my_flutter_app/auth/signup_page.dart';
import 'package:my_flutter_app/loading/initial_loading.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Signup(),
    );
  }
}
