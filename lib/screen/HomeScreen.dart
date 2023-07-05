import 'package:disable_battery_optimization/disable_battery_optimization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ytquran/controller/SettingsController.dart';
import 'package:ytquran/screen/AppInfoScreen.dart';
import 'package:ytquran/screen/HelpScreen.dart';
import 'package:ytquran/screen/SettingsScreen.dart';
import 'package:ytquran/screen/components/ScheduleList.dart';
import 'package:ytquran/screen/widgets/HelperWidgets.dart';
import 'package:ytquran/screen/widgets/FloatingActionBottomSheet.dart';
import 'package:ytquran/screen/widgets/custom_bottom_sheet.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void initialize() async {
    bool? isBatteryOptimizationDisabled =
        await DisableBatteryOptimization.isBatteryOptimizationDisabled;
    if (isBatteryOptimizationDisabled == false) {
      DisableBatteryOptimization.showDisableBatteryOptimizationSettings();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Theme.of(context).primaryColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          // await SettingsController.setSilentMode();
          customBottomSheet(context, [FloatingActionBottomSheet()]);
        },
        // onPressed: () async => initialize(),
      ),
      bottomNavigationBar: bottomNavigationBar(context),
      appBar: AppBar(
        title: Text("Masjid Mode".toUpperCase()),
        actions: [
          IconButton(
            icon: Icon(Icons.help_outline_sharp),
            onPressed: () => Navigator.push(
              context,
              CupertinoPageRoute(builder: (context) => HelpScreen()),
            ).then((response) => null),
          ),
          IconButton(
              onPressed: () async => customBottomSheet(
                    context,
                    [
                      Card(
                        // shape: StadiumBorder(),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                          leading: const Icon(Icons.settings),
                          title: const Text('Settings'),
                          onTap: () => Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => SettingsScreen()),
                          ).then((response) => null),
                        ),
                      ),
                      Card(
                        // shape: StadiumBorder(),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                          leading: const Icon(Icons.share),
                          title: const Text('Share'),
                          onTap: () => Share.share(
                              "Masjid Mode - A Complete App for Muslims. Please visit https://play.google.com/store/apps/details?id= and download this awesome app.",
                              subject: 'Masjid Mode - A Complete App for Muslims.'),
                        ),
                      ),
                      Card(
                        // shape: StadiumBorder(),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                          leading: const Icon(Icons.star),
                          title: const Text('Rate'),
                          onTap: () async => await canLaunchUrl(Uri.parse(
                                  "https://play.google.com/store/apps/details?id=com.cip.masjidmode"))
                              ? await launchUrl(Uri.parse(
                                  "https://play.google.com/store/apps/details?id=com.cip.masjidmode"))
                              : throw 'Could not launch',
                        ),
                      ),
                      Card(
                        // shape: StadiumBorder(),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                          leading: const Icon(Icons.privacy_tip),
                          title: const Text('Privacy Policy'),
                          onTap: () async => await canLaunchUrl(Uri.parse(
                                  "https://masjidmode.org/privacy.html"))
                              ? await launchUrl(Uri.parse(
                                  "https://masjidmode.org/privacy.html"))
                              : throw 'Could not launch',
                        ),
                      ),
                      Card(
                        // shape: StadiumBorder(),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                          leading: const Icon(Icons.help),
                          title: const Text('Help'),
                          onTap: () => Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => HelpScreen()),
                          ).then((response) => null),
                        ),
                      ),
                      Card(
                        // shape: StadiumBorder(),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                          leading: const Icon(Icons.info),
                          title: const Text('About'),
                          onTap: () => Navigator.push(
                            context,
                            CupertinoPageRoute(
                                builder: (context) => AppInfoScreen()),
                          ).then((response) => null),
                        ),
                      ),
                      Card(
                        // shape: StadiumBorder(),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                          leading: const Icon(Icons.apps),
                          title: const Text('More Apps'),
                          onTap: () async => await canLaunchUrl(Uri.parse(
                                  "https://play.google.com/store/apps/dev?id=6104175614035929696"))
                              ? await launchUrl(Uri.parse(
                                  "https://play.google.com/store/apps/dev?id=6104175614035929696"))
                              : throw 'Could not launch',
                        ),
                      ),
                    ],
                  ),
              icon: Icon(Icons.more_vert)),
        ],
      ),
      body: SafeArea(
        child: ScheduleList(),
      ),
    );
  }
}
