import 'package:flutter/material.dart';
import 'package:ytquran/NavigationScreen.dart';
import 'package:ytquran/index.dart';
import 'package:ytquran/names.dart';
import 'package:ytquran/style/style.dart';
import 'package:ytquran/tasbih.dart';
import 'package:ytquran/views/screen.dart';
import 'package:ytquran/home_screen.dart';
// import 'package:hijri/hijri_calendar.dart';



import '../dua.dart';
import '../hajj_live.dart';
import '../other.dart';
import '../qibla.dart';
import '../hijri.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          "Masjid Mode",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .07),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: height * .01),
                child: Center(
                  child: Image(
                    image: AssetImage('assets/masjid.png'),
                    width: width * .2,
                  ),
                ),
              ),
              Dashboard(height: height)
            ],
          ),
        ),
      ),
    );
  }
}

class Dashboard extends StatelessWidget {
  const Dashboard({
    Key? key,
    required this.height,
  }) : super(key: key);

  final double height;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              CustomContainer(
                height1: height * .27,
                image: 'assets/quran.png',
                title: "Quran",
                color: Colors.green,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
              ),
              CustomContainer(
                height1: height * .2,
                image: 'assets/qibla.png',
                title: "Qibla",
                color: Colors.brown,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Qibla()),
                  );
                },
              ),
              CustomContainer(
                height1: height * .2,
                image: 'assets/dua.png',
                title: "Daily Duas",
                color: Colors.blue,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DuaApp()),
                  );
                },
              ),
              CustomContainer(
                height1: height * .2,
                image: 'assets/kaaba.png',
                title: "Hajj Live",
                color: Colors.orange,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => YoutubePlayerH()),
                  );
                },
              ),
            ],
          ),
        ),
        Spacer(),
        Expanded(
          child: Column(
            children: [
              CustomContainer(
                height1: height * .2,
                image: 'assets/silent.png',
                title: "Silent Mode",
                color: Colors.red,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => NavigationScreen()),
                  );
                },
              ),
              CustomContainer(
                height1: height * .20,
                image: 'assets/tasbih.png',
                title: "Tasbih",
                color: Colors.purple,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TasbihApp()),
                  );
                },
              ),
              CustomContainer(
                height1: height * .27,
                image: 'assets/allah.png',
                title: "99 Names of Allah",
                color: Colors.teal,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Names()),
                  );
                },
              ),
              
              CustomContainer(
                height1: height * .2,
                image: 'assets/other.png',
                title: "Other",
                color: Colors.grey,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Other()),
                  );
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    Key? key,
    required this.height1,
    required this.image,
    required this.title,
    required this.color,
    this.onPressed,
  }) : super(key: key);

  final double height1;
  final String image;
  final String title;
  final Function()? onPressed;
  final Color color;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(top: width * .06),
      child: GestureDetector(
        onTap: onPressed, // Assign the onPressed callback to GestureDetector's onTap
        child: Container(
          height: height1,
          width: width * .4,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(1.5, 3), // changes position of shadow
              ),
            ],
            borderRadius: BorderRadius.circular(25),
            color: color,
          ),
          child: Stack(
            children: [
              Positioned.fill(
                child: Opacity(
                  opacity: 0.8,
                  child: Image.asset(
                    'assets/dashboard.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: height * .02,
                  horizontal: width * .02,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      image,
                      width: width * .15,
                      height: height * .07,
                    ),
                    Spacer(),
                    Padding(
                      padding: EdgeInsets.only(left: width * .02),
                      child: Text(
                        title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
