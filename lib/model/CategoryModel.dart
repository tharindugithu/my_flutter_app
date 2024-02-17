import 'package:my_flutter_app/model/Course.dart';

class CategoryModel {
  late final String id;
  late final String title;
  late final String img;
  late final String description;
  late final String dateTime;
  late final List<CourseModel> courses;

  CategoryModel({
    required this.id,
    required this.title,
    required this.img,
    required this.description,
    required this.dateTime,
    required this.courses,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    // Parse courses from the JSON array
    var coursesList = <CourseModel>[];
    if (json['courses'] != null) {
      coursesList = List<CourseModel>.from(
        json['courses'].map((courseJson) => CourseModel.fromJson(courseJson)),
      );
    }

    return CategoryModel(
      id: json['id'],
      title: json['title'],
      img: json['image'],
      description: json['description'],
      dateTime: json['createdAt'],
      courses: coursesList,
    );
  }
}
//0741174025