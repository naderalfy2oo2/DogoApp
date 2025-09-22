import 'package:dogo_app/screens/lesson_details_screen.dart';
import 'package:flutter/material.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({super.key});

  final List<Map<String, String>> faqList = const [
    {
      "q": "How do I crate train my dog?",
      "a": "Use positive reinforcement and patience."
    },
    {
      "q": "What should I do if my dog is barking?",
      "a": "Identify the cause and train with commands."
    },
    {
      "q": "What should I do if my dog is whining?",
      "a": "Avoid rewarding whining, reward calmness."
    },
    {
      "q": "Find a qualified trainer?",
      "a": "Search certified trainers in your area."
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("FAQ"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) => const LessonDetailsScreen()),
            );
          },
        ),
      ),
      body: ListView.builder(
        itemCount: faqList.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ExpansionTile(
              title: Text(
                faqList[index]['q']!,
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(faqList[index]['a']!),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
