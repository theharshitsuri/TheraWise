import 'package:flutter/cupertino.dart';
import 'package:thera_wise/models.dart';
import 'exercise_details_screen.dart';

class CBTExercisesScreen extends StatelessWidget {
  const CBTExercisesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> exercises = [
      {
        'title': 'Cognitive Restructuring',
        'description':
            'Challenge negative thoughts and replace them with positive ones.',
        'category': 'Anxiety',
        'steps':
            'Identify a negative thought that you frequently experience; Write down the thought and note the situation in which it occurs; Challenge the negative thought by asking questions like: Is this thought based on facts or assumptions? What evidence do I have to support or refute this thought?; Replace the negative thought with a more positive, realistic one. Write this new thought down; Reinforce the positive thought by taking a small positive action related to it. For example, if your negative thought is I can\'t do anything right, replace it with I am capable of learning and improving, and then complete a small task successfully to reinforce this new thought',
      },
      {
        'title': 'Exposure Therapy',
        'description': 'Gradually face and overcome fears.',
        'category': 'Anxiety',
        'steps':
            'Identify specific fears that you want to address; Create a fear hierarchy by listing your fears from least to most scary; Start with the least scary situation and gradually expose yourself to it; Stay in the situation until your anxiety decreases naturally; Reflect on the experience and your progress; Move to the next item on your hierarchy only when you feel comfortable with the previous one',
      },
      {
        'title': 'Behavioral Activation',
        'description':
            'Engage in activities that are enjoyable and meaningful to combat depression.',
        'category': 'Depression',
        'steps':
            'List activities that you find enjoyable or meaningful; Schedule these activities into your weekly routine; Start with activities that are easiest to do and gradually increase the difficulty; Engage in the scheduled activities regardless of how you feel at the moment; Reflect on your mood before and after the activity; Adjust your plans based on what you learn from your reflections',
      },
      {
        'title': 'Mindfulness Meditation',
        'description':
            'Practice mindfulness to manage stress and improve mental clarity.',
        'category': 'Stress',
        'steps':
            'Find a quiet and comfortable place to sit; Sit comfortably with your back straight and close your eyes; Focus your attention on your breathing; Notice the sensation of the breath entering and leaving your nostrils; If your mind wanders, gently bring your focus back to your breath without judgment; Gradually increase the duration of your meditation sessions over time',
      },
      {
        'title': 'Problem-Solving Therapy',
        'description':
            'Systematically solve problems to reduce stress and improve decision-making.',
        'category': 'Stress',
        'steps':
            'Identify the specific problem you want to address; Clearly define the problem in writing; Brainstorm a list of possible solutions without judging them; Evaluate the pros and cons of each potential solution; Choose the best solution based on your evaluation; Create a step-by-step plan to implement the solution; Take action to implement the plan; Reflect on the outcome and make any necessary adjustments',
      },
      {
        'title': 'Progressive Muscle Relaxation',
        'description':
            'Reduce physical tension through systematic muscle relaxation.',
        'category': 'Stress',
        'steps':
            'Find a quiet and comfortable place to sit or lie down; Close your eyes and take a few deep breaths; Start by tensing the muscles in your feet, hold for 5 seconds, then relax for 30 seconds; Move up to your calves and repeat the process; Continue to tense and relax each muscle group, moving upwards through your body (thighs, abdomen, chest, arms, hands, neck, and face); Focus on the feeling of relaxation in each muscle group after releasing the tension; Finish with a few deep breaths and notice the overall feeling of relaxation in your body',
      },
      {
        'title': 'Gratitude Journaling',
        'description':
            'Improve mood by regularly writing about things you are grateful for.',
        'category': 'Depression',
        'steps':
            'Set aside a few minutes each day for journaling; Write down three things you are grateful for each day; Be specific about why you are grateful for each item; Reflect on the positive aspects of these items and how they impact your life; Review your journal entries regularly to reinforce positive feelings; Try to notice new things to be grateful for each day to keep the practice fresh',
      },
      {
        'title': 'Self-Compassion Exercises',
        'description':
            'Practice self-kindness and improve your relationship with yourself.',
        'category': 'Self-esteem',
        'steps':
            'Identify self-critical thoughts as they arise; Replace self-critical thoughts with compassionate statements; Write a letter to yourself as if you were writing to a friend who is experiencing the same difficulties; Focus on being kind and understanding to yourself in the letter; Engage in regular self-care activities that make you feel good and support your well-being; Reflect on the positive effects of self-compassion on your mood and self-esteem',
      },
      {
        'title': 'Visualization Techniques',
        'description':
            'Use visualization to reduce anxiety and improve performance.',
        'category': 'Anxiety',
        'steps':
            'Find a quiet and comfortable place to sit or lie down; Close your eyes and take a few deep breaths; Visualize a calm and peaceful place that makes you feel safe and relaxed; Use all your senses to create a vivid mental image of this place (sight, sound, smell, touch); Focus on the details and immerse yourself in the scene; Practice this visualization regularly to strengthen the association between the image and a sense of calm; Use this technique before stressful events to reduce anxiety and improve performance',
      },
      {
        'title': 'Mindful Eating',
        'description':
            'Improve your relationship with food through mindful eating practices.',
        'category': 'Stress',
        'steps':
            'Choose a quiet place where you can eat without distractions; Look at your food and take in its appearance, smell, and texture; Take small bites and chew slowly, paying attention to the flavors and sensations; Notice how your body feels as you eat and when you start to feel satisfied; Stop eating when you feel satisfied, not full; Reflect on the experience of eating mindfully and how it affects your relationship with food',
      },
    ];

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('CBT Exercises',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontSize: 24,
                color: CupertinoColors.black)),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        border: Border(bottom: BorderSide.none),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '*CBT = Cognitive-Behaviour Therapy',
                style: TextStyle(
                  fontSize: 14,
                  color: CupertinoColors.systemGrey,
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: exercises.length,
                  itemBuilder: (context, index) {
                    final exercise = exercises[index];
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: CupertinoListTile(
                        leading: Icon(CupertinoIcons.bolt_fill, size: 40),
                        title: Text(exercise['title']!,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        subtitle: Text(exercise['description']!,
                            style: TextStyle(
                                fontSize: 16,
                                color: CupertinoColors.secondaryLabel)),
                        onTap: () {
                          Navigator.push(
                            context,
                            CupertinoPageRoute(
                              builder: (context) => ExerciseDetailsScreen(
                                exercise: Exercise(
                                  title: exercise['title']!,
                                  description: exercise['description']!,
                                  category: exercise['category']!,
                                  steps: exercise['steps']!,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
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
