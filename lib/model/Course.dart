class CourseModel {
  late final String id;
  late final String title;
  late final String image;
  late final String description;
  late final String createdAt;

  CourseModel({
    required this.id,
    required this.title,
    required this.image,
    required this.description,
    required this.createdAt,
  });

  factory CourseModel.fromJson(Map<String, dynamic> json) => CourseModel(
        id: json['id'],
        title: json['title'],
        image: json['image'],
        description: json['description'],
        createdAt: json['createdAt'],
      );
}
