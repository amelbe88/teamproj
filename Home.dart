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

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> foodItems = [
    {
      "name": "Chicken Keema Thukpa",
      "time": "30 min",
      "rating": 5.0,
      "price": "Rs. 190/-",
      "image": "https://i.postimg.cc/bNsJHqtf/image.png"
    },
    {
      "name": "Momo",
      "time": "20 min",
      "rating": 4.8,
      "price": "Rs. 150/-",
      "image": "https://i.postimg.cc/5yPDPcDX/image2.png"
    },
    {
      "name": "Mutton Biryani",
      "time": "10 min",
      "rating": 4.7,
      "price": "Rs. 250/-",
      "image": "https://i.postimg.cc/vZm2PSvn/image3.png"
    },
    {
      "name": "Caesar Salad",
      "time": "10 min",
      "rating": 4.9,
      "price": "Rs. 260/-",
      "image": "https://i.postimg.cc/3Nwc0SWY/image4.png"
    },
  ];

  final Color customColor = Color(0xFFF3BF67);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customColor.withOpacity(0.1),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Home",
          style: TextStyle(
            color: customColor,
            fontWeight: FontWeight.bold,
          ),
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
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search",
                  prefixIcon: Icon(Icons.search),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(height: 15),
            Container(
              height: 40,
              decoration: BoxDecoration(
                color: customColor.withOpacity(0.3),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("All", style: TextStyle(fontWeight: FontWeight.bold)),
                  Text("Salads"),
                  Text("Dessert"),
                  Text("Drink"),
                ],
              ),
            ),
            SizedBox(height: 15),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.72,
                ),
                itemCount: foodItems.length,
                itemBuilder: (context, index) {
                  final food = foodItems[index];
                  return Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 2,
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
                      Positioned(
                        top: 8,
                        right: 8,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 4,
                                offset: Offset(2, 2),
                              )
                            ],
                          ),
                          child: IconButton(
                            icon: Icon(Icons.shopping_cart_outlined,
                                color: customColor),
                            onPressed: () {
                              print("Ajouté au panier : ${food["name"]}");
                            },
                          ),
                          padding: EdgeInsets.all(6),
                          constraints: BoxConstraints(),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedItemColor: customColor,
        unselectedItemColor: customColor,
        currentIndex: 0,
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
