class Category {
  final String title;
  final String imageUrl;

  Category({
    required this.title,
    required this.imageUrl,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      title: json['title'],
      imageUrl: json['image_url'],
    );
  }
}
