import 'dart:convert';
//the model of calling api
class postsmodel {
  final int id;
  final String quote;
  final String author;
  postsmodel({required this.id, required this.quote, required this.author});

  factory postsmodel.fromjson(Map<String, dynamic> json) {
    return postsmodel(
      id: json['id'],
      quote: json['quote'],
      author: json['author'],
    );
  }
}
