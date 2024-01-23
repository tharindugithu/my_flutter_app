import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_flutter_app/auth/login_page.dart';
import 'package:my_flutter_app/auth/signup_page.dart';
import 'package:my_flutter_app/home/home_screen.dart';
import 'package:my_flutter_app/loading/initial_loading.dart';

void main() async {
  await dotenv.load(fileName: ".env");

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyDyP0Skge1nDdr5Rm8Gy8jbDPxa7mVcYIw",
        appId: "1:1091266292001:web:da74acf998ff4bf9663660",
        messagingSenderId: "1091266292001",
        projectId: "flutterapplication-589b4",
    ),
  );

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    // Perform any loading or initialization here
    // For example, you can use Future.delayed to simulate loading
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Firebase',
      home: _isLoading ? LoadingPage() : LoginPage(), 
      routes: {
        '/login': (context) => LoginPage(),
        '/signUp': (context) => SignUpPage(),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}
