import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'dart:math' as math;

class Profile extends StatelessWidget {
  final String avatar = 'assets/images/avatar.jpg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
            fontSize: 20,
            color: Color(0xFF034904),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Profile Picture with Hero Animation
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RadialExpansionDemo(imageName: avatar),
                  ),
                );
              },
              child: Hero(
                tag: avatar,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(avatar),
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Name
            const Text(
              'Akpan Henry',
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
                    // Message button action
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

class RadialExpansionDemo extends StatelessWidget {
  static const double kMinRadius = 32.0;
  static const double kMaxRadius = 128.0;
  static const opacityCurve = Interval(0.0, 0.75, curve: Curves.fastOutSlowIn);

  final String imageName;

  const RadialExpansionDemo({super.key, required this.imageName});

  static RectTween _createRectTween(Rect? begin, Rect? end) {
    return MaterialRectCenterArcTween(begin: begin, end: end);
  }

  Widget _buildHero(BuildContext context, String imageName, String description) {
    return SizedBox(
      width: kMinRadius * 3.0,
      height: kMinRadius * 3.0,
      child: Hero(
        createRectTween: _createRectTween,
        tag: imageName,
        child: RadialExpansion(
          maxRadius: kMaxRadius,
          child: Photo(
            photo: imageName,
            onTap: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 4.0; // Animation speed.

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Info'),
        backgroundColor: Colors.green,
      ),
      body:  Center(
          child: Container(
            child: Image.asset(imageName,
            fit: BoxFit.cover,)
        ),
      ),
    );
  }
}

class RadialExpansion extends StatelessWidget {
  const RadialExpansion({
    super.key,
    required this.maxRadius,
    required this.child,
  }) : clipRectSize = 2.0 * (maxRadius / math.sqrt2);

  final double maxRadius;
  final double clipRectSize;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Center(
        child: SizedBox(
          width: clipRectSize,
          height: clipRectSize,
          child: ClipRect(
            child: child,
          ),
        ),
      ),
    );
  }
}

class Photo extends StatelessWidget {
  const Photo({super.key, required this.photo, this.onTap});

  final String photo;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: onTap,
        child: Image.asset(
          photo,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
