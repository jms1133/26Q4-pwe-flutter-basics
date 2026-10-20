import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('ChatGPT Web App')),
        body: const ChatScreen(),
      ),
    );
  }
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  String _aiResponse = "Die Antwort von ChatGPT wird hier angezeigt."; // Text widget display

  void _askAI() {
    // This method will later send the request to your server
    setState(() {
      _aiResponse = "Anfrage wird gesendet: ${_controller.text}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _controller,
            decoration: const InputDecoration(
              labelText: 'Ihre Frage eingeben',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _askAI,
            child: const Text('Anfrage senden'),
          ),
          const SizedBox(height: 20),
          Text(_aiResponse),
        ],
      ),
    );
  }
}