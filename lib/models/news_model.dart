import 'package:hive_flutter/hive_flutter.dart';

class NewsModel extends HiveObject {
  String? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  NewsModel({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });
  factory NewsModel.fromJson(Map<String, dynamic> json) {
    return NewsModel(
      source: json['source']['name'],
      author: json["author"] ?? "",
      title: json["title"] ?? "",
      description: json["description"] ?? "",
      url: json["url"] ?? "",
      urlToImage: json["urlToImage"] ?? "",
      publishedAt: json["publishedAt"] ?? "",
      content: json["content"] ?? "",
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NewsModel &&
        other.description == description &&
        other.url == url &&
        other.urlToImage == urlToImage;
  }

  @override
  int get hashCode {
    return description.hashCode ^ url.hashCode ^ urlToImage.hashCode;
  }
}

// Can be generated automatically
class NewsModelAdapter extends TypeAdapter<NewsModel> {
  @override
  final typeId = 1;

  @override
  NewsModel read(BinaryReader reader) {
    return NewsModel(
      source: reader.read(),
      author: reader.read(),
      title: reader.read(),
      description: reader.read(),
      url: reader.read(),
      urlToImage: reader.read(),
      publishedAt: reader.read(),
      content: reader.read(),
    );
  }

  @override
  void write(BinaryWriter writer, NewsModel obj) {
    writer
      ..write(obj.source)
      ..write(obj.author)
      ..write(obj.title)
      ..write(obj.description)
      ..write(obj.url)
      ..write(obj.urlToImage)
      ..write(obj.publishedAt)
      ..write(obj.content);
  }
}
