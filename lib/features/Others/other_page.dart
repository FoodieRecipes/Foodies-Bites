import 'package:flutter/material.dart';
import 'package:foodiesbites/features/sign_in/sign_in.dart';
import 'package:foodiesbites/features/bottom_nav/bottom_bar.dart'; 


class ChatPage extends StatefulWidget {
  const ChatPage({super.key, required message,});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final List<User> _users = [
    User(
      name: 'Akpan Joy',
      avatar: 'https://i.pravatar.cc/150?img=3',
      lastMessage: 'Hey, how are you doing?',
      lastMessageTime: '2:30 PM',
    ),
    User(
      name: 'Miracle Biance',
      avatar: 'https://i.pravatar.cc/150?img=5',
      lastMessage: 'Don’t forget the meeting tomorrow.',
      lastMessageTime: '1:15 PM',
    ),
    User(
      name: 'Micheal Effiong',
      avatar: 'https://i.pravatar.cc/150?img=8',
      lastMessage: 'Happy birthday! 🎉',
      lastMessageTime: '12:00 PM',
    ),
    User(
      name: 'Smith Bassey',
      avatar: 'https://i.pravatar.cc/150?img=9',
      lastMessage: 'Can we catch up later?',
      lastMessageTime: '10:45 AM',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats', style: TextStyle(color: Color(0xFF034904), fontSize: 24, fontWeight: FontWeight.w600)),
      ),
      body: ListView.builder(
        itemCount: _users.length,
        itemBuilder: (context, index) {
          final user = _users[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(user.avatar),
            ),
            title: Text(
              user.name,
              style: const TextStyle(color: Color(0xFF034904), fontWeight: FontWeight.bold),
            ),
            subtitle: Text(user.lastMessage),
            trailing: Text(
              user.lastMessageTime,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
            onTap: () {
              // Navigate to the message box when a user is tapped
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MessageBox(user: user),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

/// Widget for a message box to send and receive messages
class MessageBox extends StatefulWidget {
  final User user;

  const MessageBox({super.key, required this.user});

  @override
  State<MessageBox> createState() => _MessageBoxState();
}

class _MessageBoxState extends State<MessageBox> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, dynamic>> _messages = [];

  void _sendMessage(String message, bool isSentByUser) {
    if (message.trim().isEmpty) return;

    setState(() {
      _messages.insert(0, {
        'message': message,
        'isSentByUser': isSentByUser,
        'time': TimeOfDay.now().format(context),
      });
    });

    _messageController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Theme.of(context).primaryColor, // Back arrow icon
          onPressed: () {
            Navigator.pop(context); // Navigates back to the previous screen
          },
        ),
        title: Row(
          children: [
            CircleAvatar(
              radius: 20, // Size of the avatar
              backgroundImage: NetworkImage(widget.user.avatar), // User's avatar
              onBackgroundImageError: (_, __) => const Icon(Icons.person,), // Fallback icon in case of error
            ),
            const SizedBox(width: 10), // Spacing between avatar and text
            Expanded(
              child: Text(
                widget.user.name,
                style: const TextStyle(
                  color:  Color(0xFF034904),
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis, // Handle long names gracefully
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.videocam),
            color: Theme.of(context).primaryColor, 
            onPressed: () {
              // TODO: Handle video call action
            },
          ),
          IconButton(
            icon: const Icon(Icons.call),
            color: Theme.of(context).primaryColor, 
            onPressed: () {
              // TODO: Handle audio call action
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Message List
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              reverse: true,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return Align(
                  alignment: message['isSentByUser']
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: message['isSentByUser']
                          ? Colors.green.shade100
                          : Colors.grey.shade200,
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(15),
                        topRight: const Radius.circular(15),
                        bottomLeft: message['isSentByUser']
                            ? const Radius.circular(15)
                            : const Radius.circular(0),
                        bottomRight: message['isSentByUser']
                            ? const Radius.circular(0)
                            : const Radius.circular(15),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (!message['isSentByUser'])
                          Text(
                            widget.user.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        const SizedBox(height: 5),
                        Text(
                          message['message'],
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 6),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Text(
                            message['time'],
                            style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          // Input Field
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                // Plus Icon
                IconButton(
                  icon: const Icon(Icons.add),
                  color: Theme.of(context).primaryColor,
                  onPressed: () {
                    // TODO: Handle additional options (e.g., attachments)
                  },
                ),
                const SizedBox(width: 8),
                // Message Input with Sticker Icon
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    onChanged: (value) {
                      setState(() {}); // Update UI when text changes
                    },
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(17),
                      ),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.emoji_emotions),
                        color: Theme.of(context).primaryColor,
                        onPressed: () {
                          // TODO: Handle sticker/emoji picker
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                // Conditional Icons
                if (_messageController.text.trim().isEmpty) ...[
                  // Camera Icon
                  IconButton(
                    icon: const Icon(Icons.camera_alt),
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      // TODO: Handle camera action
                    },
                  ),
                  // Microphone Icon
                  IconButton(
                    icon: const Icon(Icons.mic),
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      // TODO: Handle voice recording action
                    },
                  ),
                ] else ...[
                  // Send Button
                  IconButton(
                    icon: const Icon(Icons.send),
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      _sendMessage(_messageController.text, true);
                    },
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Model class for a user
class User {
  final String name;
  final String avatar;
  final String lastMessage;
  final String lastMessageTime;

  User({
    required this.name,
    required this.avatar,
    required this.lastMessage,
    required this.lastMessageTime,
  });
}



class CallPage extends StatelessWidget {
  // Sample data for call logs
  final List<CallLog> callLogs = [
    CallLog(
      caller: 'John Doe',
      type: 'Incoming',
      time: '2:30 PM',
    ),
    CallLog(
      caller: 'Jane Smith',
      type: 'Outgoing',
      time: '1:15 PM',
    ),
    CallLog(
      caller: 'Michael Brown',
      type: 'Missed',
      time: '12:00 PM',
    ),
    CallLog(
      caller: 'Sarah Lee',
      type: 'Incoming',
      time: '10:45 AM',
    ),
    // Add more call logs as needed
  ];

  CallPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Call Logs', style: TextStyle(color: Color(0xFF034904), fontSize: 24, fontWeight: FontWeight.w600)),
      ),
      body: ListView.builder(
        itemCount: callLogs.length,
        itemBuilder: (context, index) {
          final callLog = callLogs[index];
          return ListTile(
            leading: CircleAvatar(
              child: Text(callLog.caller[0]), // Initial of caller
            ),
            title: Text(callLog.caller),
            subtitle: Text('${callLog.type} - ${callLog.time}'),
            trailing: Icon(
              _getCallTypeIcon(callLog.type),
              color: _getCallTypeColor(callLog.type),
            ),
            onTap: () {
              // Action on tap, can show details of the call
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Call with ${callLog.caller}'),
                  content: Text('Type: ${callLog.type}\nTime: ${callLog.time}'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Close'),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  // Helper function to return the appropriate icon based on call type
  IconData _getCallTypeIcon(String type) {
    switch (type) {
      case 'Incoming':
        return Icons.call_received;
      case 'Outgoing':
        return Icons.call_made;
      case 'Missed':
        return Icons.call_missed;
      default:
        return Icons.call;
    }
  }

  // Helper function to return the appropriate color based on call type
  Color _getCallTypeColor(String type) {
    switch (type) {
      case 'Incoming':
        return Colors.green;
      case 'Outgoing':
        return Colors.blue;
      case 'Missed':
        return Colors.red;
      default:
        return Colors.black;
    }
  }
}

// Model class for a call log
class CallLog {
  final String caller;
  final String type; // Incoming, Outgoing, Missed
  final String time;

  CallLog({
    required this.caller,
    required this.type,
    required this.time,
  });
}
class NotificationDetailPage extends StatelessWidget {

   final List<Notification> notifications = [
    Notification(
      title: 'Friend Request',
      description: 'John Doe sent you a friend request.',
      time: '2:30 PM',
    ),
    Notification(
      title: 'Comment',
      description: 'Jane Smith commented on your post.',
      time: '1:15 PM',
    ),
    Notification(
       title: 'Birthday Reminder',
      description: 'It’s Michael Brown’s birthday today!',
      time: '12:00 PM',
    ),
    Notification(
      title: 'New Message',
      description: 'Sarah Lee sent you a message.',
      time: '10:45 AM',
    ),
    // Add more call logs as needed
  ];
  NotificationDetailPage({super.key});

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications', style: TextStyle(color: Color(0xFF034904), fontSize: 24, fontWeight: FontWeight.w600)),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          final notification = notifications[index];
          return ListTile(
            leading: Icon(
              Icons.notifications,
              color: _getNotificationColor(notification.title),
            ),
            title: Text(notification.title),
            subtitle: Text(notification.description),
            trailing: Text(notification.time),
            onTap: () {
              // Action on tap, can show notification details
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text(notification.title),
                  content: Text(notification.description),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text('Close'),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }

  // Helper function to return the color based on notification type
  Color _getNotificationColor(String title) {
    switch (title) {
      case 'Friend Request':
        return Colors.blue;
      case 'Comment':
        return Colors.green;
      case 'Birthday Reminder':
        return Colors.orange;
      case 'New Message':
        return Colors.purple;
      default:
        return Colors.black;
    }
  }
}

// Model class for a notification item
class Notification {
  final String title;
  final String description;
  final String time;

  Notification({
    required this.title,
    required this.description,
    required this.time,
  });
}


class People extends StatefulWidget {
  const People({super.key});

  @override
  State<People> createState() => _PeopleState();
}

class _PeopleState extends State<People> {
  // Sample data for friends
  final List<Map<String, String>> _friends = [
    {
      'name': 'Alice Johnson',
      'info': 'Loves hiking and photography',
      'avatar': 'https://randomuser.me/api/portraits/women/1.jpg',
    },
    {
      'name': 'Michael Brown',
      'info': 'Coding enthusiast and coffee lover',
      'avatar': 'https://randomuser.me/api/portraits/men/1.jpg',
    },
    {
      'name': 'Samantha Lee',
      'info': 'Music producer and food blogger',
      'avatar': 'https://randomuser.me/api/portraits/women/2.jpg',
    },
    {
      'name': 'Daniel Carter',
      'info': 'Digital artist and gamer',
      'avatar': 'https://randomuser.me/api/portraits/men/2.jpg',
    },
    {
      'name': 'Olivia Green',
      'info': 'Nature lover and yoga instructor',
      'avatar': 'https://randomuser.me/api/portraits/women/3.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'People',
          style: TextStyle(
            color: Color(0xFF034904),
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: _friends.length,
        itemBuilder: (context, index) {
          final friend = _friends[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(friend['avatar']!),
              ),
              title: Text(
                friend['name']!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              subtitle: Text(
                friend['info']!,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
              trailing: IconButton(
                icon: const Icon(Icons.chat_bubble_outline),
                color: Theme.of(context).primaryColor,
                onPressed: () {
                  // TODO: Navigate to chat screen
                },
              ),
              onTap: () {
                // TODO: Show friend details or open chat
              },
            ),
          );
        },
      ),
    );
  }
}



class GetVerified extends StatelessWidget {
  const GetVerified({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Get Verified')),
      body: const Center(child: Text('Get Verified Page')),
    );
  }
}



class KeyboardAwareBottomSheet extends StatelessWidget {
  KeyboardAwareBottomSheet({super.key});

  final TextEditingController _controller = TextEditingController();

  void _showModalBottomSheetAboveKeyboard(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.3,
          minChildSize: 0.3,
          maxChildSize: 0.5,
          builder: (BuildContext context, ScrollController scrollController) {
            return Padding(
              padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom,
              ),
              child: ListView(
                controller: scrollController,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        leading: const Icon(Icons.photo),
                        title: const Text('Photo'),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.music_note),
                        title: const Text('Music'),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.videocam),
                        title: const Text('Video'),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.share),
                        title: const Text('Share'),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Make a Post",
              style: TextStyle(
                color: Color(0xFF034904),
                fontSize: 23,
                fontWeight: FontWeight.w600,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BottomNavBarAll()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF034904), // Set button color
                textStyle: const TextStyle(fontWeight: FontWeight.w600),
              ),
              child: const Text(
                "Post",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // TextField without Expanded
             TextField(
                controller: _controller,
                maxLines: null, 
                keyboardType: TextInputType.multiline, 
                decoration: const InputDecoration(
                  hintText: "What's on your mind...",
                  contentPadding: EdgeInsets.all(7),
                  border: InputBorder.none, 
                ),
              ),
              const SizedBox(height: 120), 

              // Add Pictures or Videos Button
              ElevatedButton(
                onPressed: () => _showModalBottomSheetAboveKeyboard(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF034904),
                ),
                child: const Text(
                  "Add Pictures or Videos",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
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


class LogoutDialog extends StatelessWidget {
  final VoidCallback onConfirmLogout;

  LogoutDialog({super.key, required this.onConfirmLogout});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Sign Out',
        style: TextStyle(fontWeight: FontWeight.bold, color:Color(0xFF034904)),
      ),
      content: const Text('Are you sure you want to Sign Out?', style: TextStyle(fontWeight: FontWeight.w400, color:Color(0xFF034904))),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: const Text(
            'Cancel',
            style: TextStyle(fontWeight: FontWeight.w500, color:Color(0xFF034904)),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
            onConfirmLogout(); 
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SignInScreen()),
            ); 
          },
          child: const Text('Yes', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500)),
        ),
      ],
    );
  }
}

// Usage Example
void showLogoutDialog(BuildContext context, VoidCallback onConfirmLogout) {
  showDialog(
    context: context,
    builder: (context) {
      return LogoutDialog(onConfirmLogout: onConfirmLogout);
    },
  );
}


class LogOut extends StatelessWidget {
  const LogOut({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('LogOut', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 24, color:Color(0xFF034904)))),
         body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                 const Text(
                'Thank you for choosing us...',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color:Color(0xFF034904)
                ),
              ),
              const SizedBox(height: 40),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  'assets/images/food1.jpg', 
                  width: 300,
                  height: 300,
                  fit: BoxFit.cover, 
                ),
              ),
              const SizedBox(height: 40), 
              // ElevatedButton
              ElevatedButton(
                onPressed: () {
                  showLogoutDialog(
                    context,
                    () {
                      print("User logged out!"); // Replace with your logout logic
                    },
                  );
                },
                 style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF034904), // Button background color
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12), // Button padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20), // Rounded corners
                  ),
                ),
                child: const Text(
                  'Click Here to Sign Out',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
