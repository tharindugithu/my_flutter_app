class ActivityModel {
  late final String id;
  late final String title;
  late final String tutorialUrl;

  ActivityModel({
    required this.id,
    required this.title,
    required this.tutorialUrl,

  });

  factory ActivityModel.fromJson(Map<String, dynamic> json) => ActivityModel(
        id: json['id'],
        title: json['title'],
        tutorialUrl: json['answers'],
      );
}
