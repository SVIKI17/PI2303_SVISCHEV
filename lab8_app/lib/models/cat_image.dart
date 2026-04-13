class CatImage {
  final String id;
  final String url;

  const CatImage({
    required this.id,
    required this.url,
  });

  factory CatImage.fromJson(Map<String, dynamic> json) {
    return CatImage(
      id: json['id'] as String,
      url: json['url'] as String,
    );
  }
}