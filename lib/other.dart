import 'package:flutter/material.dart';

import 'package:ytquran/names.dart';

import 'hadees.dart';
import 'prayer_screen.dart';

class Other extends StatefulWidget {
  const Other({Key? key}) : super(key: key);

  @override
  State<Other> createState() => _OtherState();
}

class _OtherState extends State<Other> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Collections'),
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HadithApp()),
                  );
                },
                  child: CustomContainer(
                    gradientColors: [Color(0xFFEC407A), Color(0xFFFF7043)],
                    imagePath: 'assets/hadees.png',
                    title: 'Hadees',
                  ),
                ),
                GestureDetector(
                 onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Alert'),
                          content: Text('The team is working on new features.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: CustomContainer(
                    gradientColors: [Color(0xFF26A69A), Color(0xFF4DB6AC)],
                    imagePath: 'assets/namaz.png',
                    title: 'Namaz',
                  ),
                ),
                GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Prayertimes()),
                  );
                },
                  child: CustomContainer(
                    gradientColors: [Color(0xFF5C6BC0), Color(0xFF7E57C2)],
                    imagePath: 'assets/namaztime.png',
                    title: 'Time',
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Alert'),
                          content: Text('The team is working on new features.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: CustomContainer(
                    gradientColors: [Color(0xFF9C27B0), Color(0xFFAB47BC)],
                    imagePath: 'assets/calender.png',
                    title: 'Calendar',
                  ),
                ),
              ],
            ),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  final List<Color> gradientColors;
  final String imagePath;
  final String title;

  const CustomContainer({
    required this.gradientColors,
    required this.imagePath,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Center(
        child: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: gradientColors,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            shape: BoxShape.circle,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imagePath,
                width: 30,
                height: 30,
                color: Colors.white,
              ),
              SizedBox(height: 4.0),
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
