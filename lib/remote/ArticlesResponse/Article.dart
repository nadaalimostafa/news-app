
import '../SourceResponse/Sources.dart';

/// source : {"id":"bbc-news","name":"BBC News"}
/// author : "Joel Gunter"
/// title : "Victims of Swedish school shooting were seven women and three men, police say"
/// description : "Families have been identifying victims of the attack - all between 28 and 68 years old."
/// url : "https://www.bbc.co.uk/news/articles/cr7epd3mz0ro"
/// urlToImage : "https://ichef.bbci.co.uk/ace/branded_news/1200/cpsprodpb/079f/live/b21ec2f0-e58b-11ef-a319-fb4e7360c4ec.jpg"
/// publishedAt : "2025-02-07T20:02:39Z"
/// content : "Under current Swedish gun laws, anyone over 18 who does not have a criminal record can apply for a permit for a shotgun, handgun or semi-automatic rifle.\r\nThey must justify to the police why they nee… [+995 chars]"

class Article {
  Article({
      this.source, 
      this.author, 
      this.title, 
      this.description, 
      this.url, 
      this.urlToImage, 
      this.publishedAt, 
      this.content,});

  Article.fromJson(dynamic json) {
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (source != null) {
      map['source'] = source?.toJson();
    }
    map['author'] = author;
    map['title'] = title;
    map['description'] = description;
    map['url'] = url;
    map['urlToImage'] = urlToImage;
    map['publishedAt'] = publishedAt;
    map['content'] = content;
    return map;
  }

}