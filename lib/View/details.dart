import 'package:flutter/material.dart';

import '../new_api/controller/api.dart';

class details extends StatefulWidget {
  const details({super.key, required this.ID});

  final int ID;

  @override
  State<details> createState() => _detailsState();
}

class _detailsState extends State<details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "${widget.ID}",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: ApiController.getData(id: widget.ID),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text('No data found'));
          } else {
            return Column(
              children: [
                Text(snapshot.data!.quote),
                Text(snapshot.data!.author),
              ],
            );
          }
        },
      ),
    );
  }
}
