

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Comments extends StatefulWidget {
  const Comments({super.key});

  @override
  State<Comments> createState() => _CommentsState();
}


class _CommentsState extends State<Comments> {


  late List<dynamic> commentsData = [];

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      var response = await Dio().get("https://jsonplaceholder.typicode.com/comments");
      setState(() {
        commentsData = response.data;
      });
    } catch (e) {
      print("Error fetching data: $e");
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
     body: Padding(
       padding: const EdgeInsets.only(bottom: 16.0),
       child: ListView.builder(
         itemCount: commentsData.length,
         itemBuilder: (context,index){
           return Container(
             decoration: BoxDecoration(
               border: Border.all(
   color: Colors.black87,
    width: 1),
             ),
             child: ListTile(
               leading: CircleAvatar(
                 child: Text(commentsData[index]["postId"].toString()),
               ),
               title: Text(commentsData[index]["body"],style: TextStyle(fontWeight: FontWeight.bold),),
               subtitle: Column(
                 children: [
                   Text(commentsData[index]["email"]),
                   Text(commentsData[index]["name"]),
                 ],
               ),

             ),
           );
         },
       ),
     ),
    );
  }



}