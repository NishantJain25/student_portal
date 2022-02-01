import 'package:flutter/material.dart';
import 'package:student_portal/screens/homepage/home.dart';
import 'package:student_portal/screens/store/store.dart';
import 'chatbox.dart';

class Forum extends StatefulWidget {
  const Forum({Key? key}) : super(key: key);

  @override
  _ForumState createState() => _ForumState();
}

class _ForumState extends State<Forum> {
  int _selectedNavbarIndex = 2;
  void _onItemTapped(int index) {
    setState(() {
      _selectedNavbarIndex = index;
    });
    if (_selectedNavbarIndex == 0)
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    if (_selectedNavbarIndex == 1)
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Store()));
    if (_selectedNavbarIndex == 2)
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => Forum()));
  }

  static const TextStyle selectedNavTextStyle = TextStyle(
    fontFamily: 'Montserrat',
    fontWeight: FontWeight.w600,
    fontSize: 11.0,
  );
  static const TextStyle unselectedNavTextStyle = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 10.0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          selectedLabelStyle: selectedNavTextStyle,
          unselectedLabelStyle: unselectedNavTextStyle,
          selectedItemColor: Colors.black,
          selectedIconTheme: IconThemeData(size: 30.0),
          backgroundColor: Colors.white,
          elevation: 2.0,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                activeIcon: Icon(Icons.home_rounded),
                label: 'HOME'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag_outlined),
                activeIcon: Icon(Icons.shopping_bag_rounded),
                label: 'STORE'),
            BottomNavigationBarItem(
                icon: Icon(Icons.forum_outlined),
                activeIcon: Icon(Icons.forum_rounded),
                label: 'FORUM'),
          ],
          currentIndex: _selectedNavbarIndex,
          onTap: _onItemTapped,
        ),
        body: Chatbox(
          username: 'MPSTME Forum',
        ));
  }
}
