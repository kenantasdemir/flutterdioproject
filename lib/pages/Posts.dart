import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Posts extends StatefulWidget{
  const Posts({super.key});

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {

  late List<dynamic> postsData = [];

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      var response = await Dio().get("https://jsonplaceholder.typicode.com/posts");
      setState(() {
        postsData = response.data;
      });
    } catch (e) {
      print("Error fetching data: $e");
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body:ListView.builder(
        itemCount: postsData.length,
        itemBuilder: (context,index){
          return ListTile(
            leading: CircleAvatar(
              child: Text(postsData[index]["id"].toString() ),
            ),
            title: Text( postsData[index]["title"],style: TextStyle(fontWeight: FontWeight.bold),),
            subtitle: Text(postsData[index]["body"]),
          );
        },
      )
    );
  }


}