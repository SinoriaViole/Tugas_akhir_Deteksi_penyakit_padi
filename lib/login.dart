import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_coba/singup.dart';
import 'package:test_coba/home.dart';
import 'package:test_coba/user_auth/firebase_auth_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {
  final FirebaseAuthService _authService = FirebaseAuthService();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Container(
        height: MediaQuery
            .of(context)
            .size
            .height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          "Login",
                          style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Silahkan Login Terlebih Dahulu!",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        inputFile(Label: "Email", controller: emailController),
                        inputFile(Label: "Password",
                            obscureText: true,
                            controller: passwordController)
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        TextButton(
                          onPressed: () {
                            _showForgotPasswordDialog(context);
                          },
                          child: Text("Lupa Password?",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        Container(
                          height: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xFF2E8B57),
                          ),
                          child: MaterialButton(
                            onPressed: () async {
                              String email = emailController.text.trim();
                              String password = passwordController.text.trim();
                              User? user = await _authService
                                  .signInWithEmailAndPassword(email, password);
                              if (user != null) {
                                // Simpan informasi login ke penyimpanan lokal
                                await saveLoginInfo(user.uid);
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(
                                        builder: (context) => HomePage()));
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                          'Login gagal. Silahkan coba kembali.'),
                                    ));
                              }
                            },
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              "Login",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Tidak Memiliki akun?"),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => SignUpPage()),
                            );
                          },
                          child: Text(" Daftar",
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 18,
                            ),
                          ),
                        )
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 100),
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/login.png"),
                            fit: BoxFit.fitHeight
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget inputFile(
      {Label, obscureText = false, TextEditingController? controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          Label,
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: Colors.black87,
          ),
        ),
        SizedBox(
          height: 5,
        ),
        TextField(
          controller: controller,
          obscureText: obscureText,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
          ),
        ),
        SizedBox(height: 10,)
      ],
    );
  }

  void _showForgotPasswordDialog(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    showDialog(context: context, builder: (BuildContext context) {
      return AlertDialog(
        title: Text("Lupa Password"),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text("Masukkan alamat email anda untuk mereset password."),
            SizedBox(height: 20),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: "Email",
              ),
            )
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("Batal"),
          ),
          TextButton(
            onPressed: () {
              String email = emailController.text.trim();
              _resetPassword(context, email);
            },
            child: Text("Kirim"),
          ),
        ],
      );
    },
    );
  }

  void _resetPassword(BuildContext context, String email) async {
    if (email.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Masukkan alamat email.'),
      ));
      return;
    }

    try {
      await _authService.resetPassword(email);
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Email untuk mereset password telah dikirim.'),
      ));
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
            'Gagal mengirim email untuk mereset password. Silahkan coba kembali.'),
      ));
    }
  }

  // Fungsi untuk menyimpan informasi login ke penyimpanan lokal
  Future<void> saveLoginInfo(String userId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userId', userId);

    // Verifikasi bahwa informasi login telah tersimpan
    String? storedUserId = prefs.getString('userId');
    if (storedUserId == userId) {
      print('Informasi login berhasil disimpan: $userId');
    } else {
      print('Gagal menyimpan informasi login.');
    }
  }
}
