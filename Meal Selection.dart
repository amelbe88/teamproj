import 'package:flutter/material.dart';
import 'dart:math';

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
  String selectedMeal = "Lunch"; // Lunch ou Dinner
  final Color customColor = Color(0xFFF3BF67);

  Map<String, List<Map<String, dynamic>>> selectedMeals = {
    "Starter": [],
    "Main plat": [],
    "Dessert": [],
  };

  final List<Map<String, dynamic>> foodItems = [
    {
      "name": "Couscous",
      "time": "90 min",
      "rating": 5.0,
      "price": "Rs. 190/-",
      "image": "https://i.ibb.co/C5pJZFGP/couscous.jpg",
      "category": "Main plat"
    },
    {
      "name": "Cramel cheesecake",
      "time": "20 min",
      "rating": 4.8,
      "price": "Rs. 150/-",
      "image": "https://i.postimg.cc/P5mZSmH2/dessert.jpg",
      "category": "Dessert"
    },
    {
      "name": "Lasagnes",
      "time": "60 min",
      "rating": 4.9,
      "price": "Rs. 260/-",
      "image": "https://i.ibb.co/sp74nPzw/Lasagnes.jpg",
      "category": "Main plat"
    },
    {
      "name": "Caesar Salad",
      "time": "10 min",
      "rating": 4.9,
      "price": "Rs. 260/-",
      "image": "https://i.postimg.cc/3Nwc0SWY/image4.png",
      "category": "Starter"
    },
    {
      "name": "Spaghetti",
      "time": "50 min",
      "rating": 4.7,
      "price": "Rs. 250/-",
      "image": "https://i.ibb.co/n8whSt1s/spaghetti.jpg",
      "category": "Main plat"
    },
    {
      "name": "Mutton Biryani",
      "time": "50 min",
      "rating": 4.7,
      "price": "Rs. 250/-",
      "image": "https://i.postimg.cc/vZm2PSvn/image3.png",
      "category": "Main plat"
    },
    {
      "name": "Caesar Salad cups",
      "time": "15 min",
      "rating": 4.9,
      "price": "Rs. 260/-",
      "image": "https://i.ibb.co/rKR1bTCg/caesar-salad-wonton-cups.jpg",
      "category": "Starter"
    },
    {
      "name": "Lemon cheesecakes",
      "time": "20 min",
      "rating": 4.9,
      "price": "Rs. 260/-",
      "image": "https://i.ibb.co/TxbzwQ9n/Lemon-cheesecakes.jpg",
      "category": "Dessert"
    },
    {
      "name": "Pizza",
      "time": "50 min",
      "rating": 4.7,
      "price": "Rs. 250/-",
      "image": "https://i.ibb.co/C3STv0Rr/pizza.jpg",
      "category": "Main plat"
    },
    {
      "name": "Cucumber shrimp ",
      "time": "30 min",
      "rating": 4.9,
      "price": "Rs. 260/-",
      "image": "https://i.ibb.co/Q7b5cfYn/Cucumber-Shrimp.jpg",
      "category": "Starter"
    },
    {
      "name": "Tiramisu",
      "time": "10 min",
      "rating": 4.9,
      "price": "Rs. 260/-",
      "image": "https://i.ibb.co/RkTv1f4T/Tiramisu.jpg",
      "category": "Dessert"
    },
    {
      "name": "Chicken alfredo",
      "time": "50 min",
      "rating": 4.7,
      "price": "Rs. 250/-",
      "image": "https://i.ibb.co/MyVDvdkS/chicken-alfredo.jpg",
      "category": "Main plat"
    },
    {
      "name": "Strawberry cheesecake",
      "time": "20 min",
      "rating": 4.9,
      "price": "Rs. 260/-",
      "image": "https://i.ibb.co/hF2Cwpdy/Strawberry-cheesecake.jpg",
      "category": "Dessert"
    },
    {
      "name": "Pistachio Tiramisu",
      "time": "10 min",
      "rating": 4.9,
      "price": "Rs. 260/-",
      "image": "https://i.ibb.co/k6mDVdcL/Pistachio-tiramisu.jpg",
      "category": "Dessert"
    },
    {
      "name": "Mini quiche",
      "time": "40 min",
      "rating": 4.9,
      "price": "Rs. 260/-",
      "image": "https://i.ibb.co/Pv9QvhjD/Mini-quiche.jpg",
      "category": "Starter"
    },
  ];

  void generateRandomMeals() {
    Map<String, List<Map<String, dynamic>>> newSelection = {
      "Starter": [],
      "Main plat": [],
      "Dessert": [],
    };

    for (String category in newSelection.keys) {
      List<Map<String, dynamic>> filtered =
          foodItems.where((item) => item["category"] == category).toList();
      if (filtered.isNotEmpty) {
        filtered.shuffle();
        newSelection[category]!.add(filtered.first);
      }
    }

    setState(() {
      selectedMeals = newSelection;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
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
            // Choix Lunch / Dinner
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

            // Liste des catégories avec plats sélectionnés
            Expanded(
              child: ListView(
                children: [
                  mealCategoryTile("Starter"),
                  mealCategoryTile("Main plat"),
                  mealCategoryTile("Dessert"),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: customColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    icon: Icon(Icons.shuffle),
                    label: Text("Random Meals"),
                    onPressed: generateRandomMeals,
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Bouton Lunch/Dinner
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

  /// Widget catégorie + liste des plats sélectionnés + bouton ajouter
  Widget mealCategoryTile(String title) {
    List<Map<String, dynamic>> mealsForCategory = selectedMeals[title] ?? [];

    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: customColor.withOpacity(0.4),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
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
                onPressed: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeScreen(categoryFilter: title),
                    ),
                  );
                  if (result != null && result is Map<String, dynamic>) {
                    setState(() {
                      bool alreadySelected = selectedMeals[title]!
                          .any((element) => element["name"] == result["name"]);
                      if (!alreadySelected) {
                        selectedMeals[title]!.add(result);
                      }
                    });
                  }
                },
                icon: Icon(Icons.add_circle_outline, color: Colors.black),
              ),
            ],
          ),
          if (mealsForCategory.isEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                "No meal selected",
                style:
                    TextStyle(fontStyle: FontStyle.italic, color: Colors.grey),
              ),
            ),
          ...mealsForCategory.map((food) {
            return ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Image.network(
                food["image"],
                width: 40,
                height: 40,
                fit: BoxFit.cover,
              ),
              title: Text(food["name"]),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.edit, color: Colors.green),
                    onPressed: () async {
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              HomeScreen(categoryFilter: food["category"]),
                        ),
                      );
                      if (result != null && result is Map<String, dynamic>) {
                        setState(() {
                          int index = selectedMeals[title]!.indexWhere(
                              (item) => item["name"] == food["name"]);
                          if (index != -1) {
                            selectedMeals[title]![index] = result;
                          }
                        });
                      }
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {
                      setState(() {
                        selectedMeals[title]!.removeWhere(
                            (item) => item["name"] == food["name"]);
                      });
                    },
                  ),
                ],
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final String? categoryFilter;
  HomeScreen({this.categoryFilter});

  final List<Map<String, dynamic>> foodItems = [
    {
      "name": "Couscous",
      "time": "90 min",
      "rating": 5.0,
      "price": "Rs. 190/-",
      "image": "images/couscous.jpg",
      "category": "Main plat"
    },
    {
      "name": "Cramel cheesecake",
      "time": "20 min",
      "rating": 4.8,
      "price": "Rs. 150/-",
      "image": "https://i.postimg.cc/P5mZSmH2/dessert.jpg",
      "category": "Dessert"
    },
    {
      "name": "Lasagnes",
      "time": "60 min",
      "rating": 4.9,
      "price": "Rs. 260/-",
      "image": "https://i.ibb.co/sp74nPzw/Lasagnes.jpg",
      "category": "Main plat"
    },
    {
      "name": "Caesar Salad",
      "time": "10 min",
      "rating": 4.9,
      "price": "Rs. 260/-",
      "image": "https://i.postimg.cc/3Nwc0SWY/image4.png",
      "category": "Starter"
    },
    {
      "name": "Spaghetti",
      "time": "50 min",
      "rating": 4.7,
      "price": "Rs. 250/-",
      "image": "https://i.ibb.co/n8whSt1s/spaghetti.jpg",
      "category": "Main plat"
    },
    {
      "name": "Mutton Biryani",
      "time": "50 min",
      "rating": 4.7,
      "price": "Rs. 250/-",
      "image": "https://i.postimg.cc/vZm2PSvn/image3.png",
      "category": "Main plat"
    },
    {
      "name": "Caesar Salad cups",
      "time": "15 min",
      "rating": 4.9,
      "price": "Rs. 260/-",
      "image": "https://i.ibb.co/rKR1bTCg/caesar-salad-wonton-cups.jpg",
      "category": "Starter"
    },
    {
      "name": "Lemon cheesecakes",
      "time": "20 min",
      "rating": 4.9,
      "price": "Rs. 260/-",
      "image": "ttps://i.ibb.co/TxbzwQ9n/Lemon-cheesecakes.jpg",
      "category": "Dessert"
    },
    {
      "name": "Pizza",
      "time": "50 min",
      "rating": 4.7,
      "price": "Rs. 250/-",
      "image": "https://i.ibb.co/C3STv0Rr/pizza.jpg",
      "category": "Main plat"
    },
    {
      "name": "Cucumber shrimp ",
      "time": "30 min",
      "rating": 4.9,
      "price": "Rs. 260/-",
      "image": "https://i.ibb.co/Q7b5cfYn/Cucumber-Shrimp.jpg",
      "category": "Starter"
    },
    {
      "name": "Tiramisu",
      "time": "10 min",
      "rating": 4.9,
      "price": "Rs. 260/-",
      "image": "https://i.ibb.co/RkTv1f4T/Tiramisu.jpg",
      "category": "Dessert"
    },
    {
      "name": "Chicken alfredo",
      "time": "50 min",
      "rating": 4.7,
      "price": "Rs. 250/-",
      "image": "https://i.ibb.co/MyVDvdkS/chicken-alfredo.jpg",
      "category": "Main plat"
    },
    {
      "name": "Strawberry cheesecake",
      "time": "20 min",
      "rating": 4.9,
      "price": "Rs. 260/-",
      "image": "https://i.ibb.co/hF2Cwpdy/Strawberry-cheesecake.jpg",
      "category": "Dessert"
    },
    {
      "name": "Pistachio Tiramisu",
      "time": "10 min",
      "rating": 4.9,
      "price": "Rs. 260/-",
      "image": "https://i.ibb.co/k6mDVdcL/Pistachio-tiramisu.jpg",
      "category": "Dessert"
    },
    {
      "name": "Mini quiche",
      "time": "40 min",
      "rating": 4.9,
      "price": "Rs. 260/-",
      "image": "https://i.ibb.co/Pv9QvhjD/Mini-quiche.jpg",
      "category": "Starter"
    },
  ];

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredFood = categoryFilter == null
        ? foodItems
        : foodItems
            .where((item) => item["category"] == categoryFilter)
            .toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          categoryFilter != null ? "Plats: $categoryFilter" : "Tous les plats",
          style: TextStyle(color: Color(0xFFF3BF67)),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Color(0xFFF3BF67)),
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: filteredFood.length,
        itemBuilder: (context, index) {
          final food = filteredFood[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: ListTile(
              leading: Image.network(food["image"],
                  width: 100, height: 100, fit: BoxFit.cover),
              title: Text(food["name"],
                  style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text("${food["time"]} - ${food["price"]}"),
              trailing: Icon(Icons.add_circle, color: Color(0xFFF3BF67)),
              onTap: () {
                Navigator.pop(context, food);
              },
            ),
          );
        },
      ),
    );
  }
}
