import 'package:flutter/material.dart';
import 'package:foodiesbites/features/Others/other_page.dart';
import 'package:foodiesbites/generated/customer_care/customer_care.dart';

class Settings extends StatelessWidget{
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
      toolbarHeight: 90.0,
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(child: Text('Settings')),
          InkWell(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.all(8.0),
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 103, 104, 104),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: const Row(
                children: [
                  Icon(Icons.search, color: Colors.white),
                  SizedBox(width: 8.0),
                  Text(
                    'Search settings',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),

    body: SingleChildScrollView(
      child: Padding( 
      padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, 
          children: [
            InkWell(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(14.5),
                decoration: BoxDecoration(
                  color: Colors.grey[800], 
                  borderRadius: BorderRadius.circular(12.0), 
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.person_2, color: Colors.white),
                        SizedBox(width: 8.0),
                        Text(
                          'Your Account',
                          style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: Colors.white, 
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.5),
                    Text(
                      'Check for information concerning your account, and make changes when you want to.',
                      style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.white, 
                      ),
                    ),
                  ],
                ),
              ),
            ),
          
            const SizedBox(height: 18.0),
          
            InkWell(
              onTap: () {},
              child: Container(
               padding: const EdgeInsets.all(16.0),
               decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(12.0),
                ),
               child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.security, color: Colors.white),
                      SizedBox(width: 8.0),
                      Text(
                        'Security Settings',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                         ),
                       ),
                     ],
                   ),
                   SizedBox(height: 8.5),
                   Text(
                    'Manage your security options and update password settings.',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            
            const SizedBox(height: 18.0),

            InkWell(
              onTap: () {},
              child: Container(
               padding: const EdgeInsets.all(16.0),
               decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(12.0),
                ),
               child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.verified_user, color: Colors.white),
                      SizedBox(width: 8.0),
                      Text(
                        'Premium',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                         ),
                       ),
                     ],
                   ),
                   SizedBox(height: 8.5),
                   Text(
                    'Manage your subscription to be able to gain access to more intercontinetal dishes .',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 18.0),

            InkWell(
              onTap: () {},
              child: Container(
               padding: const EdgeInsets.all(16.0),
               decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(12.0),
                ),
               child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.lock_outline, color: Colors.white),
                      SizedBox(width: 8.0),
                      Text(
                        'Privacy and Safety',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                         ),
                       ),
                     ],
                   ),
                   SizedBox(height: 8.5),
                   Text(
                    'Manage what information you see and share.',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 18.0),

            InkWell(
              onTap: () {},
              child: Container(
               padding: const EdgeInsets.all(16.0),
               decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(12.0),
                ),
               child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.password, color: Colors.white),
                      SizedBox(width: 8.0),
                      Text(
                        'Passwords',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                         ),
                       ),
                     ],
                   ),
                   SizedBox(height: 8.5),
                   Text(
                    'Manage your passwords, change if you feel intruders have access to them.',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 18.0),

            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PlaceOrder()),
                );
              },
              child: Container(
               padding: const EdgeInsets.all(16.0),
               decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(12.0),
                ),
               child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.support_agent, color: Colors.white),
                      SizedBox(width: 8.0),
                      Text(
                        'Customer Care Services',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                         ),
                       ),
                     ],
                   ),
                   SizedBox(height: 8.5),
                   Text(
                    'Share your views on the services we offer.',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),const SizedBox(height: 18.0),

            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LogOut()),
                );
              },
              child: Container(
               padding: const EdgeInsets.all(16.0),
               decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: BorderRadius.circular(12.0),
                ),
               child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.logout, color: Colors.white),
                      SizedBox(width: 8.0),
                      Text(
                        'Logout',
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                         ),
                       ),
                     ],
                   ),
                   SizedBox(height: 8.5),
                   Text(
                    'Logout from your account on this device.',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
 }
}

