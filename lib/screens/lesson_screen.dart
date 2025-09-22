import 'package:flutter/material.dart';

import 'Lesson.dart';

class LessonScreen extends StatelessWidget {
  const LessonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Row(
          children: const [
            Icon(Icons.pets, color: Colors.black),
            SizedBox(width: 10),
            Text('Dog Training', style: TextStyle(color: Colors.black)),
            Spacer(),
            Icon(Icons.person_outline, color: Colors.black),
          ],
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                
                SizedBox(
                  height: 80,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildFeatureIcon(Icons.fitness_center, 'Training'),
                      const SizedBox(width: 12),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/feeding_tips');
                        },
                        child: _buildFeatureIcon(Icons.food_bank, 'Feeding'),
                      ),
                      const SizedBox(width: 12),
                      _buildFeatureIcon(Icons.favorite, 'Health'),
                      const SizedBox(width: 12),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/settings');
                        },
                        child: _buildFeatureIcon(Icons.settings, 'Setting'),
                      ),
                      const SizedBox(width: 12),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/faq');
                        },
                        child: _buildFeatureIcon(Icons.question_answer, 'FAQ'),
                      ),
                      const SizedBox(width: 12),
                      _buildFeatureIcon(Icons.help_outline, 'Help'),
                      const SizedBox(width: 12),
                      _buildFeatureIcon(Icons.pets, 'Pets'),
                      const SizedBox(width: 12),
                      _buildFeatureIcon(Icons.star_border, 'Premium'),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                
                Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // الصورة
                      Container(
                        height: 220,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(16)),
                        ),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(16)),
                          child: Image.asset(
                            'assets/ChatGPT Image Aug 10, 2025, 08_36_54 PM (2).png', 
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),

                  
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'New Lesson',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 4),
                            Text('Basic Obedience',
                                style: TextStyle(fontSize: 14)),
                          ],
                        ),
                      ),

                      const SizedBox(height: 16),

                    
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (_) => const Lesson()),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8)),
                            backgroundColor: Colors.blue,
                          ),
                          child: const Text(
                            'Continue',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFeatureIcon(IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                  color: Colors.black12, blurRadius: 4, offset: Offset(0, 2))
            ],
          ),
          padding: const EdgeInsets.all(12),
          child: Icon(icon, size: 28, color: Colors.blue),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    );
  }
}
