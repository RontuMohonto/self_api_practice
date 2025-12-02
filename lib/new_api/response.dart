import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ResponsePage extends StatefulWidget {
  const ResponsePage({super.key});

  @override
  State<ResponsePage> createState() => _ResponsePageState();
}

class _ResponsePageState extends State<ResponsePage> {
  List<dynamic> posts = [];

  Future fetchData() async {
    final url = Uri.parse("https://appapi.coderangon.com/api/slider");
    final res = await http.get(url);

    if (res.statusCode == 200) {
      print("success");

      final jsonData = jsonDecode(res.body);
      posts = jsonData['data'];
      print("TOTAL = ${posts.length}");

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
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text(
          "Response",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: posts.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) => Card(
                child: ListTile(
                  leading: Text("${posts[index]['id']}"),
                  title: Text("${posts[index]['quote']}"),
                  subtitle: Text("${posts[index]['author']}"),
                ),
              ),
            ),
    );
  }
}
