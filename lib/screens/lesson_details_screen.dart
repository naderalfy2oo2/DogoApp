import 'package:dogo_app/screens/HomePage.dart';
import 'package:dogo_app/screens/Settings.dart';
import 'package:dogo_app/screens/progressTracer.dart';
import 'package:flutter/material.dart';

import 'contact_us.dart';
import 'feedingTips.dart';

class LessonDetailsScreen extends StatelessWidget {
  const LessonDetailsScreen({super.key});

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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // صورة الكلب
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(16),
              child: Image.asset(
                'assets/ChatGPT Image Aug 10, 2025, 08_36_54 PM (5).png', // ضع صورة الكلب هنا
                height: 150,
              ),
            ),
            const SizedBox(height: 20),

            // عنوان الدرس
            const Text(
              "Lesson Details",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // الوصف
            const Text(
              "Description",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blueGrey,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              "Language are pewdled in délivie. the whethers áp-tarper to bealpy teu bebut dewrate deing and courrse for dage.",
              style: TextStyle(fontSize: 16, color: Colors.black87),
            ),
            const Spacer(),

            // زر الإكمال
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const FeedingTipsScreen(),
                    ),
                  );
                },
                child: const Text(
                  "Complete Exercise",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // شريط التنقل السفلي
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  child: const Icon(Icons.home, color: Colors.blueGrey),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const HomePage()),
                    );
                  },
                ),
                InkWell(
                  child: const Icon(Icons.analytics, color: Colors.blueGrey),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const ProgressTrackerScreen()),
                    );
                  },
                ),
                InkWell(
                  child:
                      const Icon(Icons.support_agent, color: Colors.blueGrey),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => const ContactUsScreen()),
                    );
                  },
                ),
                InkWell(
                  child:
                      const Icon(Icons.person_outline, color: Colors.blueGrey),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const SettingsScreen()),
                    );
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
