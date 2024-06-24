import 'package:flutter/cupertino.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:thera_wise/database_helper.dart';

import 'dart:math';

class MoodTrendsScreen extends StatefulWidget {
  const MoodTrendsScreen({super.key});

  @override
  _MoodTrendsScreenState createState() => _MoodTrendsScreenState();
}

class _MoodTrendsScreenState extends State<MoodTrendsScreen> {
  late Future<List<MoodLog>> futureMoodLogs;
  String selectedPeriod = 'Daily';

  @override
  void initState() {
    super.initState();
    futureMoodLogs = _fetchMoodLogs();
  }

  Future<List<MoodLog>> _fetchMoodLogs() async {
    final logs = await DatabaseHelper().fetchMoodLogs();
    return logs
        .map((log) => MoodLog.fromMap(log as Map<String, dynamic>))
        .toList();
  }

  List<MoodLog> _filterLogs(List<MoodLog> logs) {
    final now = DateTime.now();
    if (selectedPeriod == 'Daily') {
      return logs
          .where(
              (log) => log.timestamp.isAfter(now.subtract(Duration(days: 1))))
          .toList();
    } else if (selectedPeriod == 'Weekly') {
      return logs
          .where(
              (log) => log.timestamp.isAfter(now.subtract(Duration(days: 7))))
          .toList();
    } else if (selectedPeriod == 'Monthly') {
      return logs
          .where(
              (log) => log.timestamp.isAfter(now.subtract(Duration(days: 30))))
          .toList();
    }
    return logs;
  }

  double _calculateAverageMoodScore(List<MoodLog> logs) {
    if (logs.isEmpty) return 0.0;
    final totalScore = logs.map((log) => log.moodIndex).reduce((a, b) => a + b);
    return totalScore / logs.length;
  }

  Map<String, int> _calculateMoodDistribution(List<MoodLog> logs) {
    final distribution = <String, int>{};
    for (var log in logs) {
      distribution[log.mood] = (distribution[log.mood] ?? 0) + 1;
    }
    return distribution;
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Mood Tracker',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontSize: 24,
                color: CupertinoColors.black)), // Title of the screen
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 16),
                FutureBuilder<List<MoodLog>>(
                  future: futureMoodLogs,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CupertinoActivityIndicator());
                    }
                    if (snapshot.hasError) {
                      return Center(child: Text('Error: ${snapshot.error}'));
                    }
                    if (!snapshot.hasData || snapshot.data!.isEmpty) {
                      return Center(child: Text('No mood logs found.'));
                    }
                    final filteredLogs = _filterLogs(snapshot.data!);
                    final averageMoodScore =
                        _calculateAverageMoodScore(filteredLogs);
                    final moodDistribution =
                        _calculateMoodDistribution(filteredLogs);
                    return Column(
                      children: [
                        Container(
                          height: 300, // Set a finite height for the chart
                          child: _buildMoodDistributionChart(moodDistribution),
                        ),
                        SizedBox(height: 16),
                        CupertinoSegmentedControl<String>(
                          children: {
                            'Daily': Text('Daily'),
                            'Weekly': Text('Weekly'),
                            'Monthly': Text('Monthly'),
                          },
                          onValueChanged: (value) {
                            setState(() {
                              selectedPeriod = value;
                              futureMoodLogs =
                                  _fetchMoodLogs(); // Refetch logs to update the charts
                            });
                          },
                          groupValue: selectedPeriod,
                        ),
                        SizedBox(height: 16),
                        Text(
                            'Average Mood Score: ${averageMoodScore.toStringAsFixed(2)}',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        SizedBox(height: 16),
                        Container(
                          height: 300, // Set a finite height for the chart
                          child: _buildMoodTrendsChart(filteredLogs),
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMoodTrendsChart(List<MoodLog> moodLogs) {
    return LineChart(
      LineChartData(
        minX: 0,
        maxX: max(1, moodLogs.length - 1).toDouble(),
        minY: 1,
        maxY: 5,
        gridData: FlGridData(show: true),
        titlesData: FlTitlesData(
          bottomTitles: SideTitles(
            showTitles: true,
            getTitles: (value) {
              final index = value.toInt();
              if (index >= 0 && index < moodLogs.length) {
                return moodLogs[index].formattedDate;
              }
              return '';
            },
            margin: 8,
            reservedSize: 30,
            interval: 1,
            getTextStyles: (context, value) => TextStyle(
              color: CupertinoColors.systemGrey,
              fontSize: 10,
            ),
          ),
          leftTitles: SideTitles(
            showTitles: true,
            getTitles: (value) {
              switch (value.toInt()) {
                case 1:
                  return 'Sad';
                case 2:
                  return 'Angry';
                case 3:
                  return 'Stressed';
                case 4:
                  return 'Calm';
                case 5:
                  return 'Happy';
                default:
                  return '';
              }
            },
            margin: 8,
            reservedSize: 40,
            interval: 1,
            getTextStyles: (context, value) => TextStyle(
              color: CupertinoColors.systemGrey,
              fontSize: 12,
            ),
          ),
        ),
        borderData: FlBorderData(
          show: true,
          border: Border.all(color: CupertinoColors.systemGrey),
        ),
        lineBarsData: [
          LineChartBarData(
            spots: moodLogs.asMap().entries.map((entry) {
              final index = entry.key;
              final moodLog = entry.value;
              return FlSpot(index.toDouble(), moodLog.moodIndex.toDouble());
            }).toList(),
            isCurved: true,
            colors: [CupertinoColors.activeBlue],
            barWidth: 4,
            isStrokeCapRound: true,
            dotData: FlDotData(show: false),
            belowBarData: BarAreaData(
              show: true,
              colors: [CupertinoColors.activeBlue.withOpacity(0.2)],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMoodDistributionChart(Map<String, int> moodDistribution) {
    final totalLogs = moodDistribution.values.reduce((a, b) => a + b);
    return PieChart(
      PieChartData(
        sections: moodDistribution.entries.map((entry) {
          final mood = entry.key;
          final count = entry.value;
          final percentage = (count / totalLogs) * 100;
          return PieChartSectionData(
            title: '$mood\n${percentage.toStringAsFixed(1)}%',
            value: percentage,
            color: _getMoodColor(mood),
            radius: 100,
            titleStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: CupertinoColors.white,
            ),
          );
        }).toList(),
      ),
    );
  }

  Color _getMoodColor(String mood) {
    switch (mood) {
      case 'Sad':
        return CupertinoColors.systemBlue;
      case 'Angry':
        return CupertinoColors.systemRed;
      case 'Stressed':
        return CupertinoColors.systemYellow;
      case 'Calm':
        return CupertinoColors.systemGreen;
      case 'Happy':
        return CupertinoColors.systemOrange;
      default:
        return CupertinoColors.systemGrey;
    }
  }
}

class MoodLog {
  final String mood;
  final DateTime timestamp;

  MoodLog({required this.mood, required this.timestamp});

  factory MoodLog.fromMap(Map<String, dynamic> map) {
    return MoodLog(
      mood: map['mood'],
      timestamp: DateTime.parse(map['timestamp']),
    );
  }

  int get moodIndex {
    switch (mood) {
      case 'Sad':
        return 1;
      case 'Angry':
        return 2;
      case 'Stressed':
        return 3;
      case 'Calm':
        return 4;
      case 'Happy':
        return 5;
      default:
        return 0;
    }
  }

  String get formattedDate {
    return '${timestamp.month}/${timestamp.day}';
  }
}
