import 'package:dogo_app/screens/lesson_screen.dart';
import 'package:flutter/material.dart';

import 'screens/FQA.dart';
import 'screens/HomePage.dart';
import 'screens/Lesson.dart';
import 'screens/Settings.dart';
import 'screens/contact_us.dart';
import 'screens/feedingTips.dart';
import 'screens/lesson_details_screen.dart';
import 'screens/loginScreen.dart';
import 'screens/progressTracer.dart';

void main() {
  runApp(const DogTrainingApp());
}

class DogTrainingApp extends StatelessWidget {
  const DogTrainingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dog Training',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/home': (context) => const HomePage(),
        "/lesson": (context) => const LessonScreen(),
        '/lesson_details': (context) => const LessonDetailsScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/faq': (context) => const FAQScreen(),
        '/progress_tracker': (context) => const ProgressTrackerScreen(),
        '/lesson_home': (context) => const Lesson(),
        '/feeding_tips': (context) => const FeedingTipsScreen(),
        '/contact_us': (context) => const ContactUsScreen(),
      },
    );
  }
}
