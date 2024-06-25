import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:thera_wise/database_helper.dart';

class LogMoodScreen extends StatefulWidget {
  const LogMoodScreen({super.key});

  @override
  _LogMoodScreenState createState() => _LogMoodScreenState();
}

class _LogMoodScreenState extends State<LogMoodScreen> {
  String _selectedMood = 'Happy';

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
          middle: Text(
            'Log Mood',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              fontSize: 24,
              color: CupertinoColors.black,
            ),
          ),
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          border: Border(
            bottom: BorderSide.none,
          )),
      child: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(
                    height: 20), // Add some space between the top and the text
                Text(
                  "What's the vibe today?",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildMoodOption('Happy', CupertinoIcons.smiley_fill,
                              Colors.orange),
                          _buildMoodOption(
                              'Sad', CupertinoIcons.smiley, Colors.blue),
                        ],
                      ),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildMoodOption(
                              'Angry', CupertinoIcons.flame_fill, Colors.red),
                          _buildMoodOption(
                              'Stressed',
                              CupertinoIcons.bolt_horizontal_fill,
                              Colors.yellow),
                        ],
                      ),
                      SizedBox(height: 20),
                      _buildMoodOption(
                          'Calm', CupertinoIcons.time, Colors.green),
                    ],
                  ),
                ),
                SizedBox(height: 60),
                Center(
                  child: GestureDetector(
                    onTap: () {
                      DatabaseHelper().insertMoodLog(_selectedMood);
                    },
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            CupertinoColors.activeBlue,
                            CupertinoColors.activeGreen
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: CupertinoColors.systemGrey,
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Text(
                        'Log Mood',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMoodOption(String mood, IconData icon, Color color) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedMood = mood;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            padding: EdgeInsets.all(_selectedMood == mood ? 12.0 : 8.0),
            decoration: BoxDecoration(
              color: _selectedMood == mood
                  ? color.withOpacity(0.2)
                  : Colors.transparent,
              shape: BoxShape.circle,
              boxShadow: _selectedMood == mood
                  ? [
                      BoxShadow(
                        color: color.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 10,
                        offset: Offset(0, 3),
                      )
                    ]
                  : [],
            ),
            child: Icon(
              icon,
              size: 50,
              color:
                  _selectedMood == mood ? color : CupertinoColors.inactiveGray,
            ),
          ),
          SizedBox(height: 5),
          Text(
            mood,
            style: TextStyle(
              color:
                  _selectedMood == mood ? color : CupertinoColors.inactiveGray,
            ),
          ),
        ],
      ),
    );
  }
}
