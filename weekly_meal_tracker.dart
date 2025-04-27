import 'package:flutter/material.dart';

class WeeklyMealOverview extends StatelessWidget {
  final Map<String, String> sampleMeals = {
    "2025-04-22": "Breakfast: Pancakes, Lunch: Salad",
    "2025-04-23": "Breakfast: Eggs, Lunch: Sandwich",
    "2025-04-24": "Breakfast: Oatmeal, Lunch: Burger",
    // Add more sample data if needed
  };

  List<Map<String, String>> getLast7DaysMeals() {
    List<Map<String, String>> last7Days = [];

    DateTime today = DateTime.now();
    for (int i = 0; i < 7; i++) {
      DateTime day = today.subtract(Duration(days: i));
      String dateKey = "${day.year}-${day.month}-${day.day}";
      String? meals = sampleMeals[dateKey];

      List<String> parts =
          meals?.split(',') ?? ["Breakfast: No record", "Lunch: No record"];

      last7Days.add({
        'date': "${day.day}/${day.month}/${day.year}",
        'breakfast':
            parts.length > 0 ? parts[0].trim() : "Breakfast: No record",
        'lunch': parts.length > 1 ? parts[1].trim() : "Lunch: No record",
      });
    }
    return last7Days;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> meals = getLast7DaysMeals();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('My Meals This Week'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: meals.length,
          itemBuilder: (context, index) {
            final meal = meals[index];
            return Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              elevation: 4,
              color: Colors.orange[50],
              margin: EdgeInsets.symmetric(vertical: 8),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      meal['date']!,
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange),
                    ),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            meal['breakfast']!,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            meal['lunch']!,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
