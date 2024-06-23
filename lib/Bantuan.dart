import 'package:flutter/material.dart';

class PanduanPage extends StatelessWidget {
  const PanduanPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Panduan',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black, // Mengatur warna judul
          ),
        ),
        backgroundColor: Colors.white, // Mengatur warna latar belakang AppBar
        iconTheme: IconThemeData(color: Colors.black), // Mengatur warna ikon
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Colors.grey[300], // Warna latar belakang gambar
              child: Image.asset(
                'assets/banner_rice.jpg', // Gambar yang ingin ditampin
                fit: BoxFit.cover, // Membuat gambar menutupi container
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Langkah-langkah Penggunaan:',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.green[700],
                    ),
                  ),
                  SizedBox(height: 16),
                  _buildStep(
                    stepNumber: '1',
                    stepTitle: 'Pendahuluan',
                    stepDescription:
                    'Selamat datang di aplikasi Scan Padi. Aplikasi ini dapat mendeteksi penyakit pada tanaman padi. Perlu diketahui bahwa aplikasi ini hanya dapat membedakan 3 jenis penyakit: Bacterial Leaf Blight, Blast, dan Brown Spot, serta mendeteksi tanaman padi yang sehat.',
                  ),
                  _buildStep(
                    stepNumber: '2',
                    stepTitle: 'Persiapkan Perangkat dan Aplikasi',
                    stepDescription:
                    'Pastikan perangkat aplikasi Anda telah terpasang dengan aplikasi pemindaian tanaman padi.',
                  ),
                  _buildStep(
                    stepNumber: '3',
                    stepTitle: 'Pilih Mode Pemindaian',
                    stepDescription:
                    'Setelah membuka aplikasi, pilih opsi "Pemindaian" atau "Scan" dari menu utama.',
                  ),
                  _buildStep(
                    stepNumber: '4',
                    stepTitle: 'Posisikan Kamera ke Tanaman Padi',
                    stepDescription:
                    'Arahkan kamera perangkat Anda ke tanaman padi yang ingin Anda pindai atau pilih gambar melalui galeri . Perlu diketahui pencahayaan dapat mempengaruhi hasil dari deteksi ',
                  ),
                  _buildStep(
                    stepNumber: '5',
                    stepTitle: 'Lakukan Pemindaian',
                    stepDescription:
                    'Tekan tombol pemindaian di layar aplikasi untuk memulai proses pemindaian.',
                  ),
                  _buildStep(
                    stepNumber: '6',
                    stepTitle: 'Tunggu Hasil Pemindaian',
                    stepDescription:
                    'Setelah proses pemindaian selesai, tunggu sebentar hingga aplikasi menyelesaikan analisisnya.',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStep({
    required String stepNumber,
    required String stepTitle,
    required String stepDescription,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.green[700],
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    stepNumber,
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      stepTitle,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      stepDescription,
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: PanduanPage(),
  ));
}
