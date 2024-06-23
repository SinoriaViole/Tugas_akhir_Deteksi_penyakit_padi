import 'package:flutter/material.dart';

class TermsPage extends StatelessWidget {
  const TermsPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Syarat dan Ketentuan Penggunaan',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0), // Mengurangi jarak dari judul utama
              _buildParagraph('1. Anda setuju untuk menggunakan aplikasi ini hanya untuk tujuan yang sah dan sesuai dengan hukum yang berlaku.'),
              _buildParagraph('2. Anda bertanggung jawab atas semua aktivitas yang terjadi di akun Anda dan Anda setuju untuk menjaga kerahasiaan kata sandi Anda.'),
              _buildParagraph('3. Kami berhak untuk mengubah atau menghapus bagian mana pun dari syarat dan ketentuan ini tanpa pemberitahuan sebelumnya.'),
              _buildParagraph('4. Dengan menggunakan aplikasi ini, Anda menyetujui kebijakan privasi kami yang dapat ditemukan di halaman Kebijakan Privasi kami.'),
              _buildParagraph('5. Kami berhak untuk menangguhkan atau mengakhiri akses Anda ke aplikasi ini jika kami mendeteksi pelanggaran terhadap syarat dan ketentuan ini.'),
              SizedBox(height: 16.0), // Menambahkan jarak di akhir isi
              Text(
                'Harap baca syarat dan ketentuan ini dengan seksama sebelum menggunakan aplikasi kami. Dengan menggunakan aplikasi ini, Anda menyetujui semua syarat dan ketentuan yang tercantum di atas.',
                style: TextStyle(fontSize: 16.0),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildParagraph(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.0), // Mengurangi jarak vertikal
      child: Text(
        text,
        style: TextStyle(fontSize: 16.0),
        textAlign: TextAlign.justify,
      ),
    );
  }
}
