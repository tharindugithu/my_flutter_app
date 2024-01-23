import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_flutter_app/auth/login_page.dart';
import 'package:my_flutter_app/auth/signup_page.dart';
import 'package:my_flutter_app/auth/ask_quiz.dart';
import 'package:my_flutter_app/home/home_screen.dart';
import 'package:my_flutter_app/loading/initial_loading.dart';

void main() async {
  await dotenv.load(fileName: ".env");

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: FirebaseOptions(
      //api keys
    ),
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Firebase',
      initialRoute: '/',
      routes: {
        '/': (context) => LoadingPage(),
        '/login': (context) => LoginPage(),
        '/signUp': (context) => SignUpPage(),
        '/quiz': (context) => QuizPage(),
        '/home': (context) => HomeScreen(),
      },
    );
  }
}
