import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class response extends StatefulWidget {
  response({super.key});

  List<dynamic> posts = [];

  Future fetchData() async {
    final url = Uri.parse("https://appapi.coderangon.com/api/slider");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      log("success");

      final jsonData = jsonDecode(response.body);
      final newList = jsonData['data'];

      final posts = newList;
      log("${posts.length}");
    } else {
      log("faild");
    }
  }

  @override
  State<response> createState() => _responseState();
}

class _responseState extends State<response> {
  @override
  void initState() {
    super.initState();
    widget.fetchData();
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
      backgroundColor: Colors.white,
    );
  }
}
