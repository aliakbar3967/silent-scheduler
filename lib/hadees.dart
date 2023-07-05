import 'package:flutter/material.dart';

List<String> hadithCollections = [
  'Sahih Bukhari',
  'Sahih Muslim',
  'Sunan Abi Dawood',
  'Jami` at-Tirmidhi',
  'Sunan an-Nasa\'i',
  'Sunan Ibn Majah',
];

class HadithApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Masjid Mode',
      theme: ThemeData(
        primaryColor: Colors.blue,
        // accentColor: Colors.blueAccent,
      ),
      home: HadithCollectionsScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HadithCollectionsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hadith Collections'),
      ),
      body: ListView.builder(
        itemCount: hadithCollections.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 1.0,
                  blurRadius: 2.0,
                ),
              ],
            ),
            child: ListTile(
              title: Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  hadithCollections[index],
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
              ),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HadithScreen(
                      collection: hadithCollections[index],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class HadithScreen extends StatelessWidget {
  final String collection;

  HadithScreen({required this.collection});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(collection),
      ),
      body: Center(
        child: Text(
          'This is the $collection page.',
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}

void main() {
  runApp(HadithApp());
}
