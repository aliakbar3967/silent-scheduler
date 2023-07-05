import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_qiblah/flutter_qiblah.dart';
import 'package:ytquran/qibla_compass.dart';
import 'package:ytquran/qibla_compass.dart';

class Qibla extends StatefulWidget {
  const Qibla({Key? key}) : super(key: key);

  @override
  State<Qibla> createState() => _QiblaState();
}

class _QiblaState extends State<Qibla> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text('Qibla'),
      ),
        body: FutureBuilder(
          future: FlutterQiblah.androidDeviceSensorSupport(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                ),
              );
            }

            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error.toString()}'),
              );
            }
            if (snapshot.hasData) {
              return const QiblaCompass();
            } else {
              return const Text('Error');
            }
          },
        ),
    );
    
  }
}
