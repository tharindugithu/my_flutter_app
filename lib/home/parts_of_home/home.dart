import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:my_flutter_app/constants/const.dart';
import 'package:my_flutter_app/screens/category.dart';
import 'package:my_flutter_app/service/ApiService.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:my_flutter_app/screens/categories.dart';
import 'package:my_flutter_app/model/CategoryModel.dart';
import 'package:my_flutter_app/screens/courses.dart';
import 'package:my_flutter_app/utils/Blurbox.dart';

class HomeUi extends StatefulWidget {
  @override
  _HomeUiState createState() => _HomeUiState();
}

class _HomeUiState extends State<HomeUi> {
  String url = dotenv.get("BASE_URL");

  List<CategoryModel> categories = [];
  bool isLoading = true;
  String errorMessage = "";

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    try {
      categories = await ApiService(url)
          .fetchData("category", (e) => CategoryModel.fromJson(e));
      print(categories[0].description);
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      print("Error: $e");
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
      errorMessage = "Failed to fetch data. Please try again later.";
    }
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    List<String> imagePaths = Consts().imagePaths;

    return Scaffold(
      body: ListView(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/img/home_back2.jpg"),
                    fit: BoxFit.cover)),

            padding: EdgeInsets.only(left: w * 0.025, right: w * 0.025),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Align(
                            // alignment: Alignment(-1.0, 0.0),
                            child: Text(
                              "Categories",
                              style: GoogleFonts.montserrat(
                                fontSize: 20, // Increase text size
                                color: const Color.fromARGB(
                                    221, 255, 255, 255), // Change text color
                                fontWeight:
                                    FontWeight.w500, // Increase font weight
                                // You can add more font properties here
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: IconButton(
                            icon: Icon(
                              Icons.more_horiz,
                              size: 30,
                              color: Colors.grey[500],
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CategoriesPage()));
                            },
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: 210,
                      padding: EdgeInsets.all(10),
                      width: w * 0.95,
                      margin: EdgeInsets.only(top: 0),
                      child: isLoading
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : errorMessage.isNotEmpty
                              ? Center(
                                  child: Text(
                                    errorMessage,
                                    style: TextStyle(color: Colors.red),
                                  ),
                                )
                              : ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: categories.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    String imagePath = imagePaths[
                                        int.parse(categories[index].img)];
                                    String catN = categories[index].title;

                                    return Container(
                                      margin: EdgeInsets.only(
                                          left: 5, top: 5, bottom: 5, right: 5),
                                      child: TextButton(
                                        style: ButtonStyle(
                                          foregroundColor:
                                              MaterialStateProperty.all(
                                                  Colors.white),
                                          padding: MaterialStateProperty.all(
                                              EdgeInsets.all(1.0)),
                                          elevation:
                                              MaterialStateProperty.all(4.0),
                                          shape: MaterialStateProperty.all(
                                            RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30.0),
                                            ),
                                          ),
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  SelectedCategory(
                                                selectedCategory:
                                                    categories[index].id,
                                              ),
                                            ),
                                          );
                                        },
                                        child: FrostedGlassBox(
                                          radius: 30.0,
                                          theHeight: 200.0,
                                          theWidth: 200.0,
                                          padding: 1.0,
                                          theChild: Container(
                                            width: 200,
                                            margin: EdgeInsets.all(5),
                                           
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(top: 10),
                                                  width: 100,
                                                  height: 100,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image:
                                                          AssetImage(imagePath),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: 8),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      catN,
                                                      style: GoogleFonts
                                                          .montserrat(
                                                        fontSize: 12.0,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: const Color
                                                            .fromARGB(
                                                            255, 25, 25, 25),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                      // ),
                    ),
                  ],
                ),
                SizedBox(
                  height: h * 0.05,
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Align(
                            
                            child: Text(
                              "On going courses",
                              style: GoogleFonts.montserrat(
                                fontSize: 15, // Increase text size
                                color: const Color.fromARGB(
                                    221, 255, 255, 255), // Change text color
                               
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: IconButton(
                            icon: Icon(
                              Icons.more_horiz,
                              color: Colors.grey[500],
                              size: 30,
                            ),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => CoursesPage()));
                            },
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                          ),
                        ),
                      ],
                    ),
                    Container(
                        height: 200,
                        padding: EdgeInsets.all(0),
                        width: w * 0.95,
                        margin: EdgeInsets.only(top: 5),
                        decoration: BoxDecoration(

                          
                            ),
                       
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10, // Number of cards
                          itemBuilder: (BuildContext context, int index) {
                           
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
                                 
                                  margin: EdgeInsets.all(5),
                                  decoration:
                                      BoxDecoration(color: Colors.transparent),
                                  child: FrostedGlassBox(
                                    radius: 10.0,
                                    theHeight: 160.0,
                                    theWidth: 270.0,
                                    padding: 1.0,
                                    theChild: Container(
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
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
                                                  MainAxisAlignment
                                                      .spaceBetween,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Align(
                           
                            child: Text(
                              "Recomandation",
                              style: GoogleFonts.montserrat(
                                fontSize: 15, // Increase text size
                                color: const Color.fromARGB(
                                    221, 255, 255, 255), // Change text color
                              ),
                            ),
                          ),
                        ),
                        Container(
                          child: IconButton(
                            icon: Icon(
                              Icons.more_horiz,
                              color: Colors.grey[500],
                              size: 30,
                            ),
                            onPressed: () {},
                            splashColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                          ),
                        ),
                      ],
                    ),
                    Container(
                        height: 140,
                        padding: EdgeInsets.all(10),
                        width: w * 0.95,
                        margin: EdgeInsets.only(top: 5, bottom: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                           
                          ],
                        ),
                        
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10, // Number of cards
                          itemBuilder: (BuildContext context, int index) {
                            
                            String imagePath =
                                imagePaths[index % imagePaths.length];
                            ;

                            return Container(
                              margin: EdgeInsets.only(left: 10),
                              child: FrostedGlassBox(
                                theWidth: 100.0,
                                theHeight: 100.0,
                                padding: 2.0,
                                radius: 10.0,
                                theChild: Container(
                                  width: 80, // Adjust the width of the card
                                  margin: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                  child: Column(
                                    children: [
                                      Container(
                                        width: 75, // Adjust the image width
                                        height: 75, // Adjust the image height
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
                                              7), // Add spacing between image and text
                                      Text(
                                        "Name",
                                        style: TextStyle(
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        )),
                  ],
                ),
                Row(
                  children: [
                    Container(
                        // child: Text("dsd"),
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
