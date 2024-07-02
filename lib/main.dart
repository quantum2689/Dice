import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  String _result = '';

  void _chooseRandom() {
    if (_controller1.text.isNotEmpty && _controller2.text.isNotEmpty) {
      final choices = [_controller1.text, _controller2.text];
      final randomChoice = choices[Random().nextInt(choices.length)];
      setState(() {
        _result = randomChoice;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Random Chooser'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller1,
              decoration: const InputDecoration(
                labelText: 'Input 1',
              ),
            ),
            TextField(
              controller: _controller2,
              decoration: const InputDecoration(
                labelText: 'Input 2',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _chooseRandom,
              child: const Text('Choose Randomly'),
            ),
            const SizedBox(height: 20),
            Text(
              _result,
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
