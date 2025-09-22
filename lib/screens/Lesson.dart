import 'package:flutter/material.dart';

class Lesson extends StatefulWidget {
  const Lesson({super.key});

  @override
  State<Lesson> createState() => _LessonState();
}

class Item {
  final String name;
  final String level;
  final String image;

  Item({required this.name, required this.level, required this.image});
}

class _LessonState extends State<Lesson> {
  String selectedLevel = 'All';

  
  final List<Item> items = [
    Item(
        name: "Item 1",
        level: "Beginner",
        image: "assets/ChatGPT Image Aug 10, 2025, 08_36_54 PM (2).png"),
    Item(
        name: "Item 2",
        level: "Intermediate",
        image: "assets/ChatGPT Image Aug 10, 2025, 08_36_54 PM (5).png"),
    Item(
        name: "Item 3",
        level: "Hard",
        image: "assets/ChatGPT Image Aug 10, 2025, 08_36_54 PM (4).png"),
    Item(
        name: "Item 4",
        level: "Super Hard",
        image: "assets/ChatGPT Image Aug 10, 2025, 08_36_54 PM (3).png"),
  ];

  final List<String> levels = [
    "All",
    "Beginner",
    "Intermediate",
    "Hard",
    "Super Hard"
  ];

  List<Item> getFilteredItems() {
    if (selectedLevel == 'All') {
      return items;
    } else {
      return items.where((item) => item.level == selectedLevel).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    final filtered = getFilteredItems();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Lesson Learning Dogs",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 2,
      ),
      body: Column(
        children: [
          // Chips Scroll
          SizedBox(
            height: 50,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              itemCount: levels.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (context, index) {
                final level = levels[index];
                final isSelected = selectedLevel == level;
                return ChoiceChip(
                  label: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(level),
                      if (isSelected)
                        const Padding(
                          padding: EdgeInsets.only(left: 4),
                        ),
                    ],
                  ),
                  selected: isSelected,
                  selectedColor: Colors.blue,
                  onSelected: (_) {
                    setState(() {
                      selectedLevel = level;
                    });
                  },
                );
              },
            ),
          ),

          const SizedBox(height: 12),

          
          Expanded(
            child: ListView.builder(
              itemCount: filtered.length,
              itemBuilder: (context, index) {
                final item = filtered[index];
                return Card(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        item.image,
                        width: double.infinity,
                        height: 180,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item.name,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold)),
                            const SizedBox(height: 4),
                            Text("Level: ${item.level}",
                                style: const TextStyle(color: Colors.grey)),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

