import 'package:flutter/material.dart';
import '../main.dart';
import 'movie_search.dart';

class Bottombarscreen extends StatefulWidget {
  const Bottombarscreen({Key? key}) : super(key: key);

  @override
  State<Bottombarscreen> createState() => _BottombarscreenState();
}

class _BottombarscreenState extends State<Bottombarscreen> {
  int _selectedIndex = 0;
  int isSelected = 0;
  final List = [
    Home(),
    MovieSerach(),
    MovieSerach(),
    MovieSerach(),
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: List[isSelected],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: isSelected,
          type: BottomNavigationBarType.fixed,
          unselectedIconTheme: IconThemeData(
            color: Colors.white,
          ),
          unselectedItemColor: Colors.white,
          selectedIconTheme: IconThemeData(
            color: Colors.yellow,
          ),
          selectedItemColor: Colors.yellow,
          backgroundColor: Colors.black,
          selectedFontSize: 10,
          unselectedFontSize: 9,
          onTap: (setvalue) {
            setState(() {
              isSelected = setvalue;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.video_collection_outlined),
              label: 'Videos',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined),
              label: 'Me',
            ),
          ],
        ),
      ),
    );
  }
}
