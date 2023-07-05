import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Prayertimes extends StatefulWidget {
  const Prayertimes({Key? key});

  @override
  State<Prayertimes> createState() => _PrayertimesState();
}

class _PrayertimesState extends State<Prayertimes> {
  List<String> prayerTimings = [
    'Fajr: 5:00 AM',
    'Dhuhr: 1:00 PM',
    'Asr: 4:00 PM',
    'Maghrib: 7:30 PM',
    'Isha: 9:00 PM',
  ];

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    initializeNotifications();
  }

  Future<void> initializeNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');
    final InitializationSettings initializationSettings =
        InitializationSettings(android: initializationSettingsAndroid);
  }

  Future<void> showNotification(String prayerTime) async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'channel_id',
      'channel_name',
      // 'channel_description',
      importance: Importance.max,
      priority: Priority.high,
    );
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
  }

  Future<void> onSelectNotification(String? payload) async {
    if (payload != null) {
      // Handle notification selection
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Prayer Timings'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 16.0,bottom: 16.0), // Add margin at the top
            height: 200.0,
            width: 200.0,
            child: Image.asset(
              'assets/pray.png',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Today\'s Prayer Timings',
                  
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10.0),
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: prayerTimings.length,
                  separatorBuilder: (context, index) => Divider(),
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Icon(
                        Icons.access_time,
                        color: Colors.black, // Set icon color to black
                      ),
                      title: Text(
                        prayerTimings[index],
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                        ),
                      ),
                      trailing: Icon(
                        Icons.notifications,
                        color: Colors.black, // Set icon color to black
                      ),
                      onTap: () {
                        showNotification(prayerTimings[index]);
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
