import 'package:flutter/cupertino.dart';

class MoodTrackerScreen extends StatelessWidget {
  const MoodTrackerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          'Mood Tracker',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text('Log Today\'s Mood',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              const CupertinoTextField(
                placeholder: 'How are you feeling today?',
              ),
              const SizedBox(height: 10),
              CupertinoButton.filled(
                onPressed: null, // Save Mood Log
                child: const Text('Log Mood'),
              ),
              const SizedBox(height: 30),
              const Text('Mood Trends',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              // Add mood trends chart here
            ],
          ),
        ),
      ),
    );
  }
}
