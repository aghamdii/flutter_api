class Post {
  String title;
  String description;
  String imageUrl;

  Post({
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  // JSON Factory constructor
  factory Post.fromJson(Map<dynamic, dynamic> json) {
    return Post(
        description: json["description"],
        imageUrl: json["image"],
        title: json["title"]);
  }
}
