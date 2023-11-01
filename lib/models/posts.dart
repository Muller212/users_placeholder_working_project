import 'dart:convert';

class Post {
  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  int userId;
  int id;
  String title;
  String body;

  //Converts the json object to seperate data
  factory Post.fromJson(Map<String, dynamic> json) => Post(
    userId: json["userId"],
    id: json["id"],
    title: json["title"],
    body: json["body"],
  );
}
List<Post> postFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));
