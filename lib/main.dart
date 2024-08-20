import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const ProfilePage(),
      title: 'Developer Title',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.grey[100],
        appBarTheme: const AppBarTheme(
          color: Colors.teal,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Future<void> _launchURL(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: const Text('Developer Profile'),
      ),
      body: Container(
        // color: Colors.blue,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 200,
                  width: 200,
                  margin: const EdgeInsets.only(top: 100),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(148),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 20,
                        spreadRadius: 70,
                        offset: const Offset(4, 4),
                      ),
                    ],
                  ),
                  child: Transform.scale(
                    scale: 1.7,
                    child: const CircleAvatar(
                      radius: 90,
                      backgroundImage: AssetImage('assets/images/tokyo.jpg'),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 200,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  onPressed: () {
                    _launchURL(
                        Uri(scheme: 'mailto', path: 'mehedithedev@icloud.com'));
                  },
                  icon: const Icon(Icons.email),
                  iconSize: 60,
                ),
                IconButton(
                  onPressed: () {
                    _launchURL(Uri.parse('https://www.google.com'));
                  },
                  icon: const Icon(Icons.web),
                  iconSize: 60,
                ),
                IconButton(
                  onPressed: () {
                    _launchURL(Uri.parse('https://www.facebook.com'));
                  },
                  icon: const Icon(Icons.facebook_rounded),
                  iconSize: 60,
                ),
                IconButton(
                  onPressed: () {
                    _launchURL(Uri.parse('https://www.github.com'));
                  },
                  icon: const Icon(Icons.code),
                  iconSize: 60,
                ),
                // IconButton(onPressed: onPressed, icon: icon)
              ],
            ),
            const Text(
              '''Flutter developer with experience in building beautiful and performant mobile apps
              ''',
              style: TextStyle(fontSize: 25),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
