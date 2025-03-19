import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:rygtapp/UI/aboutUs/about_us_screen.dart';
import 'package:rygtapp/UI/shop/shop_screen.dart'; // Import Shop screen

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late PageController _pageController;
  late VideoPlayerController _videoController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    // Initialize the video player and start playing it automatically
    _videoController = VideoPlayerController.asset('assets/Welcome.mp4')
      ..initialize().then((_) {
        setState(() {
          _videoController.setLooping(true);
          _videoController.play(); // Start playing the video automatically
        });
      }).catchError((error) {
        print("Error loading video: $error");
      });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "RYGT",
          style: TextStyle(
            fontFamily: 'Roboto',
            fontWeight: FontWeight.bold,
            fontSize: 30,
            letterSpacing: 1.5,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFF0504AA),
        elevation: 0,
        actions: [
          // Add the PopupMenuButton for the "hamburger" menu
          PopupMenuButton<String>(
            icon: const Icon(Icons.menu, color: Colors.white),
            onSelected: (value) {
              if (value == 'aboutUs') {
                // Navigate to the About Us page when clicked
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          AboutUsPage()), // Navigate to AboutUsPage
                );
              }
            },
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem<String>(
                value: 'aboutUs',
                child: Text('About Us'),
              ),
            ],
          ),
        ],
      ),
      body: Container(
        // Apply blue-black gradient as the background
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF0504AA), // Blue color
              Colors.black, // Black color
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: IndexedStack(
          index: _currentIndex,
          children: [
            // Home Tab Content
            Column(
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Stack(
                    children: [
                      PageView(
                        controller: _pageController,
                        onPageChanged: (index) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                        children: [
                          // First Page: Video
                          Stack(
                            fit: StackFit.expand,
                            children: [
                              _videoController.value.isInitialized
                                  ? AspectRatio(
                                      aspectRatio:
                                          _videoController.value.aspectRatio,
                                      child: VideoPlayer(_videoController),
                                    )
                                  : const Center(
                                      child:
                                          CircularProgressIndicator(), // Loading indicator until video is initialized
                                    ),
                            ],
                          ),
                          // Second Page: Text (Explore Our Features)
                          Stack(
                            children: [
                              Positioned(
                                top: 0,
                                left: 0,
                                right: 0,
                                child: Image.asset(
                                  'assets/pic1.png',
                                  fit: BoxFit.cover,
                                  height: 250,
                                ),
                              ),
                              Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Text(
                                    "FIREARMS COACHING & TRAINING | FFL SERVICES\n\n"
                                    "Run Your Gun Tactical ® is a company structured to train, coach, and educate self-protectors. Our mission is to educate and equip civilians, law enforcement, and military personnel with the tools necessary to handle firearms safely and responsibly.",
                                    style: const TextStyle(
                                      color: Colors.white,
                                      height: 1.1,
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      // **Positioned page indicator (small buttons at the bottom-right corner)**
                      Positioned(
                        bottom: 10,
                        right: 10,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: List.generate(
                            2,
                            (index) => AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              margin: const EdgeInsets.symmetric(horizontal: 5),
                              height: 8,
                              width: 8,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _currentIndex == index
                                    ? Colors.black
                                    : Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Center(child: Text("Courses")),
            const Shop(), // Display Shop screen here when tapped
            const Center(child: Text("Other Content")),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        selectedFontSize: 14,
        unselectedFontSize: 12,
        iconSize: 30,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Training',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_rounded),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Blog',
          ),
        ],
      ),
    );
  }
}
