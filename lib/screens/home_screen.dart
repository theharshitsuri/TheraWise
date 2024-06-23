import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text(
          'TheraWise',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              fontSize: 24,
              color: CupertinoColors.black),
        ),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  children: [
                    _buildGridButton(
                      context,
                      '/log-mood',
                      CupertinoIcons.smiley_fill,
                      'Log Mood',
                      const Color(0xFF4CAF50),
                    ),
                    _buildGridButton(
                      context,
                      '/cbt-exercises',
                      CupertinoIcons.bolt_fill,
                      'CBT Exercises',
                      const Color(0xFF03A9F4),
                    ),
                    _buildGridButton(
                      context,
                      '/mood-tracker',
                      CupertinoIcons.chart_bar_fill,
                      'Mood Tracker',
                      const Color(0xFFFFC107),
                    ),
                    _buildGridButton(
                      context,
                      '/personalized-advice',
                      CupertinoIcons.lightbulb_fill,
                      'Advice',
                      const Color(0xFFFF5722),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              _buildDailyTip(),
              const SizedBox(height: 60),
              CupertinoButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/venting-out');
                },
                color: CupertinoColors.systemRed.withOpacity(0.8),
                borderRadius: BorderRadius.circular(12),
                child: const Text(
                  "Let's Vent Out",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGridButton(BuildContext context, String route, IconData icon,
      String label, Color color) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 50, color: Colors.white),
            const SizedBox(height: 10),
            Text(
              label,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDailyTip() {
    return Container(
      decoration: BoxDecoration(
        color: CupertinoColors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: CupertinoColors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(16.0),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Daily Tip',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: CupertinoColors.black)),
          SizedBox(height: 10),
          Text(
              "Every day may not be good, but there's something good in every day.",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                color: Color.fromARGB(255, 98, 98, 102),
                fontStyle: FontStyle.italic,
              )),
        ],
      ),
    );
  }
}
