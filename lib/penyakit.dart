import 'package:flutter/material.dart';
import 'package:test_coba/detail_penyakit/detail_penyakit.dart';
import 'package:firebase_storage/firebase_storage.dart';

class PenyakitPage extends StatelessWidget {
  //Membuat konstanta untuk menyimpan URL
  static const String firebaseStorageBaseUrl = 'https://firebasestorage.googleapis.com/v0/b/tanidoc.appspot.com/o/Penyakit%2F';

  // List penyakit beserta gambarnya
  final List<Map<String, dynamic>> penyakitList = [
    {
      'nama': 'Brown Spot',
      'gambar': '${firebaseStorageBaseUrl}dauncoklat.jpg?alt=media&token=6f9442cc-bfb9-41fc-938b-6b8f83cb0b16',
    },
    {
      'nama': 'Blast',
      'gambar': '${firebaseStorageBaseUrl}blast.jpg?alt=media&token=dc20aa2b-e83d-41c5-b23c-3e37e14634cb',
    },
    {
      'nama': 'Bacterial leaf Blight',
      'gambar': '${firebaseStorageBaseUrl}blf.jpg?alt=media&token=7066ae4d-a1a8-4fc7-a343-002252ed7691',
    },
    {
      'nama': 'Tungro',
      'gambar': '${firebaseStorageBaseUrl}tungro.jpeg?alt=media&token=492dc76b-1b21-46da-b92d-da366e905df0',
    },
    {
      'nama': 'Kerdil Kuning',
      'gambar': '${firebaseStorageBaseUrl}kerdil.jpg?alt=media&token=38e80c51-ce67-4b0a-88b4-b961b51962f4',
    },
    {
      'nama': 'Kubang',
      'gambar': '${firebaseStorageBaseUrl}dauncoklat.jpg?alt=media&token=6f9442cc-bfb9-41fc-938b-6b8f83cb0b16',
    },
    {
      'nama': 'Bulai',
      'gambar': '${firebaseStorageBaseUrl}dauncoklat.jpg?alt=media&token=6f9442cc-bfb9-41fc-938b-6b8f83cb0b16',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Penyakit Padi'),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 kolom dalam grid
          crossAxisSpacing: 10, // Jarak antar kolom
          mainAxisSpacing: 10, // Jarak antar baris
        ),
        itemCount: penyakitList.length,
        itemBuilder: (ctx, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPenyakitPage(
                    nama: penyakitList[index]['nama'],
                    gambar: penyakitList[index]['gambar'],
                  ),
                ),
              );
            },
            child: Card(
              elevation: 5,
              child: Column(
                children: [
                  // Gambar penyakit
                  Image.network(
                    penyakitList[index]['gambar'],
                    height: 100,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  // Nama penyakit
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      penyakitList[index]['nama'],
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
