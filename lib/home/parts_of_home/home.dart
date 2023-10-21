import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeUi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
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
    return Scaffold(
      backgroundColor: Color(0xFFeeedf2),
      body: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(left: w * 0.025, right: w * 0.025),
            //color: Colors.green,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      child: IconButton(
                        icon: Icon(
                          Icons.menu,
                          size: 30,
                        ),
                        onPressed: () {},
                        splashColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                      ),
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            IconButton(
                              splashColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onPressed: () {},
                              icon: Container(
                                width: 60,
                                height: 60,
                                child: Image.asset("assets/img/tl.png",
                                    fit: BoxFit.cover),
                              ),
                            ),
                            Container(
                              width: 30,
                              height: 30,
                              margin: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage("assets/img/in2.png"))),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: w * 0.95,
                      //color: Colors.red,
                      height: 50,
                      //margin:
                      // EdgeInsets.only(left: w * 0.025, right: w * 0.025),
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
                    )
                  ],
                ),
                SizedBox(
                  height: h * 0.05,
                ),
                Column(
                  children: [
                    Container(
                      child: Align(
                        alignment: Alignment(-1.0, 0.0),
                        child: Text(
                          "Categories",
                          style: TextStyle(
                            fontSize: 20, // Increase text size
                            color: Colors.black87, // Change text color
                            fontWeight: FontWeight.bold, // Increase font weight
                            fontFamily:
                                'Sans-serif', // Change font family (replace 'YourFontFamily' with the desired font family)
                          ),
                        ),
                      ),
                    ),
                    Container(
                        height: 180,
                        padding: EdgeInsets.all(10),
                        width: w * 0.95,
                        margin: EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              offset: const Offset(
                                5.0,
                                5.0,
                              ),
                              blurRadius: 10.0,
                              spreadRadius: 2.0,
                            ), //BoxShadow
                            BoxShadow(
                              color: Color(0xFFD9D9D9),
                              offset: const Offset(0.0, 0.0),
                              blurRadius: 0.0,
                              spreadRadius: 0.0,
                            ), //BoxShadow
                          ],
                        ),
                        //margin:
                        //EdgeInsets.only(left: w * 0.025, right: w * 0.025),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10, // Number of cards
                          itemBuilder: (BuildContext context, int index) {
                            // Replace 'assets/your_image.png' with the actual image asset path
                            String imagePath =
                                imagePaths[index % imagePaths.length];
                            String catN = catName[index % catName.length];

                            return Container(
                              margin: EdgeInsets.only(
                                  left: 5, top: 5, bottom: 5, right: 5),
                              child: TextButton(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                        Colors
                                            .blue.shade200), // Background color
                                    foregroundColor: MaterialStateProperty.all(
                                        Colors.white), // Text color
                                    padding: MaterialStateProperty.all(
                                        EdgeInsets.all(1.0)),
                                    // Padding around text

                                    elevation: MaterialStateProperty.all(
                                        4.0), // Elevation (shadow)
                                    shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                            10.0), // Rounded corners
                                      ),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Container(
                                    width: 150, // Adjust the width of the card
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
                                          color: Colors.white,
                                          offset: const Offset(0.0, 0.0),
                                          blurRadius: 0.0,
                                          spreadRadius: 0.0,
                                        ),
                                      ],
                                    ),
                                    child: Column(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(top: 10),
                                          width: 100, // Adjust the image width
                                          height:
                                              100, // Adjust the image height
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: AssetImage(
                                                  imagePath), // Use the image path
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                            height:
                                                8), // Add spacing between image and text
                                        Text(
                                          catN,
                                          style: TextStyle(
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blue.shade400),
                                        ),
                                      ],
                                    ),
                                  )),
                            );
                          },
                        )),
                  ],
                ),
                SizedBox(
                  height: h * 0.04,
                ),
                Column(
                  children: [
                    Container(
                      child: Align(
                        alignment: Alignment(-1.0, 0.0),
                        child: Text(
                          "On going courses",
                          style: TextStyle(
                            fontSize: 15, // Increase text size
                            color: Colors.black45, // Change text color
                            fontWeight: FontWeight.bold, // Increase font weight
                            fontFamily:
                                'Sans-serif', // Change font family (replace 'YourFontFamily' with the desired font family)
                          ),
                        ),
                      ),
                    ),
                    Container(
                        height: 200,
                        padding: EdgeInsets.all(10),
                        width: w * 0.95,
                        margin: EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              offset: const Offset(
                                5.0,
                                5.0,
                              ),
                              blurRadius: 10.0,
                              spreadRadius: 2.0,
                            ), //BoxShadow
                            BoxShadow(
                              color: Colors.white,
                              offset: const Offset(0.0, 0.0),
                              blurRadius: 0.0,
                              spreadRadius: 0.0,
                            ), //BoxShadow
                          ],
                        ),
                        //margin:
                        //EdgeInsets.only(left: w * 0.025, right: w * 0.025),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10, // Number of cards
                          itemBuilder: (BuildContext context, int index) {
                            // Replace 'assets/your_image.png' with the actual image asset path
                            String imagePath =
                                imagePaths[index % imagePaths.length];
                            int colorCode = 0;
                            if (index % 2 == 0) {
                              colorCode = 0xFF1A4C6E;
                            } else {
                              colorCode = 0xFF845647;
                            }
                            return TextButton(
                                onPressed: () {},
                                child: Container(
                                  width: 230, // Adjust the width of the card
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
                                    padding: EdgeInsets.all(10),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              width:
                                                  35, // Adjust the image width
                                              height:
                                                  35, // Adjust the image height
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
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
                                                  color: Colors.white,
                                                  fontSize: 15),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Container(
                                              width: 210,
                                              height: 10,
                                              margin: EdgeInsets.only(
                                                  top: 15, bottom: 10),
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
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              Text(
                                                "10 Exersices",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.w400),
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
                                                    fontWeight:
                                                        FontWeight.w400),
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
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ));
                          },
                        )),
                  ],
                ),
                SizedBox(
                  height: h * 0.04,
                ),
                Column(
                  children: [
                    Container(
                      child: Align(
                        alignment: Alignment(-1.0, 0.0),
                        child: Text(
                          "Recomandations",
                          style: TextStyle(
                            fontSize: 15, // Increase text size
                            color: Colors.black45, // Change text color
                            fontWeight: FontWeight.bold, // Increase font weight
                            fontFamily:
                                'Sans-serif', // Change font family (replace 'YourFontFamily' with the desired font family)
                          ),
                        ),
                      ),
                    ),
                    Container(
                        height: 140,
                        padding: EdgeInsets.all(10),
                        width: w * 0.95,
                        margin: EdgeInsets.only(top: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              offset: const Offset(
                                5.0,
                                5.0,
                              ),
                              blurRadius: 10.0,
                              spreadRadius: 2.0,
                            ), //BoxShadow
                            BoxShadow(
                              color: Colors.white,
                              offset: const Offset(0.0, 0.0),
                              blurRadius: 0.0,
                              spreadRadius: 0.0,
                            ), //BoxShadow
                          ],
                        ),
                        //margin:
                        //EdgeInsets.only(left: w * 0.025, right: w * 0.025),
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10, // Number of cards
                          itemBuilder: (BuildContext context, int index) {
                            // Replace 'assets/your_image.png' with the actual image asset path
                            String imagePath =
                                imagePaths[index % imagePaths.length];
                            ;

                            return Container(
                              width: 80, // Adjust the width of the card
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
                                    color: Colors.yellow.shade50,
                                    offset: const Offset(0.0, 0.0),
                                    blurRadius: 0.0,
                                    spreadRadius: 0.0,
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    width: 75, // Adjust the image width
                                    height: 75, // Adjust the image height
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: AssetImage(
                                            imagePath), // Use the image path
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                      height:
                                          8), // Add spacing between image and text
                                  Text(
                                    "Name",
                                    style: TextStyle(
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        )),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      child: Text("dsd"),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
