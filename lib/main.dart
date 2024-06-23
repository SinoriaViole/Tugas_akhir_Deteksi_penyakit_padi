import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:test_coba/user_auth/firebase_auth_services.dart';
import 'firebase_options.dart';
import 'package:test_coba/login.dart';
import 'package:test_coba/singup.dart';
import 'package:test_coba/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ); // Inisialisasi Firebase

  FirebaseAuthService _authService = FirebaseAuthService();
  bool isLoggedIn = await _authService.isLoggedIn();

  runApp(MyApp(isLoggedIn: isLoggedIn)); // Mengirimkan status login ke MyApp
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({Key? key, required this.isLoggedIn}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: isLoggedIn ? HomePage() : BeginPage(), // Mengarahkan ke HomePage jika sudah login
    );
  }
}

class BeginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text(
                    "Selamat Datang",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Semoga aplikasi kami memberikan manfaat dan kesenangan bagi Anda.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.grey[700],
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
              Container(
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/welcome1.png"),
                  ),
                ),
              ),
              Column(
                children: <Widget>[
                  // Tombol login
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 50,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "Login",
                      style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                    ),
                  ),
                  // Tombol sign up
                  SizedBox(height: 10),
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 50,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUpPage()),
                      );
                    },
                    color: Color(0xFF2E8B57),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 18),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
