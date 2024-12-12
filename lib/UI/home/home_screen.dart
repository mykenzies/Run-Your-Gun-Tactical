import 'package:flutter/material.dart';
import 'package:rygtapp/UI/home/home_background.dart';

// Defining the text style for the title
TextStyle fadedTextStyle = const TextStyle(
  color: Colors.white,
  fontSize: 30,
  fontWeight: FontWeight.bold,
);

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    // Initialize page controller only
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentIndex = index;
              });
            },
            children: [
              // First Page: Placeholder Widget
              Center(
                child: Text(
                  "Welcome to RYGT",
                  style: fadedTextStyle,
                  textAlign: TextAlign.center,
                ),
              ),

              // Second Page: Background with Text
              HomeBackground(
                screenHeight: MediaQuery.of(context).size.height,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Text(
                      "Explore Our Features",
                      style: fadedTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),

          // Title at the top
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Center(
                child: Text(
                  "RYGT",
                  style: fadedTextStyle,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),

          // Dot indicators at the bottom-right
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 20.0, bottom: 20.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: List.generate(
                  2,
                  (index) => AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      color:
                          _currentIndex == index ? Colors.black : Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
