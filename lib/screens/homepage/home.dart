import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:student_portal/models/accommodations.dart';
import 'package:student_portal/screens/chat/chat_list.dart';
import 'package:student_portal/screens/chat/forum.dart';
import 'package:student_portal/screens/homepage/components/list_accommodation.dart';
import 'package:student_portal/screens/profile/user_profile.dart';
import 'package:student_portal/screens/store/store.dart';
import 'package:student_portal/screens/homepage/components/body.dart';
import 'package:student_portal/models/accommodations.dart';

import 'components/favorites.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //for bottom Navigation Bar
  int _selectedNavbarIndex = 0;
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
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 100.0,
          elevation: 0.0,
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          leadingWidth: 64,
          leading: IconButton(
              onPressed: () => Navigator.push(context,
                  MaterialPageRoute(builder: (context) => UserProfile())),
              icon: Icon(Icons.person_outline_rounded)),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Favorites()));
                },
                icon: const Icon(Icons.favorite_border_rounded,
                    color: Colors.black)),
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ChatList()));
                },
                icon: const Icon(Icons.chat_bubble_outline_rounded,
                    color: Colors.black)),
            const SizedBox(
              width: 10,
            )
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => ListAccommodation()));
          },
          backgroundColor: Colors.black,
          label: Text(
            'List A Property',
            style: TextStyle(fontFamily: 'Montserrat', letterSpacing: -0.5),
          ),
          icon: Icon(Icons.add_rounded),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
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
        body: Container(child: HomeBody(accommodations)));
  }
}
