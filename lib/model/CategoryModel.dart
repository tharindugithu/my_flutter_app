class CategoryModel {
  late final String title;
  late final String img;
  late final String description;
  late final String id;
  late final String dateTime;
  CategoryModel(
      {required this.title,
      required this.description,
      required this.img,
      required this.id,
      required this.dateTime});
  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
      id: json['id'],
      title: json['title'],
      img: json['image'],
      description: json['description'],
      dateTime: json['createdAt']);
}
