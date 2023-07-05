import 'package:flutter/material.dart';
import 'package:ytquran/views/home.dart';

import 'index.dart';

class DuaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Dua App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DuaScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Dua {
  final String title;
  final String content;

  Dua({required this.title, required this.content});
}

class DuaScreen extends StatelessWidget {
  final List<Dua> duas = [
    Dua(
      title: ' Dua upon waking up',
      content: 'الحمد لله الذي أحيانا بعد ما أماتنا وإليه النشور',
    ),
    Dua(
      title: 'Dua When Leaving the Bed',
      content: 'بِسْمِ اللَّهِ',
    ),
    Dua(
      title: 'Dua for Morning',
      content: 'اللَّهُمَّ بِكَ أَصْبَحْنَا، وَبِكَ أَمْسَيْنَا، وَبِكَ نَحْيَا، وَبِكَ نَمُوتُ وَإِلَيْكَ النُّشُورُ',
    ),
    Dua(
      title: 'Dua for evening',
      content: 'اللَّهُمَّ بِكَ أَمْسَيْنَا، وَبِكَ أَصْبَحْنَا، وَبِكَ نَحْيَا، وَبِكَ نَمُوتُ وَإِلَيْكَ النُّشُورُ',
    ),
    Dua(
      title: ' Dua before meals',
      content: 'الحَمْدُ لِلَّهِ',
    ),
    Dua(
      title: 'Dua after finishing the meal',
      content: 'رَبِّ اِنِّىْٓ اَعُوْذُ بِكَ اَنْ اَسْـــَٔـلَكَ مَا لَيْسَ لِيْ بِهٖ عِلْمٌ ۭ وَاِلَّا تَغْفِرْ لِيْ وَتَرْحَمْنِيْٓ اَكُنْ مِّنَ الْخٰسِرِيْنَ',
    ),
    Dua(
      title: 'Dua Seeking Protection from Evil',
      content: 'اللَّهُمَّ إِنِّي أَمْسَيْتُ أُشْرِكُ بِكَ مَا لَا أَعْلَمُ، أَسْتَغْفِرُكَ لِمَا أَعْلَمُ، إِنَّكَ أَنْتَ عَلَّامُ الْغُيُوبِ، اللَّهُمَّ إِنْ كُنْتَ تَعْلَمُ أَنَّ هَذَا الْأَمْرَ خَيْرٌ لِي فِي دِينِي وَمَعَاشِي وَعَاقِبَةِ أَمْرِي، فَاقْدُرْهُ لِي وَيَسِّرْهُ لِي ثُمَّ بَارِكْ لِي فِيهِ، وَإِنْ كُنْتَ تَعْلَمُ أَنَّ هَذَا الْأَمْرَ شَرٌّ لِي فِي دِينِي وَمَعَاشِي وَعَاقِبَةِ أَمْرِي، فَاصْرِفْهُ عَنِّي وَاصْرِفْنِي عَنْهُ وَاقْدُرْ لِيَ الْخَيْرَ حَيْثُ كَانَ ثُمَّ ارْضِنِي بِهِ',
    ),
    Dua(
      title: 'For greeting people',
      content: 'السلام عليكم ورحمة الله وبركاته',
    ),
    Dua(
      title: 'For travel',
      content: 'سُبْحَانَ الَّذِي سَخَّرَ لَنَا هَذَا وَمَا كُنَّا لَهُ مُقْرِنِينَ وَإِنَّا إِلَى رَبِّنَا لَمُنْقَلِبُونَ.',
    ),
    Dua(
      title: 'On hearing Athan',
      content: 'لَا حَوْلَ وَلَا قُوَّةَ إِلَّا بِاللهِ',
    ),
     Dua(
      title: 'Seek Allahs guidance',
      content: 'الْحَمْدُ لِلَّهِ الَّذِي هَدَانَا لِهَٰذَا وَمَا كُنَّا لِنَهْتَدِيَ لَوْلَا أَنْ هَدَانَا اللَّهُ',
    ),
     Dua(
      title: 'Upon Entering Home',
      content: 'بِسْـمِ اللّهِ وَلَجْنـَا، وَبِسْـمِ اللّهِ خَـرَجْنـَا، وَعَلَـى رَبِّنـَا تَوَكّلْـنَا.',
    ),
     Dua(
      title: 'Upon entering Mosque',
      content: 'أَعوذُ بِاللّهِ العَظِيـمِ، وَبِوَجْهِـهِ الكَرِيـمِ وَسُلْطـَانِه القَدِيـمِ، مِنَ الشَّيْـطَانِ الرَّجِـيمِ، [ بِسْـمِ اللّهِ وَالصَّلَاةُ ] [وَالسَّلامُ عَلَى رَسُولِ اللّهِ]، اَللَّهُـمَّ افْتَـحْ لِي أَبْوَابَ رَحْمَتـِكَ.',
    ),
     Dua(
      title: 'Upon sneezing',
      content: 'اَلْحَمْدُ لِلَّهِ',
    ),
     Dua(
      title: 'When given a drink',
      content: 'اللَّهُمَّ اطْعِمَّ مَنْ اطْعَمَنِي وَاسْقِِِ ِ مَنْ سَقَانِيِ',
    ),
     Dua(
      title: 'When Leaving Home',
      content: 'بِسْمِ اللَّهِ تَوَكَّلْـتُ عَلَى اللَّهِ، وَلاَ حَوْلَ وَلاَ قُـوَّةَ إِلاَّ بِاللَّهِ.',
    ),
     Dua(
      title: 'When prostrating',
      content: 'سَجَدَ وَجْهِيَ لِلَّذِي خَلَقَهُ، وَشَقَّ سَمْعَهُ وَبَصَرَهُ، بِحَوْلِهِ وَقُوَّتِهِ، فَتَبَارَكَ اللَّهُ أَحسَنُ الْخَالِقِينَ',
    ),
     Dua(
      title: 'When beginning a meal ',
      content: 'بِسْمِ اللّٰہِ الرَّحْمٰنِ الرَّحِيْمِ',
    ),
     Dua(
      title: 'Forgiveness for your siblings ',
      content: 'رَبِّ اغْفِرْ لِي وَلِأَخِي وَأَدْخِلْنَا فِي رَحْمَتِكَ ۖ وَأَنْتَ أَرْحَمُ الرَّاحِمِينَ',
    ),


  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Duas'),
         leading: IconButton(
    icon: Icon(Icons.arrow_back),
    onPressed: () {
       Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomePage()),
                  );
    },
  ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Handle search button press
              showSearch(
                context: context,
                delegate: DuaSearchDelegate(duas: duas),
              );
            },
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.5,
        ),
        itemCount: duas.length,
        itemBuilder: (BuildContext context, int index) {
          final dua = duas[index];
          return GestureDetector(
            onTap: () {
              // Handle dua tap event
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text(dua.title),
                    content: Text(dua.content),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Close'),
                      ),
                    ],
                  );
                },
              );
            },
            child: Card(
              child: Center(
                child: Text(
                  dua.title,
                  style: TextStyle(fontSize: 16.0),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class DuaSearchDelegate extends SearchDelegate<Dua> {
  final List<Dua> duas;

  DuaSearchDelegate({required this.duas});

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
Widget buildLeading(BuildContext context) {
  return IconButton(
    icon: Icon(Icons.arrow_back),
    onPressed: () {
      Navigator.pop(context);
    },
  );
}

@override
Widget buildResults(BuildContext context) {
  final results = duas.where((dua) => dua.title.toLowerCase().contains(query.toLowerCase())).toList();

  return ListView.builder(
    itemCount: results.length,
    itemBuilder: (BuildContext context, int index) {
      final dua = results[index];
      return ListTile(
        title: Center(
          child: Text(dua.title),
        ),
        onTap: () {
          close(context, dua);
          // Handle dua tap event
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(dua.title),
                content: Text(dua.content),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Close'),
                  ),
                ],
              );
            },
          );
        },
      );
    },
  );
}

@override
Widget buildSuggestions(BuildContext context) {
  final suggestions = duas.where((dua) => dua.title.toLowerCase().contains(query.toLowerCase())).toList();

  return ListView.builder(
    itemCount: suggestions.length,
    itemBuilder: (BuildContext context, int index) {
      final dua = suggestions[index];
      return ListTile(
        title: Center(
          child: Text(dua.title),
        ),
        onTap: () {
          close(context, dua);
          // Handle dua tap event
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(dua.title),
                content: Text(dua.content),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Close'),
                  ),
                ],
              );
            },
          );
        },
      );
    },
  );
}
}

