import "package:dio/dio.dart";
import "package:flutter/material.dart";


class Users extends StatefulWidget {
  const Users({super.key});

  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {

  late List<dynamic> userData = [];

  @override
  void initState() {
    super.initState();
    fetchUserData();
  }

  Future<void> fetchUserData() async {
    try {
      var response = await Dio().get("https://jsonplaceholder.typicode.com/users");
      setState(() {
        userData = response.data;
      });
    } catch (e) {
      print("Error fetching data: $e");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: userData.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: (){
              showDialog(
                  context: context,
                  builder: (BuildContext context){
                      return Center(
                        child: SingleChildScrollView(
                            child: AlertDialog(
                              title: Column(
                                children: [
                                  Text(userData[index]["username"]),
                                  Text(userData[index]["phone"]),
                                  Text(userData[index]["website"]),
                                  Text(userData[index]["address"]["city"])
                                ],
                              ),
                            ),
                        ),
                      );
                  }
              );
            },
            child: ListTile(
              leading: CircleAvatar(
                child: Text(userData[index]["id"].toString()),
              ),
              title: Text(userData[index]['name']),
              subtitle: Text(userData[index]['email']),
            ),
          );
        },
      ),
    );
  }
}

