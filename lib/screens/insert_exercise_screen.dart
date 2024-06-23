import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thera_wise/database_helper.dart';
import 'package:thera_wise/models.dart';

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
            List<Exercise> exercises = [
              Exercise(
                title: 'Cognitive Restructuring',
                description:
                    'Challenge negative thoughts and replace them with positive ones.',
                category: 'Anxiety',
                steps:
                    '[{"step": "Identify negative thought"}, {"step": "Challenge it"}, {"step": "Replace with positive thought"}]',
              ),
              Exercise(
                title: 'Exposure Therapy',
                description: 'Gradually face and overcome fears.',
                category: 'Anxiety',
                steps:
                    '[{"step": "Identify fear"}, {"step": "Face fear gradually"}, {"step": "Reflect on experience"}]',
              ),
              Exercise(
                title: 'Behavioral Activation',
                description:
                    'Engage in activities that are enjoyable and meaningful to combat depression.',
                category: 'Depression',
                steps:
                    '[{"step": "Identify enjoyable activities"}, {"step": "Schedule activities"}, {"step": "Reflect on experience"}]',
              ),
              Exercise(
                title: 'Mindfulness Meditation',
                description:
                    'Practice mindfulness to manage stress and improve mental clarity.',
                category: 'Stress',
                steps:
                    '[{"step": "Find a quiet place"}, {"step": "Focus on your breath"}, {"step": "Gently return to breath when distracted"}]',
              ),
              Exercise(
                title: 'Problem-Solving Therapy',
                description:
                    'Systematically solve problems to reduce stress and improve decision-making.',
                category: 'Stress',
                steps:
                    '[{"step": "Identify problem"}, {"step": "Generate solutions"}, {"step": "Evaluate and choose solution"}, {"step": "Implement solution"}, {"step": "Review outcome"}]',
              ),
            ];

            for (var exercise in exercises) {
              await DatabaseHelper().insertExercise(exercise);
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
