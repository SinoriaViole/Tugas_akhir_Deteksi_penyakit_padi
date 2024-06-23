import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth jika digunakan
import 'package:shared_preferences/shared_preferences.dart'; // Import SharedPreferences
import 'package:test_coba/Bantuan.dart';
import 'package:test_coba/penyakit.dart';
import 'package:test_coba/scan.dart'; // Perbaikan pada impor ScanPage
import 'package:test_coba/obat.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:test_coba/detail_obat/detail_obat.dart';
import 'package:test_coba/Bantuan.dart';
import 'package:test_coba/profile.dart';
import 'package:test_coba/main.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: _buildPage(_currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.green[800],
          unselectedItemColor: Colors.black,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profil',
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyHomePage()),
            );
          },
          shape: CircleBorder(),
          tooltip: 'Tambah',
          child: Icon(Icons.camera_alt, color: Colors.white),
          backgroundColor: Color(0xFF2E8B57),
        ),
      ),
    );
  }

  Future<bool> _onBackPressed() async {
    bool? exit = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Keluar Aplikasi'),
        content: Text('Apakah Anda yakin ingin keluar?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('Tidak', style: TextStyle(color: Colors.red)),
          ),
          TextButton(
            onPressed: () async {
              Navigator.of(context).pop(true);
              bool loggedOut = await _logout();
              if (loggedOut) {
                // Redirect to login or initial page
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => BeginPage()));
              }
            },
            child: Text('Ya', style: TextStyle(color: Colors.green)),
          ),
        ],
      ),
    );
    return exit ?? false;
  }

  Future<bool> _logout() async {
    try {
      // Hapus informasi login dari SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove('userId');

      // Sign out dari Firebase Authentication
      FirebaseAuth _auth = FirebaseAuth.instance;
      await _auth.signOut();

      return true;
    } catch (e) {
      print("Error occurred during logout: $e");
      return false;
    }
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
                'Selamat Datang',
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Produk Obat',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ObatPage()),
                      );
                    },
                    child: Text(
                      'Tampilkan Semuanya',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2E8B57),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            ObatPage().obatlist != null ? _buildProductList(ObatPage().obatlist) : Container(),
          ],
        ),
      );
    } else if (index == 1) {
      return ProfilePage();
    } else {
      return Container();
    }
  }

  Widget _buildBanner() {
    return Column(
      children: [
        Container(
          height: 200,
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: PageView(
              controller: _pageController,
              children: [
                _buildBannerImage('assets/banner_rice.jpg'),
                _buildBannerImage('assets/petani2.jpg'),
                _buildBannerImage('assets/petani3.jpg'),
              ],
            ),
          ),
        ),
        SizedBox(height: 10,),
        SmoothPageIndicator(
          controller: _pageController,
          count: 3,
          effect: ExpandingDotsEffect(
            activeDotColor: Colors.green,
            dotColor: Colors.grey,
            dotHeight: 8,
            dotWidth: 8,
            spacing: 4,
          ),
        ),
      ],
    );
  }

  Widget _buildBannerImage(String imagePath) {
    return Image.asset(
      imagePath,
      height: 200,
      width: double.infinity,
      fit: BoxFit.cover,
    );
  }

  Widget _buildCategories() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Kategori',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildCategoryCard('Penyakit', Icons.local_florist),
              _buildCategoryCard('Scan', Icons.grain),
              _buildCategoryCard('Panduan', Icons.nature),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(String title, IconData icon) {
    return GestureDetector(
      onTap: () {
        if (title == 'Scan') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MyHomePage()),
          );
        } else if (title == 'Penyakit') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PenyakitPage()),
          );
        } else if (title == 'Panduan') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PanduanPage()),
          );
        }
      },
      child: Container(
        width: 100,
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.green[200],
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 35,
              color: Colors.green[800],
            ),
            SizedBox(height: 5),
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductList(List<Map<String, dynamic>> obatlist) {
    return Container(
      height: 178, // Sesuaikan tinggi container sesuai kebutuhan
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: obatlist.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailObatPage(
                    nama: obatlist[index]['nama'],
                    gambar: obatlist[index]['gambar'],
                    deskripsi: obatlist[index]['deskripsi'],
                  ),
                ),
              );
            },
            child: _buildProductCard(obatlist[index]['nama'], obatlist[index]['gambar']),
          );
        },
      ),
    );
  }

  Widget _buildProductCard(String name, String imagePath) {
    return Container(
      width: 140,
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.network(
              imagePath,
              height: 140, // Atur tinggi gambar sesuai kebutuhan
              fit: BoxFit.cover,
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            color: Colors.white.withOpacity(1.0),
            // Ubah warna latar belakang teks
            child: Text(
              name,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.black, // Ubah warna teks menjadi putih
              ),
            ),
          ),
        ],
      ),
    );
  }
}
