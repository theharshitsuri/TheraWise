import 'package:flutter/cupertino.dart';

class CBTExercisesScreen extends StatelessWidget {
  const CBTExercisesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> exercises = [
      {
        'title': 'Cognitive Restructuring',
        'description':
            'Challenge negative thoughts and replace them with positive ones.',
        'category': 'Anxiety'
      },
      {
        'title': 'Exposure Therapy',
        'description': 'Gradually face and overcome fears.',
        'category': 'Anxiety'
      },
      {
        'title': 'Behavioral Activation',
        'description':
            'Engage in activities that are enjoyable and meaningful to combat depression.',
        'category': 'Depression'
      },
      {
        'title': 'Mindfulness Meditation',
        'description':
            'Practice mindfulness to manage stress and improve mental clarity.',
        'category': 'Stress'
      },
      {
        'title': 'Problem-Solving Therapy',
        'description':
            'Systematically solve problems to reduce stress and improve decision-making.',
        'category': 'Stress'
      },
      {
        'title': 'Gratitude Journal',
        'description':
            'Write down things you are grateful for to improve your mood and outlook.',
        'category': 'General'
      },
    ];

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          'CBT Exercises',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              fontSize: 24,
              color: CupertinoColors.black),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
            itemCount: exercises.length,
            itemBuilder: (context, index) {
              final exercise = exercises[index];
              return CupertinoListTile(
                leading: Icon(CupertinoIcons.bolt_fill, size: 40),
                title: Text(exercise['title']!,
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                subtitle: Text(exercise['description']!,
                    style: TextStyle(
                        fontSize: 16, color: CupertinoColors.secondaryLabel)),
                onTap: () {
                  // Navigate to Exercise Details or show more information
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

class CupertinoListTile extends StatelessWidget {
  final Widget leading;
  final Widget title;
  final Widget subtitle;
  final GestureTapCallback? onTap;

  const CupertinoListTile({
    required this.leading,
    required this.title,
    required this.subtitle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: CupertinoColors.systemGrey6,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(
              color: CupertinoColors.systemGrey4,
              blurRadius: 4.0,
              spreadRadius: 1.0,
            ),
          ],
        ),
        child: Row(
          children: [
            leading,
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  title,
                  const SizedBox(height: 4),
                  subtitle,
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
