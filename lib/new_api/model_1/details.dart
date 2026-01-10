import 'dart:convert';

import 'dart:convert';

//the model of calling api
class postdetailsModel {
  final int id;
  final String quote;
  final String author;
  postdetailsModel({
    required this.id,
    required this.quote,
    required this.author,
  });

  factory postdetailsModel.fromjson(Map<String, dynamic> json) {
    return postdetailsModel(
      id: json['id'],
      quote: json['quote'],
      author: json['author'],
    );
  }
}
