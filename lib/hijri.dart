import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';

class Hijri extends StatefulWidget {
  const Hijri({Key? key}) : super(key: key);

  @override
  State<Hijri> createState() => _HijriState();
}

class _HijriState extends State<Hijri> {
  late HijriCalendar _hijriCalendar;

  @override
  void initState() {
    super.initState();
    _initializeHijriCalendar();
  }

  void _initializeHijriCalendar() {
    final now = DateTime.now();
    _hijriCalendar = HijriCalendar.fromDate(now);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Hijri Date:',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          '${_hijriCalendar.toFormat("dd-MM-yyyy")}',
          style: TextStyle(fontSize: 18),
        ),
      ],
    );
  }
}
