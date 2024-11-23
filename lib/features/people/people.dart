import 'package:flutter/material.dart';
import 'package:foodiesbites/features/others/other_page.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  String avatar = 'assets/images/avatar.jpg';

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile', style: TextStyle(fontSize: 20, color: Color(0xFF034904),
                  fontWeight: FontWeight.w600,),),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Picture and Edit Button
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(avatar),
            ),
            const SizedBox(height: 12),

            // Name
            const Text(
              'Akpan Henry ',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Color(0xFF034904),
              ),
            ),
            const SizedBox(height: 8),

            // Bio
            const Text(
              'Flutter Developer | Tech Enthusiast | Content Creator',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),

            // Stats Row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildStatsColumn('Followers', '1.2k'),
                _buildStatsColumn('Following', '350'),
                _buildStatsColumn('Posts', '75'),
              ],
            ),
            const SizedBox(height: 20),

            // Buttons Row
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Follow button action
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF034904), 
                  ),
                  child: const Text(
                    'Follow',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(width: 8),
                OutlinedButton(
                  onPressed: () {
                    Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>  const ChatPage(message: null,)) 
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.grey.shade400),
                  ),
                  child: const Text(
                    'Message',
                    style: TextStyle(color: Color(0xFF034904)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // Posts Section (Replace with actual posts list in a real app)
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 4,
                  crossAxisSpacing: 4,
                ),
                itemCount: 12, // Number of posts
                itemBuilder: (context, index) {
                  return Container(
                    color: Colors.grey.shade300,
                    child: Center(
                      child: Text(
                        'Post ${index + 1}',
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper widget for stats (followers, following, posts)
  Column _buildStatsColumn(String label, String count) {
    return Column(
      children: [
        Text(
          count,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}