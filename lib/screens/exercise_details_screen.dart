import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'; // Import Material for Colors
import 'package:thera_wise/models.dart';

class ExerciseDetailsScreen extends StatelessWidget {
  final Exercise exercise;

  const ExerciseDetailsScreen({super.key, required this.exercise});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(exercise.title,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontSize: 18,
                color: CupertinoColors.black)),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                exercise.title,
                style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: CupertinoColors.black),
              ),
              SizedBox(height: 10),
              Text(
                'Category: ${exercise.category}',
                style:
                    TextStyle(fontSize: 20, color: CupertinoColors.systemGrey),
              ),
              SizedBox(height: 20),
              Text(
                exercise.description,
                style: TextStyle(fontSize: 18, color: CupertinoColors.black),
              ),
              SizedBox(height: 20),
              Text(
                'Steps:',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: CupertinoColors.black),
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView(
                  children: _buildStepWidgets(exercise.steps.split(';')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _buildStepWidgets(List<String> steps) {
    List<Widget> stepWidgets = [];
    for (int i = 0; i < steps.length; i++) {
      stepWidgets.add(
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 5), // Reduced margin
            padding: EdgeInsets.all(12), // Reduced padding
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
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 20, // Reduced radius
                  backgroundColor: CupertinoColors.white,
                  child: Text(
                    (i + 1).toString(),
                    style: TextStyle(
                        color: CupertinoColors.activeBlue,
                        fontWeight: FontWeight.bold,
                        fontSize: 18), // Reduced font size
                  ),
                ),
                SizedBox(width: 12), // Reduced spacing
                Expanded(
                  child: Text(
                    steps[i].trim(),
                    style: TextStyle(
                        fontSize: 16,
                        color: CupertinoColors.black), // Reduced font size
                    textAlign: TextAlign.center, // Center-align text
                  ),
                ),
              ],
            ),
          ),
        ),
      );
      if (i < steps.length - 1) {
        stepWidgets.add(
          Center(
            child: Icon(
              CupertinoIcons.arrow_down,
              color: CupertinoColors.systemBlue,
              size: 30, // Reduced size
            ),
          ),
        );
      }
    }
    return stepWidgets;
  }
}
