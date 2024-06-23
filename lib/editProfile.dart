import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditProfilePage extends StatefulWidget {
  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController _usernameController = TextEditingController();
  File? _image;
  final ImagePicker _imagePicker = ImagePicker();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void _saveChanges() async {
    String newUsername = _usernameController.text;

    try {
      // Ambil UID pengguna yang sedang masuk
      String uid = _auth.currentUser!.uid;

      // Perbarui username pengguna dalam Firestore
      await _firestore.collection('users').doc(uid).update({
        'username': newUsername,
      });

      // Jika ada gambar yang dipilih, upload ke Firebase Storage dan dapatkan URL-nya
      if (_image != null) {
        String imageUrl = await _uploadImage(_image!);

        // Simpan URL gambar di Firestore
        await _firestore.collection('users').doc(uid).update({
          'profileImageUrl': imageUrl,
        });

        print('Image URL: $imageUrl');
      }

      // Tampilkan pesan sukses
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Sukses'),
            content: Text('Perubahan berhasil disimpan.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    } catch (e) {
      // Tangani kesalahan saat menyimpan perubahan
      print('Error: $e');
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Gagal'),
            content: Text('Gagal menyimpan perubahan. Silakan coba lagi.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  Future<String> _uploadImage(File imageFile) async {
    String imageName = DateTime.now().millisecondsSinceEpoch.toString();
    Reference reference = FirebaseStorage.instance.ref().child('profile_images/$imageName');
    UploadTask uploadTask = reference.putFile(imageFile);
    TaskSnapshot storageTaskSnapshot = await uploadTask;
    return storageTaskSnapshot.ref.getDownloadURL();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profil'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CircleAvatar(
              radius: 60.0,
              backgroundImage: _image != null
                  ? FileImage(_image!)
                  : Image.asset('assets/petani.jpg').image, // Ubah AssetImage menjadi Image.asset
            ),
            SizedBox(height: 20.0),
            TextButton(
              onPressed: () async {
                final pickedFile = await _imagePicker.getImage(source: ImageSource.gallery);
                if (pickedFile != null) {
                  setState(() {
                    _image = File(pickedFile.path);
                  });
                }
              },
              child: Text(
                'Pilih Foto Profil',
                style: TextStyle(color: Color(0xFF2E8B57)),
              ),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: _usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: _saveChanges,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF2E8B57)),
              ),
              child: Text(
                'Simpan Perubahan',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
