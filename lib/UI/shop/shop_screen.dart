import 'package:flutter/material.dart';

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  _ShopState createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, // This will space the items apart
                children: [
                  // Logo on the left side of the screen
                  Image.asset(
                    "assets/logo-black.png",
                    height: 140,
                    width: 100,
                  ),
                  // Stack for shopping bag icon with the badge
                  Stack(
                    children: [
                      // Shopping Bag IconButton
                      IconButton(
                        icon: const Icon(
                          Icons.shopping_bag,
                          size: 23,
                        ),
                        onPressed: () {
                          // Action when the shopping bag icon is pressed
                          print("Shopping bag pressed!");
                        },
                      ),
                      // Positioned widget for the red circle badge with the number
                      Positioned(
                        right: 3, // Adjust position horizontally
                        top: 3, // Adjust position vertically
                        child: Container(
                          padding: const EdgeInsets.all(
                              4), // Padding for the container
                          decoration: BoxDecoration(
                            color: Colors.red, // Badge color
                            shape: BoxShape.circle, // Circular shape
                          ),
                          child: const Center(
                            child: Text(
                              "3", // The number to display in the badge
                              style: TextStyle(
                                color:
                                    Colors.white, // Text color inside the badge
                                fontWeight: FontWeight.bold, // Text bold
                                fontSize: 12, // Font size for the number
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Your other widgets go here...
          ],
        ),
      ),
    );
  }
}
