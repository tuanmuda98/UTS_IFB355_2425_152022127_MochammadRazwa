import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'home_screen.dart'; // Gantilah dengan nama file halaman utama Anda jika berbeda

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Menunggu selama 5 detik sebelum pindah ke halaman utama (dashboard)
    Future.delayed(Duration(seconds: 5), () {
      // Navigasi ke halaman utama setelah 5 detik
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent, // Anda bisa mengubah warna background
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Menyusun teks di tengah
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50.0, // Ukuran avatar
              backgroundImage: AssetImage('assets/images/muka.jpg'), // Gambar profil
            ),
            SizedBox(height: 20),
            Text(
              'Aplikasi Manajemen Waktu dan Produktivitas', // Teks judul
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Warna teks
              ),
              textAlign: TextAlign.center, // Menjaga teks agar terpusat
            ),
            SizedBox(height: 10),
            Text(
              'Nama: Mochammad Razwa\nNIM: 152022127', // Teks informasi
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
              textAlign: TextAlign.center, // Teks tetap terpusat
            ),
          ],
        ),
      ),
    );
  }
}
