import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class Albums extends StatefulWidget {
  const Albums({super.key});

  @override
  State<Albums> createState() => _AlbumsState();
}
class _AlbumsState extends State<Albums>{


  late List<dynamic> albumsData = [];

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      var response = await Dio().get("https://jsonplaceholder.typicode.com/albums");
      setState(() {
        albumsData = response.data;
      });
    } catch (e) {
      print("Error fetching data: $e");
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body:ListView.builder(
        itemCount: albumsData.length,
        itemBuilder: (context,index){
          return ListTile(
            leading: CircleAvatar(
              child: Text(albumsData[index]["id"].toString()),
            ),
            title: Text(albumsData[index]["title"]),
            subtitle: Text("Kullanıcı ID: " + albumsData[index]["userId"].toString()),
          );
        },
      )
    );
  }

}