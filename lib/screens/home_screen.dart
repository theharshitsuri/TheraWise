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
              fontSize: 30,
              color: CupertinoColors.black),
        ),
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        border: Border(
          bottom: BorderSide.none,
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 30),
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
                    ),
                    _buildGridButton(
                      context,
                      '/cbt-exercises',
                      CupertinoIcons.bolt_fill,
                      'CBT Exercises',
                    ),
                    _buildGridButton(
                      context,
                      '/mood-tracker',
                      CupertinoIcons.chart_bar_fill,
                      'Mood Tracker',
                    ),
                    _buildGridButton(
                      context,
                      '/personalized-advice',
                      CupertinoIcons.lightbulb_fill,
                      'Advice',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),
              _buildDailyTip(),
              const SizedBox(height: 40),
              _buildVentingOutButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGridButton(
      BuildContext context, String route, IconData icon, String label) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Container(
        decoration: BoxDecoration(
          color: CupertinoColors.systemGrey6,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: CupertinoColors.systemGrey4.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                colors: [
                  CupertinoColors.activeBlue,
                  CupertinoColors.activeGreen
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ).createShader(bounds),
              child: Icon(icon, size: 50, color: Colors.white),
            ),
            const SizedBox(height: 10),
            ShaderMask(
              shaderCallback: (bounds) => const LinearGradient(
                colors: [
                  CupertinoColors.activeBlue,
                  CupertinoColors.activeGreen
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ).createShader(bounds),
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
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
        color: CupertinoColors.systemGrey6,
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

  Widget _buildVentingOutButton(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/venting-out');
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [CupertinoColors.activeBlue, CupertinoColors.activeGreen],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: CupertinoColors.systemGrey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: const Text(
          "Let's Vent Out",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
