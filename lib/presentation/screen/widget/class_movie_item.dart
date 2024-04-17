class MovieItem {
  final String id,
      name,
      description,
      initialrelease,
      language,
      reviews,
      urlDownload;

  MovieItem({
    required this.id,
    required this.name,
    required this.description,
    required this.initialrelease,
    required this.language,
    required this.reviews,
    required this.urlDownload,
  });

  factory MovieItem.fromJson(String id, Map<String, dynamic> json) {
    return MovieItem(
      id: id,
      name: json['name'],
      description: json['description'],
      initialrelease: json['initialrelease'],
      language: json['language'],
      reviews: json['reviews'],
      urlDownload: json['urlDownload'],
    );
  }
}
