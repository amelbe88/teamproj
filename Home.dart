import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> foodItems = [
    {
      "name": "Couscous",
      "time": "90 min",
      "rating": 5.0,
      "price": "Rs. 190/-",
      "image": "https://i.postimg.cc/SsKCYmVg/couscous.jpg",
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
      "image": "https://i.postimg.cc/RhDRZWB1/Lasagnes.jpg",
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
      "image": "https://i.postimg.cc/WpxqTBqc/spaghetti.jpg",
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
      "image": "https://i.postimg.cc/8kxN7Dbw/caesar-salad-wonton-cups.jpg",
      "category": "Starter"
    },
    {
      "name": "Lemon cheesecakes",
      "time": "20 min",
      "rating": 4.9,
      "price": "Rs. 260/-",
      "image": "https://i.postimg.cc/m23JTGpP/Lemon-cheesecakes.jpg",
      "category": "Dessert"
    },
    {
      "name": "Pizza",
      "time": "50 min",
      "rating": 4.7,
      "price": "Rs. 250/-",
      "image": "https://i.postimg.cc/prmWgLJ5/pizza.jpg",
      "category": "Main plat"
    },
    {
      "name": "Cucumber shrimp ",
      "time": "30 min",
      "rating": 4.9,
      "price": "Rs. 260/-",
      "image": "https://i.postimg.cc/x1Jfs8Tw/Cucumber-Shrimp.jpg",
      "category": "Starter"
    },
    {
      "name": "Tiramisu",
      "time": "10 min",
      "rating": 4.9,
      "price": "Rs. 260/-",
      "image": "https://i.postimg.cc/9MJHXHQP/Tiramisu.jpg",
      "category": "Dessert"
    },
    {
      "name": "Chicken alfredo",
      "time": "50 min",
      "rating": 4.7,
      "price": "Rs. 250/-",
      "image": "https://i.postimg.cc/g0GYGDKW/chicken-alfredo.jpg",
      "category": "Main plat"
    },
    {
      "name": "Strawberry cheesecake",
      "time": "20 min",
      "rating": 4.9,
      "price": "Rs. 260/-",
      "image": "https://i.postimg.cc/2jKg0wb5/Strawberry-cheesecake.jpg",
      "category": "Dessert"
    },
    {
      "name": "Pistachio Tiramisu",
      "time": "10 min",
      "rating": 4.9,
      "price": "Rs. 260/-",
      "image": "https://i.postimg.cc/Jh7Wfh17/Pistachio-tiramisu.jpg",
      "category": "Dessert"
    },
    {
      "name": "Mini quiche",
      "time": "40 min",
      "rating": 4.9,
      "price": "Rs. 260/-",
      "image": "https://i.postimg.cc/GmQWx1vW/Mini-quiche.jpg",
      "category": "Starter"
    },
  ];

  final Color customColor = Color(0xFFF3BF67);
  List<bool> selectedItems = [];
  String selectedCategory = "All";

  @override
  void initState() {
    super.initState();
    selectedItems = List.generate(foodItems.length, (_) => false);
  }

  List<Map<String, dynamic>> get filteredItems {
    if (selectedCategory == "All") return foodItems;
    return foodItems
        .where((item) => item["category"] == selectedCategory)
        .toList();
  }

  Widget categoryButton(String title) {
    final bool isSelected = selectedCategory == title;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedCategory = title;
        });
      },
      child: Text(
        title,
        style: TextStyle(
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          color: isSelected ? Colors.black : Colors.black54,
          decoration: isSelected ? TextDecoration.underline : null,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),
        title: Text(
          "Home",
          style: TextStyle(
              color: customColor, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.access_time, color: customColor),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.menu, color: customColor),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: customColor, width: 1.5),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    )
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search your food",
                    hintStyle: TextStyle(color: Colors.black45),
                    prefixIcon: Icon(Icons.search, color: customColor),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 15),
              Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Color(0xffefd09c),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    categoryButton("All"),
                    categoryButton("Starter"),
                    categoryButton("Main plat"),
                    categoryButton("Dessert"),
                  ],
                ),
              ),
              SizedBox(height: 15),
              GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.72,
                ),
                itemCount: filteredItems.length,
                itemBuilder: (context, index) {
                  final food = filteredItems[index];
                  return GestureDetector(
                    onTapDown: (_) =>
                        setState(() => selectedItems[index] = true),
                    onTapUp: (_) =>
                        setState(() => selectedItems[index] = false),
                    onTapCancel: () =>
                        setState(() => selectedItems[index] = false),
                    child: AnimatedScale(
                      duration: Duration(milliseconds: 150),
                      scale: selectedItems[index] ? 0.97 : 1.0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 5,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(15)),
                              child: Image.network(
                                food["image"],
                                height: 110,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(food["name"],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(height: 4),
                                  Text(food["time"],
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 12)),
                                  SizedBox(height: 6),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(food["price"],
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      Row(
                                        children: [
                                          Icon(Icons.star,
                                              color: customColor, size: 16),
                                          Text(food["rating"].toString()),
                                          SizedBox(width: 4),
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                selectedItems[index] =
                                                    !selectedItems[index];
                                              });
                                            },
                                            child: Icon(
                                              selectedItems[index]
                                                  ? Icons.add_circle
                                                  : Icons.add_circle_outline,
                                              color: selectedItems[index]
                                                  ? customColor
                                                  : Colors.grey,
                                              size: 20,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: customColor,
        unselectedItemColor: customColor,
        currentIndex: 1,
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
}
