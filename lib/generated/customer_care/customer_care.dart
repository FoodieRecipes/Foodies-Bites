import 'package:flutter/material.dart';


// Place Order Screen (Chatbot-like interaction)
class PlaceOrder extends StatefulWidget {
  const PlaceOrder({super.key});

  @override
  _PlaceOrderState createState() => _PlaceOrderState();
}

class _PlaceOrderState extends State<PlaceOrder> {
  final List<Map<String, dynamic>> _messages = []; // To store messages
  final TextEditingController _controller = TextEditingController(); // For typing messages
  int _userMessageCount = 0; // Counter for user messages
  int phoneNumber1 = 2347044210310;
  int phoneNumber2 = 2349118739164;

  void _sendMessage(String message) {
    if (message.isNotEmpty) {
      setState(() {
        _messages.add({
          'message': message,
          'isUser': true,
          'timestamp': DateTime.now().toString().substring(11, 16),
        });
        _controller.clear();
        _userMessageCount++; // Increment the message count

        // Check the user message count to send replies
        if (_userMessageCount == 1) {
          _sendReply('Good day Customer. How can we help you today?');
        } else if (_userMessageCount == 2) {
          _sendReply('Please hold on while we connect you to the various customer care lines for better  assitance');
        } else if (_userMessageCount == 3) {
          _sendReply('If you have a complain concerning our services please call + $phoneNumber1. if not, then how may we help you?');
        } else if (_userMessageCount == 4) {
          _sendReply('If your want to delete your account call + $phoneNumber2 . Thank you for choosing us. We your  belly is our priority......');
        }
      });
    }
  }

  void _sendReply(String message) {
    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        _messages.add({
          'message': message,
          'isUser': false,
          'timestamp': DateTime.now().toString().substring(11, 16),
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customer Service'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              reverse: true, // To show the latest messages at the bottom
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[_messages.length - 1 - index];
                return _buildMessageBubble(message);
              },
            ),
          ),
          const Divider(height: 1),
          _buildInputArea(),
        ],
      ),
    );
  }

  Widget _buildMessageBubble(Map<String, dynamic> message) {
    final bool isUser = message['isUser'];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Align(
        alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
        child: Column(
          crossAxisAlignment: isUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: isUser ?const Color(0xFF034904) : const Color.fromARGB(255, 31, 31, 31),
                borderRadius: BorderRadius.circular(17),
              ),
              child: Text(
                message['message'],
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              message['timestamp'],
              style: const TextStyle(fontSize: 12, color: Color.fromARGB(255, 31, 31, 31)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputArea() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: const InputDecoration(
                hintText: 'Type your message...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                contentPadding: EdgeInsets.all(7),
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send, color: Color(0xFF034904),),
            onPressed: () {
              _sendMessage(_controller.text);
            },
          ),
        ],
      ),
    );
  }
}