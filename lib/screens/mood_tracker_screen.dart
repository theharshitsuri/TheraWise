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
                color: CupertinoColors.black)),
        border: Border(bottom: BorderSide.none), // Title of the screen
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
    final moodDistribution = _calculateMoodDistribution(moodLogs);
    final List<BarChartGroupData> barGroups =
        moodDistribution.entries.map((entry) {
      final mood = entry.key;
      final count = entry.value;
      return BarChartGroupData(
        x: _moodToIndex(mood),
        barRods: [
          BarChartRodData(
            y: count.toDouble(),
            colors: [_getMoodColor(mood)],
            width: 22,
          ),
        ],
      );
    }).toList();

    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY: moodDistribution.values.reduce(max).toDouble() + 1,
        barGroups: barGroups,
        titlesData: FlTitlesData(
          leftTitles: SideTitles(showTitles: true),
          bottomTitles: SideTitles(
            showTitles: true,
            getTitles: (double value) {
              switch (value.toInt()) {
                case 0:
                  return 'Sad';
                case 1:
                  return 'Angry';
                case 2:
                  return 'Stressed';
                case 3:
                  return 'Calm';
                case 4:
                  return 'Happy';
                default:
                  return '';
              }
            },
          ),
        ),
        borderData: FlBorderData(
          show: true,
          border: Border.all(color: CupertinoColors.systemGrey),
        ),
        gridData: FlGridData(show: false),
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

  int _moodToIndex(String mood) {
    switch (mood) {
      case 'Sad':
        return 0;
      case 'Angry':
        return 1;
      case 'Stressed':
        return 2;
      case 'Calm':
        return 3;
      case 'Happy':
        return 4;
      default:
        return -1;
    }
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
