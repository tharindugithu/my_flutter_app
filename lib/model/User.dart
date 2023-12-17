class User {
  late final String userId;
  late final String userName;
  late final String password;
  
  User({required this.userName, required this.password, required this.userId});
  factory User.fromJson(Map<String, dynamic> json) => User(
        userId: json['id'],
        userName: json['username'],
        password: json['password'],
      );
}
