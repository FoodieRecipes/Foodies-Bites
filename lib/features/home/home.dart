import 'package:flutter/material.dart';
import 'package:foodiesbites/features/Others/other_page.dart';
import 'package:foodiesbites/generated/food_order/food_order.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:foodiesbites/generated/customer_care/customer_care.dart';
import 'package:foodiesbites/generated/settings/settings.dart';



// Home Page with Drawer
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isSearching = false;
  // ignore: unused_field
  String _searchText = '';

  void _onSearchChanged(String query) {
    setState(() {
      _searchText = query;
    });
  }

    Future<void> setStatus () async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setBool('isLoggedIn', true);
  }

  @override
  Widget build(BuildContext context) {
    setStatus();
    return Scaffold(
      appBar: AppBar(
        title: _isSearching
            ? TextField(
                onChanged: _onSearchChanged,
                decoration: const InputDecoration(hintText: 'Search here...',),
              )
            : const Text(
                "Foodie Bites",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  color:  Color(0xFF034904),
                ),
              ),
        actions: [
          IconButton(
            icon: Icon(_isSearching ? Icons.close : Icons.search, color: const Color(0xFF034904),),
            onPressed: () {
              setState(() {
                _isSearching = !_isSearching;
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.people, color: Color(0xFF034904),),
            onPressed: () {
              Navigator.pushNamed(context, '/people');
            },
          ),
        ],
      ),
      body: Center(
        child: Image.asset(
          'assets/images/food1.jpg',
          width: 330,
          height: 700,
          fit: BoxFit.cover,
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color:  Color(0xFF034904),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.person_add_alt_1_rounded, size: 23, color: Colors.white),
                  SizedBox(height: 8),
                  Text(
                    'Akpan Henry',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home, color: Colors.black),
              title: const Text('Home', style: TextStyle(color:  Color(0xFF034904)),),
              onTap: () {
                Navigator.pop(context); // Close the drawer and stay on Home
              },
            ),
            ListTile(
              leading: const Icon(Icons.account_circle, color:  Color(0xFF034904)),
              title: const Text('Profile', style: TextStyle(color:  Color(0xFF034904)),),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Profile()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart, color:  Color(0xFF034904)),
              title: const Text('Place an Order', style: TextStyle(color:  Color(0xFF034904)),),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  const FoodOrderPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.check_circle, color: Color(0xFF034904)),
              title: const Text('Get Verified', style: TextStyle(color:  Color(0xFF034904)),),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GetVerified()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings, color:  Color(0xFF034904)),
              title: const Text('Settings', style: TextStyle(color:  Color(0xFF034904)),),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Settings()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout, color:  Color(0xFF034904)),
              title: const Text('Logout', style: TextStyle(color:  Color(0xFF034904)),),
              onTap: () async {
                // Log out by setting 'isLoggedIn' to false
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setBool('isLoggedIn', false);
                if (context.mounted) { // Check if context is still valid
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LogOut()),
                  );
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.all(16.0),
        height: 50.0,
        width: 50.0,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [Colors.blue, Colors.purple],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: FloatingActionButton(
          backgroundColor: const Color(0xFF034904),
          child: const Icon(Icons.add, color: Colors.white ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PlaceOrder()),
            );
          },
        ),
      ),
    );
  }
}
