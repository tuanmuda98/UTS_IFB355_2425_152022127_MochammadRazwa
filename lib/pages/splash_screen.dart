import 'package:flutter/material.dart';
import 'dashboard_page.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => DashboardPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: NetworkImage('https://placekitten.com/200/200'), // Ganti dengan foto kamu
            ),
            SizedBox(height: 20),
            Text('Aplikasi Manajemen Waktu dan Produktivitas', style: TextStyle(fontSize: 24, color: Colors.white)),
            SizedBox(height: 10),
            Text('NIM: 1234567890\nNama: John Doe', style: TextStyle(fontSize: 16, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
