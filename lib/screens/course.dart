import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_flutter_app/constants/const.dart';
import 'package:my_flutter_app/model/Course.dart';
import 'package:my_flutter_app/model/Tutorial.dart';
import 'package:my_flutter_app/screens/tutorial.dart';

import 'package:my_flutter_app/service/ApiService.dart';
import 'package:blur/blur.dart';
import 'package:my_flutter_app/utils/Blurbox.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class SelectedCourse extends StatefulWidget {
  final String selectedCourse;
  SelectedCourse({required this.selectedCourse});
  @override
  _SelectedCategoryState createState() => _SelectedCategoryState();
}

class _SelectedCategoryState extends State<SelectedCourse> {
  String url = dotenv.get("BASE_URL");
  List<TutorialModel> tutorials = [];
  List<String> imagePathForCategories = Consts().imagePathsForCategories;
  List<String> imagePathsForCourses = Consts().imagePathsForCourses;
  late CourseModel courseModel;
  bool isLoading = true;
  bool isLoading2 = true;
  String errorMessage = "";
  String get selectedCourse => widget.selectedCourse;
  @override
  void initState() {
    super.initState();
    fetchData();
    fetchTutorials();
    print(url);
  }

  void fetchData() async {
    try {
      courseModel = await ApiService(url).fetchCourseById(selectedCourse);

      //print(courseModel.courses.map((e) => e.description));

      //isLoading = false;

      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    } on DioError catch (e) {
      print("DioError: $e");
      errorMessage = "Failed to fetch data. Please try again later.";

      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      print("Error: $e");
      errorMessage = "An unexpected error occurred.";

      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  void fetchTutorials() async {
    try {
      tutorials = await ApiService(url)
          .fetchData("tutorial", (e) => TutorialModel.fromJson(e));
      print(tutorials[0].title);
      if (mounted) {
        setState(() {
          isLoading2 = false;
        });
      }
    } catch (e) {
      print("Error: $e");
      if (mounted) {
        setState(() {
          isLoading2 = false;
        });
      }
      errorMessage = "Failed to fetch data. Please try again later.";
    }
  }

  @override
  Widget build(BuildContext context) {
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
                color: Colors.white,
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
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/img/logo.png"),
                        fit: BoxFit.contain)),
              )
            ],
          ),
          elevation: 0.0,
        ),
        body: isLoading
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
                : ListView(
                    children: [
                      Container(
                        width: w,
                        height: h * 1.1,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            // Import image in pubspec.yaml first
                            image: AssetImage('assets/img/cat4.jpg'),
                            // BoxFit.cover scales up the image until it completely covers the screen
                            fit: BoxFit.cover,
                          ),
                        ),
                        padding:
                            EdgeInsets.only(left: w * 0.025, right: w * 0.025),
                        child: Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: w * 0.95,
                                child: Text(
                                  courseModel.title,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.robotoSlab(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w500,
                                    color: const Color.fromARGB(
                                        221, 255, 253, 253),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  width: 140,
                                  margin: EdgeInsets.only(top: 10),
                                  height: h * 0.2,
                                  color: Colors.transparent,
                                  child: FrostedGlassBox(
                                    radius: 30.0,
                                    theWidth: 200.0,
                                    theHeight: 200.0,
                                    padding: 10.0,
                                    theChild: Image(
                                      image: AssetImage(imagePathsForCourses[
                                          int.parse(courseModel.image)]),
                                    ),
                                  )),
                            ],
                          ),
                          Row(
                            children: [
                              Flexible(
                                child: Container(
                                  margin: EdgeInsets.only(top: 20),
                                  child: FrostedGlassBox(
                                    padding: 5.0,
                                    radius: 10.0,
                                    theHeight: 200.0,
                                    theWidth: w,
                                    theChild: Text(
                                      courseModel.description,
                                      textAlign: TextAlign.justify,
                                      style: GoogleFonts.montserrat(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                        color:
                                            Color.fromARGB(221, 255, 255, 255),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(top: 70),
                                  child: Text(
                                    "Tutorials",
                                    style: GoogleFonts.montserrat(
                                      fontSize: 30,
                                      fontWeight: FontWeight.w700,
                                      color: Color.fromARGB(221, 255, 255, 255),
                                    ),
                                  )),
                              Container(
                                height: h * 0.3,
                                padding: EdgeInsets.all(10),
                                width: w * 0.95,
                                margin: EdgeInsets.only(top: 0),
                                child: isLoading2
                                    ? Center(
                                        child: CircularProgressIndicator(),
                                      )
                                    : errorMessage.isNotEmpty
                                        ? Center(
                                            child: Text(
                                              errorMessage,
                                              style:
                                                  TextStyle(color: Colors.red),
                                            ),
                                          )
                                        : ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: tutorials.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              String tutorialTitle =
                                                  tutorials[index].title;

                                              return Container(
                                                margin: EdgeInsets.only(
                                                    left: 5,
                                                    top: 5,
                                                    bottom: 5,
                                                    right: 5),
                                                child: TextButton(
                                                  style: ButtonStyle(
                                                    foregroundColor:
                                                        MaterialStateProperty
                                                            .all(Colors.white),
                                                    padding:
                                                        MaterialStateProperty
                                                            .all(EdgeInsets.all(
                                                                1.0)),
                                                    elevation:
                                                        MaterialStateProperty
                                                            .all(4.0),
                                                    shape: MaterialStateProperty
                                                        .all(
                                                      RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30.0),
                                                      ),
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            SelectedTutorial(
                                                             tutorialModel: tutorials[index],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  child: FrostedGlassBox(
                                                    radius: 10.0,
                                                    theHeight: 170.0,
                                                    theWidth: 240.0,
                                                    padding: 1.0,
                                                    theChild: Container(
                                                      width: 200,
                                                      margin: EdgeInsets.all(5),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          SizedBox(height: 8),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Container(
                                                                width: 200,
                                                                child: Text(
                                                                  tutorialTitle,
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  style: GoogleFonts
                                                                      .montserrat(
                                                                    fontSize:
                                                                        20.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Color
                                                                        .fromARGB(
                                                                            255,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                  ),
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
                          )
                        ]),
                      )
                    ],
                  ));
  }
}
