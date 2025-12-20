import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:self_api/new_api/model_1/model%20api.dart';

class ResponsePage extends StatefulWidget {
  const ResponsePage({super.key});

  @override
  State<ResponsePage> createState() => _ResponsePageState();
}

class _ResponsePageState extends State<ResponsePage> {
  List<postsmodel> posts = [];

  Future fetchData() async {
    final url = Uri.parse("https://appapi.coderangon.com/api/slider");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      print("success");

      final jsonData = jsonDecode(response.body);
      final postsList = jsonData['data'] as List;

      for (var post in postsList) {
        posts.add(
          postsmodel(
            id: post['id'],
            quote: post['quote'],
            author: post['author'],
          ),
        );
      }

      setState(() {});
    } else {
      print("failed");
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Response", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: posts.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: posts.length,

              itemBuilder: (context, index) {
                final data = posts[index];
                return Card(
                  child: ListTile(
                    leading: Text("${data.id}"),
                    title: Text("${data.quote}"),
                    subtitle: Text("${data.author}"),
                  ),
                );
              },
            ),
    );
  }
}
