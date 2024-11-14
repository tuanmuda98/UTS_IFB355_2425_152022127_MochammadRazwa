import 'package:flutter/material.dart';
import 'profile_page.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _currentIndex = 0;
  final List<Widget> _pages = [
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        backgroundColor: Colors.blueAccent, // Warna app bar
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.blue[50], // Warna latar belakang Drawer
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                accountName: Text('Nama Pengguna'),
                accountEmail: Text('email@domain.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/your_photo.jpg'), // Gambar profil
                ),
                decoration: BoxDecoration(
                  color: Colors.blueAccent, // Warna header Drawer
                ),
              ),
              ListTile(
                title: Text('Mathematics Page', style: TextStyle(color: Colors.black)),
                onTap: () {
                  setState(() {
                    _currentIndex = 0; // Arahkan ke halaman pertama
                  });
                  Navigator.pop(context); // Tutup Drawer setelah memilih
                },
              ),
              ListTile(
                title: Text('Profile Page', style: TextStyle(color: Colors.black)),
                onTap: () {
                  setState(() {
                    _currentIndex = 1; // Arahkan ke halaman kedua
                  });
                  Navigator.pop(context); // Tutup Drawer setelah memilih
                },
              ),
              ListTile(
                title: Text('Settings Page', style: TextStyle(color: Colors.black)),
                onTap: () {
                  setState(() {
                    _currentIndex = 2; // Arahkan ke halaman ketiga
                  });
                  Navigator.pop(context); // Tutup Drawer setelah memilih
                },
              ),
            ],
          ),
        ),
      ),
      body: _pages[_currentIndex], // Menampilkan halaman sesuai dengan BottomNavigationBar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        backgroundColor: Colors.blueAccent, // Warna latar belakang BottomNavigationBar
        selectedItemColor: Colors.white, // Warna untuk item yang dipilih
        unselectedItemColor: const Color.fromARGB(255, 1, 43, 147), // Warna untuk item yang tidak dipilih
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold), // Memberikan style bold pada label yang dipilih
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: 'Math',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
