import 'package:flutter/material.dart';
import 'package:test_coba/detail_obat/detail_obat.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ObatPage extends StatelessWidget {

  static const String firebaseStorageBaseUrl = 'https://firebasestorage.googleapis.com/v0/b/tanidoc.appspot.com/o/obat%2F';

  final List<Map<String, dynamic>> obatlist = [
  {
  'nama': 'Agent 50 SC',
  'gambar': '${firebaseStorageBaseUrl}Agent%2050%20SC.png?alt=media&token=a319dd0a-8c64-404c-b8d4-fc3180a763fb',
  'deskripsi': 'Agent 50 SC merupakan insektisida sistemik berdaya racun kontak dan lambung , mampu mengendalikan hama penggerek batang hama penggulung daun dan walang sangit serta mempunyai efek zpt yang membantu proses pertumbuhan tanaman sehingga mampu berproduksi optimal. Agent merupakan insektisida generasi baru yang mampu mengendalikan hama yang sudah kebal oleh produk lain',
 },
    {
      'nama': 'Siklon 5.7 WG',
      'gambar': '${firebaseStorageBaseUrl}Siklon%205.7%20WG.png?alt=media&token=e17176e6-22de-41d5-8e01-17ca0b2773e1',
      'deskripsi': 'Siklon 5.7 WG adalah insektisida translaminar berbentuk granule dengan bahan aktif . emamektin benzoate 5.7%, ampuh dalam mengendalikan hama ulat pada tanaman Bawang Merah dan Cabai',
    },
    {
      'nama': 'Envoy 80 Wp',
      'gambar': '${firebaseStorageBaseUrl}envoy%2080%20WP.jpg?alt=media&token=4891946a-0d4f-421c-a278-6392bf8b855c',
      'deskripsi': 'Envoy 80 Wp merupakan fungisida sistematik dengan dua bahan aktif mencozeb dan trisiklazol, sangat ampuh mengendalika blast daun dan potong leher pada tanaman padi . Mengandung unsur Mn dan Zn. memiliki efek fito : tonik yang menjadikan daun lebih hijau dan sehat menjadikan tanaman dapat melakukan proses fotosintesis secara maksimal serta mempercepat pemulihan akibat serangan penyakit',
    },
    {
      'nama': 'Wuz 200/125 SC',
      'gambar': '${firebaseStorageBaseUrl}Wuz200.png?alt=media&token=790cc881-0959-45e2-ad16-87512cdcb208',
      'deskripsi': 'adalah fungisida majemuk yang bekerja secara sistematik dengan bahan aktif Azoksistrobin 200 g/l dan Difenokonazol 125 g/l. Terbukti ampuh mengendalikan  penyakit utama ditanaman padi sekaligus peningkatan performa utama di tanaman padi sekaligus peningkatan peforma dan hasil panen',
    },
    {
      'nama': 'Sinergy 300 EC',
      'gambar': '${firebaseStorageBaseUrl}synergy300ec.jpeg?alt=media&token=e8ec9023-04b7-4803-9e72-33e0fc2c73fa',
      'deskripsi': 'Sinergy 300 EC adalah fungisida sistemik kombinasi 2 bahan aktif difenokonazol dan profikonozol, kendalikan penyakit tanaman sehat , hijau segar, tumbuh serempak dan memperbanyak anakan, sehingga memaksimalkan proses fotosintesis dalam pembentukan umbi/buah untuk meningkatkan hasil panen',
    },
    {
      'nama': 'Kuproxat 345 SC',
      'gambar': '${firebaseStorageBaseUrl}kuproxat01.png?alt=media&token=14c112b9-e391-4d09-8529-c96177e914b4',
      'deskripsi': 'Kuproxat merupakan satu-satunya , fungisida sekaligus bakterisida tembaga dakan bentuk cair dengan ukuran partikel yang sangat kecil melindungi tanaman dari serangan busuk buah dalam jangka waktu lama',
    },
    {
      'nama': 'Booster 250 EC',
      'gambar': '${firebaseStorageBaseUrl}booster-250ml-botol-hijau.png?alt=media&token=c3b55034-9110-4614-b808-a7c3ad86c5ba',
      'deskripsi': 'Booster 250 EC merupakan fungisida dengan bahan aktif difenokonazol, efektif dalam mengendalikan bercak pelepah , busuk batang dan bercak daun padi . aplikasi booster pada umur 45 dan 65 HST menjadikan batang kokoh dan daun sehat penfisian gabah padi menjadi lebih bernas, produksi beras kepala dan randemen beras giling meningkat.',
    },
    {
      'nama': 'Serendy 28 WP',
      'gambar': '${firebaseStorageBaseUrl}serendy%2028%20wp.jpg?alt=media&token=ebdd07cc-9021-45bf-800e-a68c37fa867a',
      'deskripsi': 'Serendy 28 WP adalah herbisida sistemik pra dan purna tumbuh berbentuk tepung yang larut dalam air , berwarna putih untuk mengendalikan gulma daun lebar , gulma daun sempid dan teki pada tanaman padi',
    },
    {
      'nama': 'Lugen 100 Ec',
      'gambar': '${firebaseStorageBaseUrl}lugen100ec.png?alt=media&token=21c5f844-0152-465d-9b3d-a10f5219c089',
      'deskripsi': 'Lugen 100 EC merupakan insektisida erbahan altif buprofezin 100 g/l yang sangat efektif mengendalikan wereng pada tanaman padi , dengan cara menghambat pergantian kulit. Lugen juga memiliki efek ovicidal yang menghambat penetasan telur . Lugen Efektif mengendalikan wareng yang sudah kebal dengan produk berbahan aktif lain sehingga sangat cocok untuk pengendalian hama terpadu dalam mencegah peledakan hama',
    },
    {
      'nama': 'Lindamin 865 SL',
      'gambar': '${firebaseStorageBaseUrl}lindamin865sl.jpg?alt=media&token=400194e5-e987-4066-8487-3cce0fb4b48f',
      'deskripsi': 'Lindamin diproduksi oleh produsen 2.4-D terbesar dan terbaik didunia, memiliki kandungan phenol terendah sehingga aman bagu pengguna dan tanaman utama. Lindomin tidak membentuk kristal pada kemasan , dan bisa digunakan dengan berbagai kondisi air dilapangan dengan kinerja yang tetap optimal . Handal dalam mengendalikan gulma berdaun lebar dan teki-tekian.',
    },
    {
      'nama': 'Nugrass 69 EC',
      'gambar': '${firebaseStorageBaseUrl}nugrass69ec.png?alt=media&token=4113ee9b-7dce-487c-803a-1238f845840e',
      'deskripsi': 'Nugrass merupakan herbisida sistemik purna tumbuh yang sangat tangguh dalam mengendalikan gulma golongan timunan sampai tuntas. Dengan menggunakan nugrass petani tidak perlu menyiangi sehingga biaya kerja bisa ditekan dan padi dapat berproduksi optimal',
    },
    {
      'nama': 'Oblivian 300 SC',
      'gambar': '${firebaseStorageBaseUrl}oblivion-250ml-2.png?alt=media&token=6dedceb8-1301-4619-ad63-dca45d6a523d',
      'deskripsi': 'Oblivian 300 SC adalah insektisida translaminar dengan 2 bahan aktif. klorfenapir 180 g/l + indosakarb 120 g/l, racun kontak dan lambung untuk mengendalikan hama penggerak batang padi dan ulat grayak pada tanaman merah',
    },
    {
      'nama': 'Kleenup',
      'gambar': '${firebaseStorageBaseUrl}kleenup.jpg?alt=media&token=64658d88-ce7b-48c5-803d-9420503c7b60',
      'deskripsi': 'Kleenup 480 SL adalah herbisida sistemik dengan bahan aktif glisofat diproduksi menggunakan glisofat dari surfaktan khusus standar kualitas dunia. Terbukti efektif mengendalikan gulma sampai akar nya. Fleksibel digunakan pada pasang surut maupun lahan mineral. serta memiliki pita piktogram hijau lebih ramah lingkungan dan aman bagi pengguna',
    },
    {
      'nama': 'Rhodiamine 865 SL',
      'gambar': '${firebaseStorageBaseUrl}rhodiamine%20865%20SL.jpg?alt=media&token=6621e81b-3dcc-4f97-af37-a691af664da7',
      'deskripsi': 'Rhodiamine diproduksi oleh produsen 2,4-D terbesar dan terbaik didunia. memiliki kandungan phenol terendah sehingga aman bagi pengguna dan tanaman utama. Rhodiamine tidak membentuk kristal pada kemasan, dan bisa digunakan dengan berbagai kondisi air dilapangan dengan kinerja yang tetap optimal . Handal dalam mengendalikan gulma berdaun lebar dan teki-tekian',
    },
    {
      'nama': 'Nuquat 276 SL',
      'gambar': '${firebaseStorageBaseUrl}nuquat-20-lt.png?alt=media&token=a93cc11d-8747-4d55-ab91-ee0e3bbfcd69',
      'deskripsi': 'Nuquat 276 Sl merupakan herbisida purna tumbuh yang bersifat kontak , berbentuk larutan dalam air untuk mengendalikan pakis, gulma berdaun lebar dan berdaun sempit . Formulasi Nuquat 276 SL mengandung 3 bahan pengaman yaitu pembau , pemuntah dan pewarna',
    },
    {
      'nama': 'Surpass 200 EC',
      'gambar': '${firebaseStorageBaseUrl}surpass.jpg?alt=media&token=f991e1d5-cd50-415a-98ee-f6c36a9f81b0',
      'deskripsi': 'Surpass 200 EC merupakan herbisida sistemik purna tumbuh berbentuk pekatan yang dapat diemuisikan. Handal mengendalikan gulma berdaun sempit dan tidak menimbulkan fitotoksik pada tanaman utama',
    },
    {
      'nama': 'Speedub 480 SL',
      'gambar': '${firebaseStorageBaseUrl}Speedup.png?alt=media&token=b88748ac-6f30-4b3f-ad9e-df1454aea045',
      'deskripsi': 'Speedup 480 SL merupakan herbisida purna tumbuh yang diformulasi dalam bentuk mengendalikan gulma berdaun sempit , berdaun lebar dan teki-tekian. Speedup 480 SL memiliki spektrum yang luas dan termasuk herbisida yang bersifat non selektif',
    },
    {
      'nama': 'Katana 200 SC',
      'gambar': '${firebaseStorageBaseUrl}katana.jpg?alt=media&token=b7e85de5-a0b0-4e16-a086-3ff14fcd8147',
      'deskripsi': 'Katana 200 SC merupakan insektisida generasi terbaru berbahan aktif flubendiamind untuk mengendalikan hama penggerek batang dan penggulung daun/hama putih palsu pada tanaman padi . Sangat efektif terhadap serangga resistem dan aman terhadap musuh alami sehingga cocok untuk pengendalian hama terpadu',
    },
    {
      'nama': 'Starner 20 WP',
      'gambar': '${firebaseStorageBaseUrl}starner20wp.png?alt=media&token=e77f698c-02bb-4a2a-9f71-df784348b19d',
      'deskripsi': 'Starner 20 WP satu-satunya berterisida yang bekerja secara sistemik dengan bahan aktif, asam oksolinik 20% untuk menghambat dan mengendalikan penyakit layu bakteri pada kentang dan tomat, busuk lunak pada kubis serta penyakit busuk pada gabah dan tanaman padi',
    },
    {
      'nama': 'GibGro Panen 20 SP',
      'gambar': '${firebaseStorageBaseUrl}gibgro.jpg?alt=media&token=8d5bc7db-b4bf-4808-91ba-19e9285b97cb',
      'deskripsi': 'Gibgro panen merupakan zat pengatur tumbuh , dengan kandungan asam giberalat (GA3) terbaik dalam formulasi 20% yang paling sesuai untuk tanaman padi dan terbukti mampu meningkatkan panjang malai dan jumlah gabah per malai, meningkatkan hasil ubinan pada kondisi basah dan kering juga meningkatkan hasil per Ha, Gibgro 10 SP dan Gibgro panen merupakan satu paket produk untuk satu musim yang memberikan jaminan peningkatan hasil panen padi ',
    },
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Produk Obat'),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: obatlist.length,
        itemBuilder: (ctx, index) {
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
                        obatlist[index]['gambar'],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8),
                    color: Colors.white,
                    child: Text(
                      obatlist[index]['nama'],
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
