import 'package:flutter/material.dart';

class FeedingTipsScreen extends StatelessWidget {
  const FeedingTipsScreen({super.key});

  Widget _buildFoodCard(
      String title, List<String> items, List<TextStyle> styles) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black87),
          ),
          const SizedBox(height: 8),
          for (var item in items)
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: Icon(Icons.circle, size: 8, color: Colors.black87),
                ),
                Text(
                  item,
                  style: const TextStyle(fontSize: 14, color: Colors.black87),
                ),
              ],
            ),
        ],
      ),
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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Feeding Tips",
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildFoodCard(
                "Recommended foods",
                ["Chicken", "Salmon", "Vegetables"],
                [],
              ),
              const SizedBox(height: 16),
              _buildFoodCard(
                "Forbidden foods",
                ["Chocolate", "Grapes", "Onions"],
                [],
              ),
              const SizedBox(height: 16),
              _buildFoodCard(
                "Feeding schedule",
                ["Morning: 8 AM", "Evening: 6 PM"],
                [],
              ),
              const SizedBox(height: 16),
              _buildFoodCard(
                "Feeding tips",
                ["Use a slow feeder", "Establish a routine", "Monitor weight"],
                [],
              ),
              const SizedBox(height: 16),
              _buildFoodCard(
                "Additional tips",
                [
                  "Consult your vet",
                  "Keep food fresh",
                  "Adjust portions as needed"
                ],
                [],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
