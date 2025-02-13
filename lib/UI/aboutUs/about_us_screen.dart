import 'package:flutter/material.dart';
import 'dart:async';

class AboutUsPage extends StatefulWidget {
  @override
  _AboutUsPageState createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {
  bool _isVisible = true;

  @override
  void initState() {
    super.initState();
    // Make the text blink every second
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _isVisible = !_isVisible; // Toggle visibility
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Us'),
        backgroundColor: Color(0xFF0504AA),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Main Title
            Text(
              'Run Your Gun Tactical® - Firearms Training and FFL Services',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 25),
            // Mission Text
            Text(
              'Our mission is to educate and equip civilians, law enforcement, and military personnel with the tools necessary to handle firearms safely and responsibly.\n\n\n',
              style: TextStyle(fontSize: 11),
              textAlign: TextAlign.center,
            ),
            // RYGT Origin Story
            Text(
              'RYGT Origin Story\n________',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            // Image and Description
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipOval(
                  child: Image.asset(
                    'assets/Origin.png',
                    width: 140,
                    height:
                        140, // Same width and height to create a perfect circle
                    fit: BoxFit.cover, // Ensures image covers the circular area
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    "Run Your Gun Tactical® was launched in the year of 2020 with the goals to equip and educate the masses, near and far. We desired to be able to influence the training space with 'right' teaching and education. In our time of training, we have trained over 600 students in various capacities. We have influenced change in our communities by creating a safe space for individuals to become Self-Protectors. We have partnered with companies such as Integricorp LLC (Marlon Huddleston) and Lacy's Defense (Jovonna Lacy) to provide joint offerings in MS [Home State], LA, TN, TX, and virtually.",
                    style: TextStyle(fontSize: 9.2),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20), // Space for the next section

            // Page Break Line
            Divider(
              color: Colors.black, // Line color
              thickness: 1, // Line thickness
            ),
            SizedBox(height: 20),

            // Meet the Owner Title with Blinking Text
            // Text(
            //   'Meet the Owner',
            //  style: TextStyle(
            //   fontSize: 22,
            //   fontWeight: FontWeight.bold,
            // ),
            //textAlign: TextAlign.center,
            //  ),
            // SizedBox(height: 10),

            // Blinking Text
            AnimatedOpacity(
              opacity: _isVisible ? 1.0 : 0.0, // Blink effect
              duration: Duration(milliseconds: 1200),
              child: Text(
                'Meet the Owner',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF0504AA),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 20),

            // Owner Image and Description
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipOval(
                  child: Image.asset(
                    'assets/Client.png', // Circular image for the owner
                    width: 140,
                    height: 140, // Circular shape
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    "Jaron R Smith 'Smitty'",
                    style: TextStyle(fontSize: 10),
                    textAlign: TextAlign.left,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
