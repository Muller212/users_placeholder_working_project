import 'package:flutter/material.dart';
import 'package:users_placeholder_working_project/views/photo_page.dart';
import 'package:users_placeholder_working_project/views/post_page.dart';
import 'package:users_placeholder_working_project/views/user_page.dart';


//
class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //Bottom Nav bar Selection
  int _selectedIndex = 0;
  //List of Tab Pages assigned to each BottomNavBar
  List<Widget> tabWidget = [
    const PostPage(),
    const PhotoPage(),
    const UserPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('REST API_json_place holder'),
        centerTitle: true,
      ),
      body: tabWidget.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: 'Posts',
            icon: Icon(Icons.post_add),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo),
            label: 'Photos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Users',
          )
        ],
        currentIndex: _selectedIndex,
        onTap: (index) => setState(
              () => _selectedIndex = index,
        ),
      ),
    );
  }
}