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
      type: json['type'] as String,
      title: json['title'] as String,
      contents: (json['contents'] as List<dynamic>)
          .map((item) => BannerContent.fromJson(item as Map<String, dynamic>))
          .toList(),
      id: json['id'] as String,
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
      title: json['title']??'',
      imageUrl: json['image_url']??'',
    );
  }

  
}

