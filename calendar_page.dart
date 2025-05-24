import 'package:flutter/material.dart';
import 'package:keekly_menu/page/search_page.dart';

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  Map<String, String?> selectedMeals = {}; // Stock selected meal images

  // This function opens SearchPage and stores the selected image
  void _selectMeal(String day) async {
    final selectedImageUrl = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SearchPage()),
    );

    if (selectedImageUrl != null) {
      setState(() {
        selectedMeals[day] = selectedImageUrl;
      });
    }
  }

  final List<String> daysOfWeek = [
    "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100], // Background like other pages
      appBar: AppBar(
        title: Text("Weekly Meal Calendar"),
        backgroundColor:  Color(0xFFF3BF67), // Uniform color
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Header Row
            Container(
              padding: EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color:  Color(0xFFF3BF67),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Expanded(
                      flex: 2,
                      child: Center(
                          child: Text("Day",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)))),
                  Expanded(
                      flex: 3,
                      child: Center(
                          child: Text("Meal",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)))),
                ],
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: daysOfWeek.length,
                itemBuilder: (context, index) {
                  String day = daysOfWeek[index];
                  String? imageUrl = selectedMeals[day];

                  return Container(
                    margin: EdgeInsets.symmetric(vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 6,
                          offset: Offset(0, 3),
                        )
                      ],
                    ),
                    child: Row(
                      children: [
                        // Day Column
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(day,
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500)),
                          ),
                        ),
                        // Meal Column
                        Expanded(
                          flex: 3,
                          child: GestureDetector(
                            onTap: () => _selectMeal(day),
                            child: Container(
                              height: 80,
                              margin: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                border: Border.all(color: Color(0xFFF3BF67)),
                                borderRadius: BorderRadius.circular(8),
                                image: imageUrl != null
                                    ? DecorationImage(
                                        image: NetworkImage(imageUrl),
                                        fit: BoxFit.cover,
                                      )
                                    : null,
                              ),
                              child: imageUrl == null
                                  ? Center(
                                      child: Text(
                                        "Choose Meal",
                                        style: TextStyle(
                                            color: Colors.grey[700]),
                                      ),
                                    )
                                  : null,
                            ),
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
      ),
    );
  }
}
