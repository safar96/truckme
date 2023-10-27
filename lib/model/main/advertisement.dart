class Advertisement{
  final String description;
  final String image;
  final String lang;
  final String title;
  final String url;

  Advertisement({
    required this.description,
    required this.image,
    required this.lang,
    required this.title,
    required this.url,
});

  factory Advertisement.fromJson(Map<String, dynamic> json) => Advertisement(
    description: json['description'] ?? "",
    image: json['image'] ?? "",
    lang: json['lang'] ?? "",
    title: json['title'] ?? "",
    url: json['url'] ?? "",
  );
}