class Post {
  late final int userId;
  late final String title;
  late final String description;

  Post({required this.description, required this.title, required this.userId});
  factory Post.fromJson(Map<String, dynamic> json) => Post(
        userId: json['userId'],
        title: json['title'],
        description: json['body'],
      );
}
