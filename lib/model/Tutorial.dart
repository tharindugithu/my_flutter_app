class TutorialModel {
  late final String id;
  late final String title;
  late final String tutorialUrl;

  TutorialModel({
    required this.id,
    required this.title,
    required this.tutorialUrl,

  });

  factory TutorialModel.fromJson(Map<String, dynamic> json) => TutorialModel(
        id: json['id'],
        title: json['title'],
        tutorialUrl: json['tuto_url'],
      );
}
