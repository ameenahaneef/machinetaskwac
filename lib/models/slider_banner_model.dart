class BannerSlider {
  final String type;
  final String title;
  final List<BannerContent> contents;
  final String id;

  BannerSlider({
    required this.type,
    required this.title,
    required this.contents,
    required this.id,
  });

  factory BannerSlider.fromJson(Map<String, dynamic> json) {
    return BannerSlider(
      type: json['type'] ?? '',
      title: json['title'] ?? '',
      contents: (json['contents'] as List)
          .map((content) => BannerContent.fromJson(content))
          .toList(),
      id: json['id'],
    );
  }
}

class BannerContent {
  final String title;
  final String imageUrl;

  BannerContent({
    required this.title,
    required this.imageUrl,
  });

  factory BannerContent.fromJson(Map<String, dynamic> json) {
    return BannerContent(
      title: json['title'] ?? '',
      imageUrl: json['image_url'] ?? '',
    );
  }
}
