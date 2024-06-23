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
      'gambar': '${firebaseStorageBaseUrl}Brown_spot.jpg?alt=media&token=0b00ee1c-ea04-4e27-8bf8-3fede1b11e21',
      'deskripsi': 'Brown Spot adalah salah satu penyakit yang umum ditemukan pada tanaman padi. Penyakit ini disebabkan oleh jamur Bipolaris oryzae yang menyerang daun tanaman padi. Gejala awalnya adalah munculnya bercak coklat pada daun tanaman, yang kemudian berkembang menjadi bercak dengan tepi berwarna gelap. Infeksi yang parah dapat menyebabkan daun mengering dan rontok, yang dapat mengurangi hasil panen. Pengendalian penyakit ini dapat dilakukan dengan penerapan praktik budidaya yang baik, seperti rotasi tanaman, penggunaan varietas yang tahan penyakit, dan penggunaan fungisida jika diperlukan.',
      'gejala' : '1. Penampakan Bercak Pada Daun: Daun tanaman padi terlihat memiliki bercak coklat atau hitam yang teratur, biasanya berbentuk bulat atau oval.\n2. Ukuran Bercak Memperluas: Seiring waktu, bercak pada daun dapat memperluas dan menyatu dengan bercak lainnya, membentuk area yang lebih besar.\n3. Daun Menguning dan Mengering: Daun yang terinfeksi cenderung menguning dan kemudian mengering, terutama di sekitar bercak-buruk.\n4. Penurunan Produksi Tanaman: Tanaman padi yang terinfeksi Brown Spot dapat mengalami penurunan pertumbuhan dan produksi hasil akhir yang rendah.\n5. Pengaruh pada Daun Muda: Daun muda yang terinfeksi dapat menunjukkan gejala lebih dini, dengan bercak yang lebih kecil dan lebih terkonsentrasi di bagian atas daun.\n6. Peningkatan Penyebaran saat Kondisi Basah: Gejala Brown Spot cenderung lebih sering muncul dan menyebar lebih luas ketika kondisi lingkungan lebih basah.\n7. Kerusakan pada Beras: Tanaman yang terinfeksi Brown Spot mungkin menghasilkan beras yang lebih rendah kualitasnya, dengan kandungan pati yang lebih rendah dan kualitas yang buruk.\n8. Penurunan Kesehatan Tanaman secara Keseluruhan: Selain gejala spesifik pada daun, tanaman padi yang terinfeksi Brown Spot mungkin terlihat kurang sehat secara keseluruhan, dengan pertumbuhan yang terhambat dan penampilan yang tidak sehat.',
      'pengobatan' : 'Praktek sanitasi lahan seperti membersihkan gulma dan sisa-sisa tanaman dari lahan sawah, menjadi langkah awal yang penting dalam menjaga kebersihan dan kesehatan tanaman padi. Selain itu, pemilihan varietas padi yang tahan terhadap penyakit brown spot juga sangat diperlukan untuk mengurangi risiko infeksi yang dapat merugikan hasil panen. Selanjutnya, penggunaan fungisida yang direkomendasikan oleh ahli tanaman padi menjadi langkah preventif lainnya dalam melindungi tanaman dari serangan penyakit. Tak kalah pentingnya, pemberian pupuk yang tepat juga dapat meningkatkan daya tahan tanaman terhadap berbagai penyakit, sehingga menjaga produktivitas dan kualitas panen secara keseluruhan. Dengan kombinasi praktek sanitasi, pemilihan varietas yang tepat, penggunaan pestisida yang bijaksana, dan manajemen pupuk yang baik, dapat meningkatkan keselamatan dan hasil produksi tanaman padi secara signifikan.',
    },
    {
      'nama': 'Blast',
      'gambar': '${firebaseStorageBaseUrl}Blast.jpg?alt=media&token=268fc4a4-4d83-4f42-afec-08bdcfe7e51b',
      'deskripsi': 'Penyakit Blast merupakan salah satu penyakit yang sering menyerang tanaman padi dan dapat menyebabkan kerugian yang signifikan dalam produksi padi. Penyakit ini disebabkan oleh jamur Pyricularia oryzae yang menyerang bagian-bagian tanaman seperti daun, batang, malai, dan bahkan bulir padi. Gejalanya termasuk adanya bercak berwarna coklat pada daun yang kemudian berkembang menjadi lesi berbentuk oval atau bulat dengan tepi yang berwarna gelap. Lesi ini dapat menyebar ke bagian lain dari tanaman dan menyebabkan penurunan hasil panen yang signifikan. Pengendalian penyakit ini dapat dilakukan dengan penggunaan varietas padi tahan blast, penggunaan fungisida secara preventif, dan praktik manajemen tanaman yang baik seperti rotasi tanaman dan sanitasi lapangan."',
      'gejala': '1. Bercak Daun: Daun tanaman padi terinfeksi Blast akan menunjukkan bercak-bercak kecil berwarna coklat yang kemudian berkembang menjadi lesi yang lebih besar dengan tepi yang gelap.\n2. Lesi Oval atau Bulat: Lesi yang terbentuk pada daun umumnya memiliki bentuk oval atau bulat dengan warna yang bervariasi dari coklat hingga hitam.\n3. Lesi pada Batang: Selain menyerang daun, Blast juga dapat menimbulkan lesi pada batang tanaman padi. Lesi pada batang ini biasanya berwarna coklat kehitaman dan dapat menyebabkan kelemahan struktur batang.\n4. Infeksi pada Malai: Pada kasus yang parah, Blast juga dapat menyerang malai tanaman padi. Infeksi pada malai dapat menyebabkan kerusakan pada bulir-bulir padi yang belum matang, sehingga mengurangi hasil panen secara signifikan.\n5. Penurunan Hasil Panen: Jika tidak dikendalikan dengan tepat, infeksi Blast dapat menyebabkan penurunan hasil panen yang signifikan bahkan hingga mencapai kerugian total pada produksi padi.',
      'pengobatan': '"Pengobatan penyakit Blast pada tanaman padi dapat dilakukan dengan berbagai cara, termasuk penggunaan varietas padi yang tahan terhadap serangan Blast, penerapan fungisida secara preventif, dan praktik manajemen tanaman yang baik. Penggunaan varietas padi yang tahan terhadap Blast adalah langkah paling efektif untuk mencegah penyakit ini menyerang tanaman padi. Selain itu, penggunaan fungisida secara preventif juga dapat membantu mengurangi risiko infeksi Blast. Praktik manajemen tanaman seperti rotasi tanaman dan sanitasi lapangan juga penting untuk mengendalikan penyebaran Blast di area pertanaman.',
    },
    {
      'nama': 'Bacterial leaf Blight',
      'gambar': '${firebaseStorageBaseUrl}BacterialLF.jpg?alt=media&token=a0eb87d2-c195-4eb2-8d4a-7cc9bee6532c',
      'deskripsi': 'Penyakit Bacterial Leaf Blight (BLB) adalah salah satu penyakit yang umum menyerang tanaman padi di berbagai wilayah. Penyakit ini disebabkan oleh bakteri patogen yang disebut Xanthomonas oryzae pv. oryzae (Xoo). BLB biasanya muncul pada fase vegetatif tanaman padi, terutama pada fase berdaun tiga hingga tujuh. Gejalanya termasuk adanya bercak-bercak air di daun yang kemudian berkembang menjadi lesi berbentuk panjang dan berwarna coklat dengan tepi yang terangkat. Penyakit ini dapat menyebar dengan cepat melalui air hujan, angin, atau kontak langsung dengan tanaman yang terinfeksi. Tanaman padi yang terserang BLB cenderung mengalami penurunan hasil panen yang signifikan jika tidak ditangani dengan tepat. Oleh karena itu, pengendalian penyakit ini sangat penting melalui penggunaan varietas tahan penyakit, pengelolaan sumber air, dan praktik pertanian yang baik.',
      'gejala': '1. Bercak Air pada Daun: Gejala awal BLB biasanya berupa bercak-bercak air yang muncul di permukaan daun tanaman padi. Bercak ini sering kali terlihat basah atau berair pada awal infeksi.\n2. Lesi Berwarna Coklat: Bercak air kemudian berkembang menjadi lesi berbentuk panjang dan berwarna coklat pada daun. Lesi ini dapat berukuran bervariasi, tetapi biasanya memiliki tepi yang terangkat.\n3. Perkembangan Lesi: Lesi pada daun padi dapat berkembang secara cepat, terutama jika kondisi lingkungan mendukung pertumbuhan bakteri patogen. Lesi yang telah berkembang dapat menyebabkan kerusakan yang signifikan pada daun, bahkan hingga ke bagian tangkai daun.\n4.Penurunan Hasil Panen: Tanaman padi yang terserang BLB cenderung mengalami penurunan hasil panen yang signifikan. Kerusakan pada daun dapat mengganggu proses fotosintesis dan pertumbuhan tanaman secara keseluruhan.\n5. Penyebaran Cepat: Penyakit BLB dapat menyebar dengan cepat melalui air hujan, angin, atau kontak langsung dengan tanaman yang terinfeksi. Ini dapat menyebabkan penyebaran penyakit secara luas di lahan pertanian.',
      'pengobatan': 'Pengobatan untuk penyakit Bacterial Leaf Blight (BLB) pada tanaman padi melibatkan berbagai strategi pengendalian. Salah satu pendekatan umum adalah penggunaan varietas padi yang tahan terhadap BLB. Selain itu, pengelolaan tanaman yang baik, seperti sanitasi lahan, pengelolaan irigasi yang efisien, dan pemangkasan tanaman yang terinfeksi, juga dapat membantu mengurangi risiko infeksi BLB. Pemupukan yang seimbang dan penggunaan bahan organik dapat memperkuat ketahanan tanaman terhadap penyakit. Penggunaan fungisida atau bakterisida tertentu juga dapat diterapkan untuk mengendalikan pertumbuhan bakteri patogen. Namun, penggunaan pestisida harus diimbangi dengan manajemen yang berkelanjutan dan penerapan yang tepat sesuai dengan petunjuk label. Konsultasikan dengan ahli pertanian lokal untuk mendapatkan rekomendasi pengobatan yang sesuai dengan kondisi pertanian dan lingkungan setempat.',
    },
    {
      'nama': 'Tungro',
      'gambar': '${firebaseStorageBaseUrl}tungro.jpeg?alt=media&token=492dc76b-1b21-46da-b92d-da366e905df0',
      'deskripsi': 'Penyakit Tungro pada tanaman padi disebabkan oleh virus yang ditularkan melalui serangga vektor seperti wereng hijau dan wereng cokelat. Gejalanya termasuk pertumbuhan tanaman yang lambat, daun menguning, dan pembentukan enation pada daun. Penyakit ini dapat menyebabkan kerugian hasil yang signifikan. Pengendaliannya meliputi penanaman varietas tahan, pemantauan vektor, dan praktik pertanian terintegrasi untuk mengurangi penyebaran penyakit.',
      'gejala': '1. Pertumbuhan tanaman yang terhambat: Tanaman padi yang terinfeksi Tungro cenderung tumbuh lebih lambat dari biasanya.\n2. Daun menguning: Daun tanaman padi yang terinfeksi Tungro akan berubah warna menjadi kuning dan kemudian mengering.\n3.Pembentukan enation: Penyakit Tungro sering kali menyebabkan pembentukan enation atau tonjolan kecil pada permukaan daun tanaman padi.\n4. Pembengkakan pada bagian batang: Beberapa varietas tanaman padi yang terinfeksi Tungro juga dapat menunjukkan pembengkakan pada bagian batang.\n5. Pengurangan produksi: Penyakit Tungro dapat mengakibatkan penurunan hasil panen yang signifikan jika tidak dikendalikan dengan tepat.',
      'pengobatan': ' Pengobatan penyakit Tungro pada tanaman padi dapat dilakukan dengan beberapa langkah pencegahan dan pengendalian. Salah satu pendekatan yang efektif adalah dengan melakukan pemantauan secara rutin terhadap tanaman padi dan segera mengidentifikasi gejala penyakit Tungro. Setelah terdeteksi, langkah-langkah pengendalian yang dapat dilakukan antara lain adalah penggunaan varietas padi yang tahan terhadap penyakit, penggunaan benih yang sehat, pengaturan pola tanam yang baik, dan penerapan praktik budidaya yang baik seperti pemupukan yang tepat dan pengendalian hama vektor. Selain itu, pemakaian pestisida kimia secara selektif juga dapat menjadi salah satu solusi dalam pengendalian penyakit ini, namun harus dilakukan dengan hati-hati dan sesuai dengan anjuran dosis yang dianjurkan. Penting juga untuk melakukan kerja sama dengan petani lain serta mengonsultasikan dengan ahli pertanian terkait strategi pengendalian yang optimal sesuai dengan kondisi setempat.',
    },
    {
      'nama': 'Kerdil Kuning',
      'gambar': '${firebaseStorageBaseUrl}kerdil.jpg?alt=media&token=38e80c51-ce67-4b0a-88b4-b961b51962f4',
      'deskripsi': 'Penyakit kerdil kuning pada tanaman padi adalah salah satu masalah utama yang sering dihadapi oleh para petani padi di berbagai belahan dunia. Penyakit ini disebabkan oleh infeksi virus yang menular melalui vektor serangga seperti wereng punggung putih. Tanaman padi yang terinfeksi biasanya menunjukkan gejala seperti pertumbuhan yang terhambat, daun menjadi kuning, dan pembentukan malai yang tidak normal. Kerdil kuning dapat menurunkan hasil panen secara signifikan dan menyebabkan kerugian ekonomi yang besar bagi petani. Selain itu, penyebaran penyakit ini dapat sangat cepat di daerah yang memiliki kondisi lingkungan yang cocok untuk perkembangan wereng punggung putih. Oleh karena itu, pengendalian penyakit ini melalui penerapan praktik pertanian yang baik dan penggunaan varietas padi yang tahan terhadap penyakit menjadi sangat penting untuk menjaga produktivitas dan keberlanjutan pertanian padi.',
      'gejala': '1. Pertumbuhan Terhambat: Tanaman padi yang terinfeksi kerdil kuning cenderung memiliki pertumbuhan yang terhambat. Hal ini dapat terlihat dari tinggi tanaman yang lebih pendek dibandingkan dengan tanaman yang sehat pada usia yang sama.\n2. Daun Kuning: Daun tanaman padi yang terinfeksi biasanya akan berubah warna menjadi kuning, terutama pada bagian ujung daun dan tepiannya. Warna kuning ini dapat berkembang menjadi kuning kecokelatan seiring dengan perkembangan penyakit.\n3. Pembentukan Malai yang Tidak Normal: Tanaman padi yang terinfeksi kerdil kuning seringkali menghasilkan malai yang tidak normal. Malai yang terinfeksi biasanya lebih kecil dan memiliki butir-butir padi yang tidak berkembang secara normal.\n4. Penyakit Layu: Pada tahap infeksi yang parah, tanaman padi yang terkena kerdil kuning dapat mengalami layu dan kemudian mati.\n5. Kerdil pada Batang dan Akar: Pada kasus yang parah, tanaman padi yang terinfeksi kerdil kuning dapat menunjukkan gejala kerdil pada batang dan akar, yang menghambat penyerapan nutrisi dan air.',
      'pengobatan': 'Penyakit kerdil kuning pada tanaman padi dapat diatasi dengan berbagai metode pengendalian yang efektif. Salah satu pendekatan utama adalah penerapan praktik budidaya yang baik, seperti pemilihan varietas padi yang tahan terhadap penyakit, sanitasi lahan, dan rotasi tanaman. Selain itu, penggunaan pupuk yang tepat untuk meningkatkan kesehatan tanaman dan menjaga keseimbangan nutrisi juga dapat membantu dalam mengurangi risiko infeksi penyakit. Pengendalian hama dan gulma yang efektif juga penting untuk mengurangi potensi penyebaran penyakit. Di samping itu, penggunaan pestisida dan fungisida yang sesuai dengan dosis yang direkomendasikan dapat digunakan untuk mengendalikan populasi organisme penyebab penyakit. Penting untuk berkonsultasi dengan ahli pertanian atau petani berpengalaman dalam menentukan strategi pengendalian yang tepat sesuai dengan kondisi dan skala pertanian yang dimiliki. Dengan pendekatan yang tepat dan terintegrasi, penyakit kerdil kuning pada tanaman padi dapat dikendalikan secara efektif, sehingga meminimalkan kerugian hasil panen dan menjaga produktivitas pertanian yang berkelanjutan.',
    },
    {
      'nama': 'Kubang',
      'gambar': '${firebaseStorageBaseUrl}kubang.jpg?alt=media&token=f8cd5980-2a8a-4bce-bddf-93001f8531ec',
      'deskripsi': 'Penyakit kubang pada tanaman padi disebabkan oleh jamur Pyricularia grisea dan sering muncul di fase pertumbuhan vegetatif dan berbunga. Gejalanya berupa bercak coklat-hitam pada daun, batang, dan malai padi. Penyakit ini dapat mengakibatkan gagal berbunga dan penurunan hasil panen. Pengendaliannya meliputi pemilihan varietas tahan penyakit, sanitasi lahan, dan penggunaan fungisida sesuai petunjuk teknis. Dengan tindakan pencegahan yang tepat, dampak penyakit kubang pada produksi padi dapat diminimalkan.',
      'gejala': '1. Bercak pada Daun: Daun tanaman padi akan mengalami bercak berwarna coklat atau hitam yang tersebar secara acak.\n2. Bercak pada Batang: Selain pada daun, bercak-becak coklat atau hitam juga dapat terbentuk pada batang tanaman padi.\n3. Bercak pada Malai Padi: Malai padi juga rentan terhadap serangan penyakit kubang, yang dapat dikenali dari adanya bercak-becak berwarna gelap pada malai.\n4. Penurunan Kualitas Tanaman: Infeksi yang parah dapat menyebabkan penurunan kualitas tanaman, seperti gagal berbunga atau pembentukan malai yang tidak optimal.\n5. Penurunan Hasil Panen: Jika tidak ditangani dengan tepat, penyakit kubang dapat menyebabkan penurunan hasil panen yang signifikan.',
      'pengobatan': 'Pengobatan untuk penyakit kubang pada tanaman padi dapat dilakukan dengan beberapa cara. Salah satu metode yang umum digunakan adalah penggunaan fungisida yang efektif untuk mengendalikan perkembangan penyakit. Pemilihan fungisida yang tepat dan aplikasinya sesuai dengan petunjuk yang diberikan dapat membantu mengurangi penyebaran penyakit. Selain itu, praktik budidaya yang baik seperti sanitasi lingkungan, pengelolaan sisa tanaman, dan rotasi tanaman juga dapat membantu mengurangi risiko serangan penyakit kubang. Langkah-langkah ini bersama-sama membentuk strategi pengendalian terpadu yang efektif untuk menjaga kesehatan tanaman padi dan meningkatkan hasil panen.',
    },
    {
      'nama': 'Bercak Pelapah Daun',
      'gambar': '${firebaseStorageBaseUrl}pelapah.jpg?alt=media&token=b44596aa-82a7-4a49-a864-837329f455fe',
      'deskripsi': 'Penyakit Bercak Pelapah Daun (Bacterial Sheath Brown Rot) pada tanaman padi adalah penyakit yang disebabkan oleh bakteri Pseudomonas fuscovaginae. Penyakit ini dikenal karena menimbulkan bercak-bercak cokelat pada pelapah daun padi, terutama pada bagian bawah dekat dengan tanah.',
      'gejala': '1. Timbulnya bercak-bercak berwarna cokelat pada pelapah daun, yang seringkali dikelilingi oleh tepi yang lebih gelap. \n2. Bercak ini bisa menyebar dan bergabung, sehingga membentuk area nekrotik yang lebih besar. \n3. Dalam kondisi yang parah, bercak dapat mempengaruhi seluruh pelapah daun dan menyebabkan kematian jaringan daun.',
      'pengobatan': '1. Penggunaan varietas padi yang tahan terhadap penyakit. \n2. Penerapan pola tanam yang baik dan rotasi tanaman untuk mengurangi keberadaan bakteri di lahan. \n3. Meningkatkan sirkulasi udara dengan menjaga jarak tanam yang tepat dan melakukan pengelolaan air yang baik. \n4. Penggunaan agen biokontrol atau pestisida yang tepat berdasarkan rekomendasi ahli pertanian.',
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
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
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
                    deskripsi: penyakitList[index]['deskripsi'],
                    gejala: penyakitList[index]['gejala'],
                    pengobatan: penyakitList[index]['pengobatan'],
                  ),
                ),
              );
            },
            child: Card(
              elevation: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(4),
                        topRight: Radius.circular(4),
                      ),
                      child: Image.network(
                        penyakitList[index]['gambar'],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    color: Colors.white,
                    child: Text(
                      penyakitList[index]['nama'],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
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
