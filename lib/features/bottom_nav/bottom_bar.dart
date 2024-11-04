import 'package:flutter/material.dart';
import 'package:foodiesbites/features/home/home.dart';
import 'package:foodiesbites/features/Others/other_page.dart';
import 'package:shared_preferences/shared_preferences.dart';


// Bottom Navigation Bar and Main Screens
class BottomNavBarAll extends StatefulWidget {
  const BottomNavBarAll({super.key});

  @override
  State<BottomNavBarAll> createState() => _BottomNavBarAllState();
}

class _BottomNavBarAllState extends State<BottomNavBarAll> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const MyHomePage(),
    const ChatPage(),
    const CallPage(),
    const NotificationDetailPage(),
    
  ];

  @override
  void initState()  {
    // TODO: implement initState
    // setStatus();
    super.initState();

  }
  Future<void> setStatus () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setBool('isLoggedIn', true);
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {

    
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: '',
          ),
        ],
        currentIndex: _currentIndex,
        onTap: _onItemTapped,
        selectedItemColor: const Color(0xFF034904),
        unselectedItemColor: const Color(0xFF034904) ,
        type: BottomNavigationBarType.fixed,      ),
    );
  }
}
