import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:my_flutter_app/constants/const.dart';
import 'package:my_flutter_app/model/CategoryModel.dart';
import 'package:my_flutter_app/service/ApiService.dart';

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
                : Text(imgPaths[int.parse(categoryModel.img)]));
  }
}
