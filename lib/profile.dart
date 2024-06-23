import 'package:flutter/material.dart';
import 'package:test_coba/editProfile.dart';
import 'package:test_coba/login.dart';
import 'package:test_coba/pusatBantuan.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test_coba/syaratKetentuan.dart';
import 'package:test_coba/history.dart';
import 'package:test_coba/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  final FirebaseAuth _auth = FirebaseAuth.instance; // Inisialisasi FirebaseAuth di luar kelas

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String? _username;
  String? _profileImageUrl;

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  // Method untuk mengambil data pengguna
  Future<void> _loadUserData() async {
    try {
      if (widget._auth.currentUser != null) { // Menggunakan widget._auth
        String userId = widget._auth.currentUser!.uid;
        // Get user data from Firestore
        DocumentSnapshot userData = await _firestore.collection('users').doc(userId).get();
        setState(() {
          _username = userData['username'] as String?;
          _profileImageUrl = userData['profileImageUrl'] as String?;
        });
      }
    } catch (e) {
      print("Error loading user data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: <Widget>[
          SizedBox(height: 20.0),
          Text(
            'Profile',
            style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 20.0),
          Row(
            children: <Widget>[
              CircleAvatar(
                radius: 30.0,
                backgroundImage: _profileImageUrl != null
                    ? NetworkImage(_profileImageUrl!) as ImageProvider
                    : AssetImage('assets/petani.jpg') as ImageProvider,
              ),
              SizedBox(width: 20.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    _username ?? 'Loading...',
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(height: 5.0),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) => EditProfilePage()));
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF2E8B57)),
                    ),
                    child: Text(
                      'Edit Profil',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10.0),
          Text(
            'Lainnya',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.0),
          GestureDetector(
            onTap: () {
              _navigateToTerms();
            },
            child: Text(
              'Syarat dan Ketentuan',
              style: TextStyle(fontSize: 16.0),
            ),
          ),
          SizedBox(height: 10.0),
          Divider(),
          SizedBox(height: 10.0),
          GestureDetector(
            onTap: () {
              _navigateToHistory();
            },
            child: Text(
              'History',
              style: TextStyle(fontSize: 16.0),
            ),
          ),
          SizedBox(height: 10.0),
          Divider(),
          SizedBox(height: 10.0),
          GestureDetector(
            onTap: () {
              _navigateToHelp();
            },
            child: Text(
              'Pusat Bantuan',
              style: TextStyle(fontSize: 16.0),
            ),
          ),
          SizedBox(height: 10.0),
          Divider(),
          ElevatedButton(
            onPressed: () {
              _logout();
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF2E8B57)),
            ),
            child: Text(
              'Keluar',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  // Method untuk logout
  void _logout() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.remove('userId'); // Hapus informasi login dari SharedPreferences

      await widget._auth.signOut(); // Menggunakan widget._auth
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => BeginPage()));
    } on FirebaseAuthException catch (e) {
      print("Error occurred during logout: $e");
    }
  }

  // Method untuk menavigasi ke halaman Syarat dan Ketentuan
  void _navigateToTerms() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => TermsPage()));
  }

  // Method untuk menavigasi ke halaman Pusat Bantuan
  void _navigateToHelp() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => PusatBantuanPage()));
  }

  void _navigateToHistory() {
    Navigator.push(context, MaterialPageRoute(builder: (context) => History()));
  }
}
