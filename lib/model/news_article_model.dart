class NewsArticleModel{
  String? title = '';
  String? description = '';
  String? url = '';
  String? urlToImage = '';

  NewsArticleModel({
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage});

  factory NewsArticleModel.fromJson(Map<String, dynamic> json){
    return NewsArticleModel(
        title: json['title'] as String?,
        description: json['description'] as String?,
        url: json['url'] as String?,
        urlToImage: json['urlToImage'] as String?);
  }
}