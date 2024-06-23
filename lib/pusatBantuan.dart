import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PusatBantuanPage extends StatelessWidget {
  const PusatBantuanPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2E8B57), // Sesuaikan dengan warna pada bagian profil
          ),
        ),
        backgroundColor: Colors.white, // Sesuaikan dengan warna pada bagian profil
        elevation: 0, // Hilangkan bayangan pada app bar
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Selamat datang di Pusat Bantuan',
                style: TextStyle(
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              _buildSectionTitle('Fitur Utama'),
              _buildParagraph('1. Bagaimana cara menggunakan fitur pemindaian?'),
              _buildParagraph('2. Saya mengalami masalah dengan fitur pemindaian, bagaimana cara memperbaikinya?'),
              _buildParagraph('3. Apakah ada panduan lengkap untuk fitur pemindaian?'),
              SizedBox(height: 20.0), // Menambahkan jarak antara bagian
              _buildSectionTitle('Masalah Umum'),
              _buildParagraph('1. Aplikasi crash saat dibuka, apa yang harus saya lakukan?'),
              _buildParagraph('2. Saya lupa kata sandi akun saya, bagaimana cara mengatur ulang?'),
              _buildParagraph('3. Bagaimana cara memperbarui aplikasi ke versi terbaru?'),
              SizedBox(height: 20.0), // Menambahkan jarak antara bagian
              _buildSectionTitle('Dukungan Tambahan'),
              _buildParagraph('1. Hubungi kami melalui WhatsApp'),
              SizedBox(height: 8.0),
              _buildWhatsAppButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.0), // Mengurangi jarak bawah
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: Color(0xFF2E8B57), // Sesuaikan dengan warna pada bagian profil
        ),
      ),
    );
  }

  Widget _buildParagraph(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.0), // Mengurangi jarak bawah
      child: Text(
        text,
        style: TextStyle(fontSize: 16.0),
        textAlign: TextAlign.justify,
      ),
    );
  }

  Widget _buildWhatsAppButton() {
    return ElevatedButton(
      onPressed: () {
        _launchWhatsApp();
      },
      child: Text('Hubungi via WhatsApp'),
      style: ElevatedButton.styleFrom(
        primary: Color(0xFF2E8B57), // Sesuaikan dengan warna pada bagian profil
        onPrimary: Colors.white, // Sesuaikan dengan warna pada bagian profil
        elevation: 3, // Tambahkan bayangan tombol
      ),
    );
  }

  void _launchWhatsApp() async {
    String phoneNumber = '+6285843511074'; // Ganti dengan nomor WhatsApp Anda
    String message = 'Halo, saya butuh bantuan.'; // Ganti dengan pesan yang ingin Anda kirim
    String url = 'https://wa.me/$phoneNumber?text=${Uri.parse(message)}';

    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Tidak dapat membuka WhatsApp';
    }
  }
}
