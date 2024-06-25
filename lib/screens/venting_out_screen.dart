import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VentingOutScreen extends StatefulWidget {
  const VentingOutScreen({super.key});

  @override
  _VentingOutScreenState createState() => _VentingOutScreenState();
}

class _VentingOutScreenState extends State<VentingOutScreen> {
  TextEditingController _textController = TextEditingController();

  void _recordVoiceMemo() {
    // Placeholder for voice memo recording functionality
    showDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text('Record Voice Memo'),
        content:
            Text('Voice memo recording functionality is not implemented yet.'),
        actions: [
          CupertinoDialogAction(
            child: Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  void _clearText() {
    _textController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
          middle: Text(
            'Vent Out',
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "What's on your mind?",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Expanded(
                child: CupertinoTextField(
                  controller: _textController,
                  placeholder: 'Type your thoughts here...',
                  padding: EdgeInsets.all(16),
                  maxLines: null,
                  decoration: BoxDecoration(
                    color: CupertinoColors.systemGrey6,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: CupertinoColors.systemGrey4,
                        blurRadius: 4.0,
                        spreadRadius: 1.0,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: GestureDetector(
                  onTap: _recordVoiceMemo,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
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
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(CupertinoIcons.mic, color: Colors.white),
                        SizedBox(width: 10),
                        Text(
                          'Record Voice Memo',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: GestureDetector(
                  onTap: _clearText,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          CupertinoColors.systemRed,
                          CupertinoColors.systemYellow
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
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(CupertinoIcons.clear, color: Colors.white),
                        SizedBox(width: 10),
                        Text(
                          'Clear',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
