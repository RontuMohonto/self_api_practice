import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:self_api/new_api/model_1/model%20api.dart';

class apiController {
  static Future<List<postsmodel>> fetchData() async {
    final url = Uri.parse("https://appapi.coderangon.com/api/slider");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      print("success");

      final jsonData = jsonDecode(response.body);
      final postsList = jsonData['data'] as List;
      return postsList
          .map((postjson) => postsmodel.fromjson(postjson))
          .toList();
      // for (var post in postsList) {
      //   posts.add(postsmodel.fromjson(post));
      // }
    } else {
      print("failed");
    }
  }
}
