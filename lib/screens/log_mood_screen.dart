import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'; // Import Material for Colors

class LogMoodScreen extends StatefulWidget {
  const LogMoodScreen({super.key});

  @override
  _LogMoodScreenState createState() => _LogMoodScreenState();
}

class _LogMoodScreenState extends State<LogMoodScreen> {
  // Variable to store the selected mood
  String _selectedMood = 'Happy';

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      // Navigation bar at the top of the screen
      navigationBar: CupertinoNavigationBar(
        middle: Text('Log Mood'), // Title of the screen
      ),
      // SafeArea ensures the content is within the safe bounds of the screen
      child: SafeArea(
        // Center the content vertically and horizontally
        child: Center(
          // Padding around the content
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment:
                  MainAxisAlignment.center, // Center the content vertically
              crossAxisAlignment: CrossAxisAlignment
                  .stretch, // Stretch the content horizontally
              children: [
                // Title text
                Text(
                  "What's the vibe today?",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center, // Center align the text
                ),
                SizedBox(height: 80), // Spacer
                // Row of mood options represented by icons
                Row(
                  mainAxisAlignment:
                      MainAxisAlignment.spaceAround, // Space the icons evenly
                  children: [
                    // Build each mood option
                    _buildMoodOption('Happy', CupertinoIcons.smiley_fill,
                        Color.fromRGBO(255, 134, 59, 1)),
                    _buildMoodOption('Sad', CupertinoIcons.smiley, Colors.blue),
                    _buildMoodOption(
                        'Angry', CupertinoIcons.flame_fill, Colors.red),
                    _buildMoodOption('Stressed',
                        CupertinoIcons.bolt_horizontal_fill, Colors.orange),
                    _buildMoodOption('Calm', CupertinoIcons.time, Colors.green),
                  ],
                ),
                SizedBox(height: 80), // Spacer
                // Log Mood button centered on the screen
                Center(
                  child: CupertinoButton.filled(
                    onPressed: () {
                      // Save the mood log to the database
                    },
                    child: Text('Log Mood'), // Button text
                    minSize: 25, // Minimum size of the button
                    padding: EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 8), // Padding inside the button
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Widget to build each mood option with icon and label
  Widget _buildMoodOption(String mood, IconData icon, Color color) {
    return GestureDetector(
      onTap: () {
        // Update the selected mood when tapped
        setState(() {
          _selectedMood = mood;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min, // Take only the minimum size required
        children: [
          // Animated container for smooth transition effects
          AnimatedContainer(
            duration: Duration(milliseconds: 300), // Duration of the animation
            curve: Curves.easeInOut, // Animation curve
            padding: EdgeInsets.all(_selectedMood == mood
                ? 12.0
                : 8.0), // Padding changes based on selection
            decoration: BoxDecoration(
              color: _selectedMood == mood
                  ? color.withOpacity(0.2)
                  : Colors
                      .transparent, // Background color changes based on selection
              shape: BoxShape.circle, // Circular shape
            ),
            child: Icon(
              icon,
              size: 50, // Size of the icon
              color: _selectedMood == mood
                  ? color
                  : CupertinoColors
                      .inactiveGray, // Icon color changes based on selection
            ),
          ),
          SizedBox(height: 10), // Spacer
          // Label for the mood
          Text(
            mood,
            style: TextStyle(
              color: _selectedMood == mood
                  ? color
                  : CupertinoColors
                      .inactiveGray, // Text color changes based on selection
            ),
          ),
        ],
      ),
    );
  }
}
