import 'package:flutter/material.dart';

class DetailPenyakitPage extends StatelessWidget {
  final String nama;
  final String gambar;
  final String deskripsi;
  final String gejala;
  final String pengobatan;

  DetailPenyakitPage({
    required this.nama,
    required this.gambar,
    required this.deskripsi,
    required this.gejala,
    required this.pengobatan,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(nama),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      gambar,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 20),
                  Divider(),
                  SizedBox(height: 10),
                  Text(
                    'Deskripsi:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    deskripsi,
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  Divider(),
                  SizedBox(height: 10),
                  Text(
                    'Gejala:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    gejala,
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  Divider(),
                  SizedBox(height: 10),
                  Text(
                    'Pengobatan:',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    pengobatan,
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
