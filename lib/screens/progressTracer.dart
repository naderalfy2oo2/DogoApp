import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ProgressTrackerScreen extends StatelessWidget {
  const ProgressTrackerScreen({super.key});

  Widget _buildProgressBar(String label, double progress) {
    return Column(
      children: [
        Container(
          width: 30,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blue.withOpacity(0.2),
          ),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 80 * progress,
              width: 30,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        title: const Text(
          "Progress Tracker",
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircularPercentIndicator(
                  radius: 60.0,
                  lineWidth: 25.0,
                  percent: 0.5,
                  progressColor: Colors.blue,
                  backgroundColor: Colors.blue.withOpacity(0.2),
                  circularStrokeCap: CircularStrokeCap.round,
                ),
                const SizedBox(width: 50),
                Column(
                  children: [
                    Text(
                      "50%",
                      style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 4),
                    Text(
                      "Completed",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              "Basic Obedience",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const Text("Complete",
                style: TextStyle(color: Colors.grey, fontSize: 18)),
            const Divider(height: 30),
            const Text(
              "Feeding Basics",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const Text("In Progress",
                style: TextStyle(color: Colors.grey, fontSize: 18)),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildProgressBar("Farig", 0.8),
                _buildProgressBar("Roate", 0.5),
                _buildProgressBar("Soarde", 0.3),
                Container(
                  width: 50,
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.blue.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
