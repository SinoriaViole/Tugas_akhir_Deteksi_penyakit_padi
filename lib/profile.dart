import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _currentIndex = 1; // Sesuaikan indeks dengan halaman profil

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
                backgroundImage: AssetImage('assets/petani.jpg'), // Ganti dengan gambar profil
              ),
              SizedBox(width: 20.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Nama Pengguna', // Ganti dengan nama pengguna
                    style: TextStyle(fontSize: 18.0),
                  ),
                  SizedBox(height: 5.0),
                  ElevatedButton(
                    onPressed: () {
                      // Tambahkan logika untuk navigasi ke halaman edit profil
                      // Misalnya:
                      // Navigator.pushNamed(context, '/edit_profile');
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF2E8B57),)
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
          SizedBox(height: 20.0),
          Text(
            'Ubah Password',
            style: TextStyle(fontSize: 16.0),
          ),
          SizedBox(height: 10.0),
          Text(
            'Lainnya',
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10.0),
          GestureDetector(
            onTap: () {
              // Tambahkan logika untuk navigasi ke halaman syarat dan ketentuan
              // Misalnya:
              // Navigator.pushNamed(context, '/terms_conditions');
            },
            child: Text(
              'Syarat dan Ketentuan',
              style: TextStyle(
                fontSize: 16.0,

              ),
            ),
          ),
          SizedBox(height: 10.0),
          Divider(),
          SizedBox(height: 10.0),
          GestureDetector(
            onTap: () {
              // Tambahkan logika untuk navigasi ke halaman pusat bantuan
              // Misalnya:
              // Navigator.pushNamed(context, '/help_center');
            },
            child: Text(
              'Pusat Bantuan',
              style: TextStyle(
                fontSize: 16.0,

              ),
            ),
          ),
          SizedBox(height: 10.0),
          Divider(),
          ElevatedButton(
            onPressed: () {
              // Tambahkan logika untuk keluar dari akun
              // Misalnya:
              // _logout();
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF2E8B57),)
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

  void _logout() {
    // Tambahkan logika untuk keluar dari akun di sini
  }
}
