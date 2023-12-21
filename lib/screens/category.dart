import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_flutter_app/constants/const.dart';
import 'package:my_flutter_app/model/CategoryModel.dart';
import 'package:my_flutter_app/service/ApiService.dart';
import 'package:blur/blur.dart';
import 'package:my_flutter_app/utils/Blurbox.dart';

class SelectedCategory extends StatefulWidget {
  final String selectedCategory;
  SelectedCategory({required this.selectedCategory});
  @override
  _SelectedCategoryState createState() => _SelectedCategoryState();
}

class _SelectedCategoryState extends State<SelectedCategory> {
  String url = dotenv.get("BASE_URL");
  List<String> imgPaths = Consts().imagePaths;
  late CategoryModel categoryModel;
  bool isLoading = true;
  String errorMessage = "";
  String get selectedCategory => widget.selectedCategory;
  @override
  void initState() {
    super.initState();
    fetchData();
    print(url);
  }

  void fetchData() async {
    try {
      categoryModel = await ApiService(url).fetchCategoryById(selectedCategory);

      print(categoryModel.img);

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
                        padding:
                            EdgeInsets.only(left: w * 0.025, right: w * 0.025),
                        child: Column(children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                categoryModel.title,
                                style: GoogleFonts.robotoSlab(
                                  fontSize: 25,
                                  fontWeight: FontWeight.w500,
                                  color:
                                      const Color.fromARGB(221, 255, 253, 253),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                  width: 200,
                                  margin: EdgeInsets.only(top: 10),
                                  height: h * 0.2,
                                  color: Colors.transparent,
                                  child: FrostedGlassBox(
                                    radius: 30.0,
                                    theWidth: 100.0,
                                    theHeight: 200.0,
                                    padding: 10.0,
                                    theChild: Image(
                                      image: AssetImage(imgPaths[
                                          int.parse(categoryModel.img)]),
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
                                      "Text(String data, {Key? key, TextStyle? style, StrutStyle? strutStyle, TextAlign? textAlign, TextDirection? textDirection, Locale? locale, bool? softWrap, TextOverflow? overflow, double? textScaleFactor, int? maxLines, String? semanticsLabel, TextWidthBasis? textWidthBasis, TextHeightBehavior? textHeightBehavior, Color? selectionColor})",
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
                          )
                        ]),
                      )
                    ],
                  ));
  }
}
