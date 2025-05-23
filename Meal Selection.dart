import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LunchDinnerScreen(),
    );
  }
}

class LunchDinnerScreen extends StatefulWidget {
  @override
  _LunchDinnerScreenState createState() => _LunchDinnerScreenState();
}

class _LunchDinnerScreenState extends State<LunchDinnerScreen> {
  String selectedMeal = "Lunch"; // par défaut Lunch
  final Color customColor = Color(0xFFF3BF67);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: customColor),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Meal Selection",
          style: TextStyle(
            color: customColor,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Image.asset(
              "assets/images/logo.png", // Remplacer par ton image
              height: 150,
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Color(0xffefd09c),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  mealButton("Lunch"),
                  SizedBox(width: 10),
                  mealButton("Dinner"),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  mealCategoryTile("Starter"),
                  mealCategoryTile("Main plat"),
                  mealCategoryTile("Dessert"),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Action Random mode
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: customColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Text("Random mode"),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: customColor,
        unselectedItemColor: Colors.grey,
        currentIndex: 1,
        onTap: (index) {
          // Gérer la navigation ici si besoin
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: ""),
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Color(0xffdbd9d7),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.home, color: customColor),
            ),
            label: "",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ""),
        ],
      ),
    );
  }

  Widget mealButton(String meal) {
    bool isSelected = selectedMeal == meal;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedMeal = meal;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? customColor : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: customColor),
        ),
        child: Text(
          meal,
          style: TextStyle(
            color: isSelected ? Colors.white : customColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget mealCategoryTile(String title) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: customColor.withOpacity(0.4),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(Icons.fastfood, color: customColor),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              // Supprimer
            },
            icon: Icon(Icons.delete, color: Colors.black),
          ),
          IconButton(
            onPressed: () {
              // Modifier
            },
            icon: Icon(Icons.edit, color: Colors.black),
          ),
          IconButton(
            onPressed: () {
              // Ajouter
            },
            icon: Icon(Icons.add_circle_outline, color: Colors.black),
          ),
        ],
      ),
    );
  }
}
