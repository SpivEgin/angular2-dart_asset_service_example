class ArticleContent {
  final String id;
  String content;

  ArticleContent(this.id, this.content);

  factory ArticleContent.fromJson(Map<String, dynamic> c) =>
      new ArticleContent(c['id'], c['content']);

  Map<String, dynamic> toJson() =>
      <String, dynamic>{'id': id, 'content': content};
}
