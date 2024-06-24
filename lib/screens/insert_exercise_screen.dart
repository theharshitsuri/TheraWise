import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thera_wise/database_helper.dart' as dbHelper;
import 'package:thera_wise/database_helper.dart';
import 'package:thera_wise/models.dart' as models;
import 'package:thera_wise/models.dart'; // Add 'as models' to give a prefix

class InsertExerciseScreen extends StatelessWidget {
  const InsertExerciseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Insert Exercise'),
      ),
      child: Center(
        child: CupertinoButton.filled(
          onPressed: () async {
            List<models.Exercise> exercises = [
              // Use 'models.Exercise' as the constructor
              models.Exercise(
                title: 'Cognitive Restructuring',
                description:
                    'Challenge negative thoughts and replace them with positive ones.',
                category: 'Anxiety',
                steps:
                    '[{"step": "Identify negative thought"}, {"step": "Challenge it"}, {"step": "Replace with positive thought"}]',
              ),
              models.Exercise(
                title: 'Exposure Therapy',
                description: 'Gradually face and overcome fears.',
                category: 'Anxiety',
                steps:
                    '[{"step": "Identify fear"}, {"step": "Face fear gradually"}, {"step": "Reflect on experience"}]',
              ),
              models.Exercise(
                title: 'Behavioral Activation',
                description:
                    'Engage in activities that are enjoyable and meaningful to combat depression.',
                category: 'Depression',
                steps:
                    '[{"step": "Identify enjoyable activities"}, {"step": "Schedule activities"}, {"step": "Reflect on experience"}]',
              ),
              models.Exercise(
                title: 'Mindfulness Meditation',
                description:
                    'Practice mindfulness to manage stress and improve mental clarity.',
                category: 'Stress',
                steps:
                    '[{"step": "Find a quiet place"}, {"step": "Focus on your breath"}, {"step": "Gently return to breath when distracted"}]',
              ),
              models.Exercise(
                // Use 'models.Exercise' as the constructor
                title: 'Problem-Solving Therapy',
                description:
                    'Systematically solve problems to reduce stress and improve decision-making.',
                category: 'Stress',
                steps:
                    '[{"step": "Identify problem"}, {"step": "Generate solutions"}, {"step": "Evaluate and choose solution"}, {"step": "Implement solution"}, {"step": "Review outcome"}]',
              ),
            ];

            for (var exercise in exercises) {
              await DatabaseHelper().insertExercise(exercise as Exercise);
            }

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Exercises inserted successfully!')),
            );
          },
          child: Text('Insert Pre-Defined Exercises'),
        ),
      ),
    );
  }
}
