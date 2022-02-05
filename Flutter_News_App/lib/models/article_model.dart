class ArticleModel {
  String author;
  String title;
  String description;
  String url;
  String content;
  String urlToImage;
  String publishedAt;
  ArticleModel(
      {required this.title,
      required this.author,
      required this.content,
      required this.description,
      required this.urlToImage,
      required this.url,
      required this.publishedAt,
      });
}
