import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:self_api/new_api/controller/api.dart';
import 'package:self_api/new_api/model_1/model%20api.dart';

class ResponsePage extends StatefulWidget {
  const ResponsePage({super.key});

  @override
  State<ResponsePage> createState() => _ResponsePageState();
}

class _ResponsePageState extends State<ResponsePage> {
  // List<postsmodel> posts = [];
  //
  // //factory method used
  // fetchData() async {
  //   final data = await apiController.fetchData();
  //   setState(() {
  //     posts = data!;
  //   });
  //   //checking whether posts is empty or not
  //   log("=======${data!.length}==========");
  // }
  //
  // @override
  // void initState() {
  //   super.initState();
  //   fetchData();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Response", style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: FutureBuilder(
        future: ApiController.fetchData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,

            itemBuilder: (context, index) {
              final data = snapshot.data![index];
              //main card
              return Card(
                child: ListTile(
                  leading: Text("${data.id}"),
                  title: Text("${data.quote}"),
                  subtitle: Text("${data.author}"),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
