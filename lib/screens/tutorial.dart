import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_flutter_app/constants/const.dart';
import 'package:my_flutter_app/model/ActivityModel.dart';
import 'package:my_flutter_app/model/Course.dart';
import 'package:my_flutter_app/model/Tutorial.dart';
import 'package:my_flutter_app/screens/activity.dart';

import 'package:my_flutter_app/service/ApiService.dart';
import 'package:blur/blur.dart';
import 'package:my_flutter_app/utils/Blurbox.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class SelectedTutorial extends StatefulWidget {
  //final String selectedTutorial;
  final TutorialModel tutorialModel;
  SelectedTutorial({required this.tutorialModel});
  @override
  _SelectedTutorialState createState() => _SelectedTutorialState();
}

class _SelectedTutorialState extends State<SelectedTutorial> {
  String url = dotenv.get("BASE_URL");
  String get videoUrl => widget.tutorialModel.tutorialUrl;
  late List<ActivityModel> activities;
  List<String> imagePathForCategories = Consts().imagePathsForCategories;
  List<String> imagePathsForCourses = Consts().imagePathsForCourses;
  //late TutorialModel tutorialModel;
  bool isLoading = true;
  bool isLoading2 = true;
  String errorMessage = "";
  String get selectedTutorial => widget.tutorialModel.id;
  late YoutubePlayerController _controller;

  @override
  void initState() {
    final videoId = YoutubePlayer.convertUrlToId(videoUrl);
    _controller = YoutubePlayerController(
      initialVideoId: videoId ?? '',
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        showLiveFullscreenButton: false,
      ),
    );
    setState(() {
      isLoading = false;
    });
    super.initState();
    //print("--------------------------" + tutorialModel.tutorialUrl);
  }

  void fetchData() async {
    try {
      activities = await ApiService(url).fetchData<ActivityModel>(
          "tutorial/$selectedTutorial", (e) => ActivityModel.fromJson(e));

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

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
        ),
        builder: (context, player) {
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
                              height: h * 0.9,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  // Import image in pubspec.yaml first
                                  image: AssetImage('assets/img/cat4.jpg'),
                                  // BoxFit.cover scales up the image until it completely covers the screen
                                  fit: BoxFit.cover,
                                ),
                              ),
                              padding: EdgeInsets.only(
                                  left: w * 0.025, right: w * 0.025),
                              child: Column(children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: w * 0.95,
                                      child: Text(
                                        widget.tutorialModel.title
                                            .split(":")[0],
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
                                  children: [
                                    Container(
                                      width: w * 0.95,
                                      height: h * 0.1,
                                      child: Center(
                                        child: Text(
                                          "Tutorial video for base on the selected course relavaent part.",
                                          style: GoogleFonts.anekBangla(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500,
                                            color: const Color.fromARGB(
                                                221, 255, 253, 253),
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
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
                                          theChild:
                                              player, // This is the first video
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                //  Row(
                                //   mainAxisAlignment: MainAxisAlignment.center,
                                //   crossAxisAlignment: CrossAxisAlignment.center,
                                //   children: [
                                //     Container(
                                //       width: w * 0.95,
                                //       margin: EdgeInsets.only(top: 10),
                                //       height: h * 0.4,
                                //       color: Colors.transparent,
                                //       child: Image(
                                //         image: AssetImage("assets/img/books.gif"),
                                //       ),
                                //     )
                                //   ],
                                // ),
                                SizedBox(
                                  height: h*0.33,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      width: w * 0.95,
                                      child: ElevatedButton.icon(
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Activity()));
                                        },
                                        icon: Icon(
                                          Icons
                                              .arrow_circle_right_outlined, // You can change the icon to any desired icon
                                          size: 24,
                                        ),
                                        label: Text(
                                          'Go to activity', // Text label for the button
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          primary: Color.fromARGB(255, 66, 146,
                                              189), // Button background color
                                          onPrimary: Colors
                                              .white, // Text color on the button
                                          elevation: 3, // Button elevation
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                8), // Button border radius
                                          ),
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 16,
                                              vertical: 10), // Button padding
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                               
                              ]),
                            )
                          ],
                        ));
        });
  }
}
