import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<User?> signUpWithEmailAndPassword(String email, String password, String username) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(email: email, password: password);

      // Simpan username ke Firestore
      await _firestore.collection('users').doc(credential.user!.uid).set({
        'username': username,
      });

      return credential.user;
    } catch (e) {
      print("Error occurred during sign up: $e");
      // Jika pendaftaran gagal, tidak ada yang perlu dilakukan di sini karena username sudah disimpan di atas.
      return null;
    }
  }

  Future<User?> signInWithEmailAndPassword(String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      return credential.user;
    } catch (e) {
      print("Error occurred during sign in: $e");
      return null;
    }
  }

  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print("Error occured while sending reset password email: $e");
      throw e;
    }
  }

  // Method to check if user is logged in
  bool isLoggedIn() {
    User? user = _auth.currentUser;
    return user != null;
  }

  //metode untuk logout pengguna
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print("Error gagal untuk melalukan logout");
    }
  }
}
