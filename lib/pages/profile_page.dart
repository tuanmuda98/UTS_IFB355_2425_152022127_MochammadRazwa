import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        backgroundColor: Colors.blueAccent,
        automaticallyImplyLeading: false, // Menonaktifkan tombol kembali default
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              // Foto Profil
              CircleAvatar(
                radius: 70.0,
                backgroundImage: AssetImage('assets/images/muka.jpg'), // Gambar profil
              ),
              SizedBox(height: 20),
              // Nama Pengguna
              Text(
                'Mochammad Razwa',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              // Email Pengguna
              Text(
                'mochammad.razwa@mhs.itenas.ac.id',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 15),
              // NIM Pengguna
              Text(
                'NIM: 152022127',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 30),
              // Menambahkan styling pada tombol (tanpa tombol kembali ke dashboard)
              ElevatedButton(
                onPressed: () {
                  // Jika tombol perlu ditambahkan nanti, bisa disesuaikan di sini
                },
                child: Text(''),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  backgroundColor: Colors.blueAccent,
                  textStyle: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
