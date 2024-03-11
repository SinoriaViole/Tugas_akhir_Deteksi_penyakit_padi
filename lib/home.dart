import 'package:flutter/material.dart';
import 'package:test_coba/penyakit.dart';
import 'package:test_coba/scan.dart'; // Perbaikan pada impor ScanPage
import 'package:test_coba/obat.dart';
import 'package:test_coba/profile.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildPage(_currentIndex),
      // Menggunakan _buildPage untuk menampilkan konten sesuai dengan indeks yang dipilih
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.green[800],
        unselectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex =
                index; // Mengatur nilai _currentIndex berdasarkan indeks yang dipilih
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle floating action button press
        },
        shape: CircleBorder(),
        tooltip: 'Increment',
        child: Icon(Icons.camera_alt, color: Colors.white),
        backgroundColor: Color(0xFF2E8B57),
      ),
    );
  }

  Widget _buildPage(int index) {
    if (index == 0) {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Welcome ',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 20),
            _buildBanner(),
            SizedBox(height: 20),
            _buildCategories(),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Featured Products',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(height: 10),
            // Add your featured products here
          ],
        ),
      );
    } else if (index == 1) {
      return ProfilePage(); // Menampilkan halaman profil jika indeks adalah 1
    } else {
      return Container(); // Menampilkan konten kosong jika currentIndex tidak valid
    }
  }

  Widget _buildBanner() {
    return Container(
      height: 200,
      margin: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20), // Sudut border container
        color: Colors.green[100],
      ),
      child: ClipRRect( // Menggunakan ClipRRect untuk membuat sudut bulat di tepi gambar
        borderRadius: BorderRadius.circular(20), // Sudut border gambar
        child: Image.asset(
          'assets/banner_rice.jpg', // Ganti dengan path gambar Anda
          height: 200,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),
    );
  }


  Widget _buildCategories() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Kategori',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 10),
        Container(
          height: 100,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _buildCategoryCard('Penyakit', Icons.local_florist),
              _buildCategoryCard('Obat', Icons.eco),
              _buildCategoryCard('Scan', Icons.grain),
              _buildCategoryCard('Bantuan', Icons.nature),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCategoryCard(String title, IconData icon) {
    return GestureDetector(
      onTap: () {
        if (title == 'Scan') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyApp()),
          );
        } else if (title == 'Obat') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ObatPage()),
          );
        } else if (title == 'Penyakit') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PenyakitPage()),
          );
        }
      },
      child: Container(
        width: 90, // Menambah lebar kontainer
        margin: EdgeInsets.symmetric(horizontal: 10), // Menambah jarak geser
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.green[200],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 35, // Menambah ukuran ikon
              color: Colors.green[800],
            ),
            SizedBox(height: 5), // Menambah jarak antara ikon dan teks
            Text(
              title,
              style: TextStyle(fontSize: 14), // Menambah ukuran teks
            ),
          ],
        ),
      ),
    );
  }
}
