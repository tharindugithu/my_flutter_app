import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/material.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  bool isITStudent = false;
  @override
  Widget build(BuildContext context) {
    List<String> imagePaths = [
      'assets/img/HEROKU.png',
      'assets/img/html.png',
      'assets/img/javascript.png',
      'assets/img/mongo.png',
      'assets/img/MYSQL.png',
      'assets/img/nextjs.png',
      'assets/img/node.png',
      'assets/img/PHP.png',
      'assets/img/react.png',
      'assets/img/css.png',
      // Add more image paths as needed
    ];
    List<String> catName = [
      'Heroku',
      'CSS',
      'Java Script',
      'MONGO',
      'MYSQL',
      'NEXTJS',
      'NODE',
      'PHP',
      'REACT',
      'CSS',
      // Add more image paths as needed
    ];
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: h * 0.14,
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        leading: Container(
          margin: EdgeInsets.only(bottom: h * 0.08, right: h * 0.03),
          width: 32.0,
          height: 32.0,
          child: IconButton(
            icon: Icon(
              Icons.arrow_circle_left_outlined,
              size: 30,
            ),
            // Image.asset(
            //   "assets/img/larrow.png",
            //   width: 18.0,
            //   height: 18.0,
            // ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        title: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 5.0, left: 0, right: 40.0),
              width: w,
              height: h * 0.1,
              child: Center(
                child: Text("Catogaries".toUpperCase(),
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                      fontFamily: 'Arial',
                    )),
              ),
            )
          ],
        ),
        elevation: 0.0,
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFFFFFFF),
      body: Container(
        height: h * 0.9,
        width: w,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 244, 245, 244), // Start color
              Color.fromARGB(255, 139, 199, 224), // End color
            ],
            begin: Alignment.topCenter, // Optional start point of the gradient
            end: Alignment.bottomCenter, // Optional end point of the gradient
          ),
        ),
        child: Column(
          children: [
            Container(
              width: w * 0.95,
              //color: Colors.red,
              height: 50,
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    //color: Colors.greenAccent[200],
                    color: Colors.black12,
                    offset: const Offset(
                      5.0,
                      5.0,
                    ),
                    blurRadius: 10.0,
                    spreadRadius: 2.0,
                  ), //BoxShadow
                  BoxShadow(
                    color: Colors.yellow.shade50,
                    offset: const Offset(0.0, 0.0),
                    blurRadius: 0.0,
                    spreadRadius: 0.0,
                  ), //BoxShadow
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: w * 0.6,
                    height: 50,
                    child: TextField(
                      onChanged: (text) {
                        print('Text entered: $text');
                      },
                      decoration: InputDecoration(
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                      ),
                    ),
                  ),
                  Container(
                    width: w * 0.2,
                    child: IconButton(
                      icon: Align(
                        alignment: Alignment(1.0, 0.0),
                        child: Icon(
                          FluentSystemIcons.ic_fluent_search_filled,
                          size: 25,
                          color: Colors.brown[400],
                        ),
                      ),
                      onPressed: () {},
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                    ),
                  )
                ],
              ),
            ),
            Container(
                height: h * 0.7,
                padding: EdgeInsets.all(10),
                width: w * 0.95,
                margin: EdgeInsets.only(top: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  // boxShadow: [
                  //   BoxShadow(
                  //     color: Colors.black26,
                  //     offset: const Offset(
                  //       5.0,
                  //       5.0,
                  //     ),
                  //     blurRadius: 10.0,
                  //     spreadRadius: 2.0,
                  //   ), //BoxShadow
                  //   BoxShadow(
                  //     color: Colors.transparent,
                  //     offset: const Offset(0.0, 0.0),
                  //     blurRadius: 0.0,
                  //     spreadRadius: 0.0,
                  //   ), //BoxShadow
                  // ],
                ),
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 10, // Number of cards
                  itemBuilder: (BuildContext context, int index) {
                    // Replace 'assets/your_image.png' with the actual image asset path
                    String imagePath = imagePaths[index % imagePaths.length];
                    int colorCode = 0;
                    if (index % 2 == 0) {
                      colorCode = 0xFF1A4C6E;
                    } else {
                      colorCode = 0xFF845647;
                    }
                    return TextButton(
                        onPressed: () {},
                        child: Container(
                          width: w * 0.9, // Adjust the width of the card
                          margin: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                offset: const Offset(5.0, 5.0),
                                blurRadius: 10.0,
                                spreadRadius: 2.0,
                              ),
                              BoxShadow(
                                color: Color(colorCode),
                                offset: const Offset(0.0, 0.0),
                                blurRadius: 0.0,
                                spreadRadius: 0.0,
                              ),
                            ],
                          ),
                          child: Container(
                            height: 250,
                            padding: EdgeInsets.all(10),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 35, // Adjust the image width
                                      height: 35, // Adjust the image height
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              imagePath), // Use the image path
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "Name of Course",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: 210,
                                      height: 10,
                                      margin:
                                          EdgeInsets.only(top: 15, bottom: 10),
                                      child: Slider(
                                        activeColor: Colors.green
                                            .shade400, // Set the color of the active track
                                        inactiveColor: Colors
                                            .grey, // Set the color of the inactive track
                                        label: "Select Age",
                                        onChanged: (double newValue) {
                                          // Handle the new value here
                                          // You can update a variable or perform any action you need
                                        },
                                        min: 5,
                                        max: 10,
                                        value: 9,
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "43 videos",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Text(
                                        "10 Exersices",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                        "4.5 Reviews",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            FluentSystemIcons
                                                .ic_fluent_star_filled,
                                            color: Colors.yellow,
                                          ),
                                          Text(
                                            "4.5",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 20),
                                  padding: EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Color.fromARGB(
                                            255, 252, 215, 10), // Border color
                                        width: 2.0, // Border width
                                      ),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    children: [
                                      Text(
                                        "It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, .",
                                        style: TextStyle(
                                          color: Colors.white, // Text color
                                          fontWeight: FontWeight
                                              .w400, // Font weight (e.g., FontWeight.bold for bold text)
                                          fontSize: 13, // Font size
                                          letterSpacing:
                                              1.2, // Letter spacing (adjust as needed)
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ));
                  },
                )),
            Container(),
          ],
        ),
      ),
    );
  }
}
