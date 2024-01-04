import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth
import 'package:my_flutter_app/features/app/splash_screen/splash_screen.dart';
import 'package:my_flutter_app/features/user_auth/presentation/pages/home_page.dart';
import 'package:my_flutter_app/features/user_auth/presentation/pages/login_page.dart';
import 'package:my_flutter_app/features/user_auth/presentation/pages/sign_up_page.dart';
import 'package:my_flutter_app/features/user_auth/presentation/pages/ask_quiz.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        
   
      ),
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Firebase',
      routes: {
        '/': (context) => SplashScreen(
      
          child: LoginPage(),
        ),
        '/login': (context) => LoginPage(),
        '/signUp': (context) => SignUpPage(),
        '/quiz': (context) => QuizPage(),
        '/home': (context) => HomePage(),
      },
    );
  }
}
