import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutterdioproject/pages/Albums.dart';
import 'package:flutterdioproject/pages/Comments.dart';
import 'package:flutterdioproject/pages/Posts.dart';
import 'package:flutterdioproject/pages/Users.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
         theme: ThemeData(
        useMaterial3: true,
      ),


      home: DioProject(),
    );
  }
}

class DioProject extends StatefulWidget {
  const DioProject({super.key});

  @override
  State<DioProject> createState() => _DioProjectState();
}

class _DioProjectState extends State<DioProject> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const Users(),
    const Albums(),
    const Comments(),
    const Posts(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Calisma'),
        backgroundColor: Colors.teal.shade700,
      ),
      body: _pages[_selectedIndex],
      backgroundColor: Colors.teal,

 drawer: Drawer(
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              accountName: Text("Kenan Taşdemir"),
              accountEmail: Text("ornekemail@gmail.com"),
              currentAccountPicture: CircleAvatar(
                child: Text("K"),
              ),
              otherAccountsPictures: [
                CircleAvatar(child: Text("K")),
                CircleAvatar(
                  child: Text("T"),
                )
              ],
            ),
            Expanded(
              child: ListView(
                children: const [
                  ListTile(
                    title: Text(
                      "Hakkımda",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  ListTile(title: Text("Mersin Üniversitesi")),
                  ListTile(title: Text("Bilişim Teknolojisi ve Bilişim Sistemleri")),
                  ListTile(title: Text("4.Sınıf")),
                  ListTile(title: Text("Mobil Uygulamalar"))
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.teal,
        selectedItemColor: Colors.teal,
        selectedFontSize: 20.0,
        unselectedItemColor: Colors.teal,
        unselectedLabelStyle: TextStyle(color: Colors.teal),
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Kullanıcılar",
              tooltip: "Kullanıcılar"),
          BottomNavigationBarItem(
              icon: Icon(Icons.article_outlined),
              label: "Gönderiler",
              activeIcon: Icon(
                Icons.article_outlined,
                color: Colors.teal,
              )),
          BottomNavigationBarItem(icon: Icon(Icons.comment), label: "Yorumlar"),
          BottomNavigationBarItem(icon: Icon(Icons.album), label: "Albümler"),
        ],
      ),
    );
  }
}
