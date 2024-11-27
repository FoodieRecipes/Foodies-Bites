import 'package:flutter/material.dart';
import 'package:foodiesbites/features/others/other_page.dart';
import 'package:foodiesbites/generated/food_order/food_order.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:foodiesbites/generated/settings/settings.dart';
import 'package:foodiesbites/features/people/people.dart';
import 'dart:convert';


class Post {
  final String author;
  final String content;
  final String time;
  final String imageUrl;

  Post({
    required this.author,
    required this.content,
    required this.time,
    required this.imageUrl,
  });

  // Convert a Post to JSON
  Map<String, dynamic> toJson() {
    return {
      'author': author,
      'content': content,
      'time': time,
      'imageUrl': imageUrl,
    };
  }

  // Convert JSON to Post
  static Post fromJson(Map<String, dynamic> json) {
    return Post(
      author: json['author'],
      content: json['content'],
      time: json['time'],
      imageUrl: json['imageUrl'],
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isSearching = false;
  // ignore: unused_field
  String _searchText = '';
  List<Post> posts = [
    Post(
      author: 'John Doe',
      content: 'Just went hiking today, and the view was amazing! 🏞️',
      time: '5m ago',
      imageUrl: '',
    ),
    Post(
      author: 'Jane Smith',
      content: 'Excited for the weekend! Any plans?',
      time: '1h ago',
      imageUrl: '',
    ),
    Post(
      author: 'Michael Brown',
      content: 'Happy to announce my new project is live!',
      time: '2h ago',
      imageUrl: '',
    ),
    Post(
      author: 'Sarah Lee',
      content: 'Enjoying a sunny day at the beach ☀️🌊',
      time: '3h ago',
      imageUrl: '',
    ),
  ];

  void _onSearchChanged(String query) {
    setState(() {
      _searchText = query;
    });
  }

  Future<void> setStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
  }

  @override
  void initState() {
    super.initState();
    setStatus();
    _loadPosts();
  }

  // Load posts from shared preferences
  Future<void> _loadPosts() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? savedPosts = prefs.getStringList('posts');

    if (savedPosts != null) {
      setState(() {
        posts = savedPosts
            .map((postJson) => Post.fromJson(json.decode(postJson)))
            .toList();
      });
    }
  }

  // Save posts to shared preferences
  Future<void> _savePosts() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> postJsonList =
        posts.map((post) => json.encode(post.toJson())).toList();
    await prefs.setStringList('posts', postJsonList);
  }

  // Add a new post and save it
  // ignore: unused_element
  void _addPost(Post post) {
    setState(() {
      posts.add(post);
    });
    _savePosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _isSearching
            ? TextField(
                onChanged: _onSearchChanged,
                decoration: const InputDecoration(hintText: 'Search here...'),
              )
            : const Text(
                "Foodie Bites",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF034904),
                ),
              ),
        actions: [
          IconButton(
            icon: Icon(
              _isSearching ? Icons.close : Icons.search,
              color: const Color(0xFF034904),
            ),
            onPressed: () {
              setState(() {
                _isSearching = !_isSearching;
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.people, color: Color(0xFF034904)),
            onPressed: () {
              Navigator.push(context, 
              MaterialPageRoute(builder: (context) => const People()));
            },
          ),
        ],
      ),
       drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Color(0xFF034904),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context, 
                      MaterialPageRoute(builder: (context) =>  Profile())
                      );
                    },
                    child: const Icon(
                      Icons.person_add_alt_1_rounded,
                      size: 26,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
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
              leading: const Icon(Icons.home,  color: Color(0xFF034904)),
              title: const Text('Home', style: TextStyle(color:  Color(0xFF034904)),),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings, color: Color(0xFF034904)),
              title: const Text('Profile', style: TextStyle(color:  Color(0xFF034904)),),
              onTap: () {
                 Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Profile()),
                  );
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_cart_checkout_rounded, color: Color(0xFF034904)),
              title: const Text('Order Food', style: TextStyle(color:  Color(0xFF034904)),),
              onTap: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  const FoodOrderPage()),);
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
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setBool('isLoggedIn', false);
                if (context.mounted) { 
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const LogOut()),
                  );
                }
              },
            )
          ],
        ),
      ),
      body: posts.isNotEmpty
          ? ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              child: Text(post.author[0]), // Initial of author
                            ),
                            const SizedBox(width: 10),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  post.author,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  post.time,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(post.content),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.thumb_up_alt_outlined),
                              onPressed: () {
                                // Handle like button action
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.comment_outlined),
                              onPressed: () {
                                // Handle comment button action
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.share_outlined),
                              onPressed: () {
                                // Handle share button action
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            )
          : const Center(
              child: Text("No posts available."),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  KeyboardAwareBottomSheet())
          );
        },
        backgroundColor: const Color(0xFF034904),
        child: const Icon(Icons.add, color:   Colors.white),
      ),
    );
  }
}
