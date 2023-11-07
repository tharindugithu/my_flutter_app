import 'package:flutter/material.dart';
import 'package:my_flutter_app/home/home_screen.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  bool isITStudent = false;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFFFFFFF),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 15.0, left: 40.0, right: 40.0),
            width: w,
            height: h * 0.1,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/img/logo.png"),
                    fit: BoxFit.contain)),
          ),
          Container(
            margin: EdgeInsets.only(left: 20.0, right: 20.0, top: 40.0),
            width: w,
            height: h * 0.65,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 0.0, right: 0.0, bottom: 10.0),
                  width: w,
                  height: h * 0.4,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage("assets/img/quiz.png"),
                    fit: BoxFit.contain,
                  )),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 15.0),
                  child: Text(
                    "Are you an IT-related student?",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF3A3A3A),
                        fontFamily: 'Arial'),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(
                      value: true,
                      groupValue: isITStudent,
                      onChanged: (value) {
                        setState(() {
                          isITStudent = value as bool;
                        });
                      },
                    ),
                    Text("Yes"),
                    Radio(
                      value: false,
                      groupValue: isITStudent,
                      onChanged: (value) {
                        setState(() {
                          isITStudent = value as bool;
                        });
                      },
                    ),
                    Text("No"),
                  ],
                ),
                ElevatedButton(
                  onPressed: () {
                    if (isITStudent) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomeScreen()));
                    } else {}
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(0.1),
                    elevation: 0,
                    backgroundColor: Color(0xFFFFFFFF),

                    // Button padding
                  ),
                  child: Container(
                    width: w * 0.5,
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: LinearGradient(
                        colors: [
                          Color.fromARGB(255, 8, 236, 20), // Start color
                          Color.fromARGB(255, 0, 87, 124), // End color
                        ],
                      ),
                    ),
                    child: Center(
                      child: Text(
                        "Submit",
                        style: TextStyle(
                          color: Colors.white, // Text color
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
