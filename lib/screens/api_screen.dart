import 'package:flutter/material.dart';
import 'package:i_tech/get_posts.dart';

class ApiScreen extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getPosts(),
        builder: (_, adham) {
          if (adham.hasData) {
            var data = adham.data!;
            return ListView.separated(
              itemCount: data.length,
              separatorBuilder: (context, index) => Divider(height: 30),
              itemBuilder: (context, index) => ListTile(
                title: Text(data[index].title),

                subtitle: Text(
                  data[index].body,
                  style: TextStyle(fontSize: 13, color: Colors.grey),
                ),
              ),
            );
          } else if (adham.hasError) {
            return Center(child: Text("Somthing went wrong"));
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
