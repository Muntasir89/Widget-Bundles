import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int _currentIndex  = 0;
  List<Widget> body = const [
    Icon(Icons.home),
    Icon(Icons.menu),
    Icon(Icons.person),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bottom Navigation"),
      ),
      body: Center(
        child: body[_currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int newIndex){
          setState((){
            _currentIndex = newIndex;
          });
        },
        items: const [
          BottomNavigationBarItem(
              label: 'Home',
              icon: Icon(Icons.home)
          ),
          BottomNavigationBarItem(
              label: 'Menu',
              icon: Icon(Icons.menu)
          ),
          BottomNavigationBarItem(
              label: 'Profile',
              icon: Icon(Icons.person)
          )
        ],
      ),
    );
  }
}
