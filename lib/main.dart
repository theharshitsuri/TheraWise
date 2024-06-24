import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:thera_wise/screens/cbt_exercises_screen.dart';
import 'package:thera_wise/screens/home_screen.dart';
import 'package:thera_wise/screens/insert_exercise_screen.dart';
import 'package:thera_wise/screens/log_mood_screen.dart';
import 'package:thera_wise/screens/mood_tracker_screen.dart';
import 'package:thera_wise/screens/personalized_advice_screen.dart';

void main() {
  runApp(TheraWiseApp());
}

class TheraWiseApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      title: 'TheraWise',
      debugShowCheckedModeBanner: false,
      theme: CupertinoThemeData(
        primaryColor: CupertinoColors.systemBlue,
      ),
      home: HomeScreen(),
      routes: {
        '/cbt-exercises': (context) => const CBTExercisesScreen(),
        '/insert-exercise': (context) => const InsertExerciseScreen(),
        '/log-mood': (context) => const LogMoodScreen(),
        '/home': (context) => const HomeScreen(),
        '/personalized-advice': (context) => const PersonalizedAdviceScreen(),
        '/mood-tracker': (context) => const MoodTrendsScreen(),
      },
    );
  }
}
