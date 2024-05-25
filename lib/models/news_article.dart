class NewsArticle {
  NewsArticle({
    required this.title,
    required this.publishedAt,
    required this.content,
    required this.url,
    required this.source,
    this.description,
    this.urlToImage,
  });

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
      title: json['title'] as String,
      description: json['description'] as String?,
      urlToImage: json['urlToImage'] as String?,
      publishedAt: DateTime.parse(json['publishedAt'] as String),
      content: json['content'] as String?,
      url: json['url'] as String,
      source: Source.fromJson(json['source'] as Map<String, dynamic>),
    );
  }

  final String title;
  final String? description;
  final String? urlToImage;
  final DateTime publishedAt;
  final String? content;
  final String url;
  final Source source;
}

class Source {
  Source({
    required this.name,
  });

  factory Source.fromJson(Map<String, dynamic> json) {
    return Source(
      name: json['name'] as String,
    );
  }

  final String name;
}
