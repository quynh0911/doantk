import 'package:do_an_tk/api/auth.dart';
import 'package:do_an_tk/const/colors.dart';
import 'package:do_an_tk/ui/register.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'my_home_page.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController loginController = TextEditingController();
  TextEditingController passController = TextEditingController();
  AuthApi dio = AuthApi();
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blue,
        centerTitle: true,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text(
          "Smart building",
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 30),
              Center(
                child: Image.asset("assets/images.png"),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.blue),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.blue),
                      ),
                      counterStyle: TextStyle(color: AppColors.blue),
                      labelText: "Login",
                      labelStyle: TextStyle(color: AppColors.blue),
                      focusColor: AppColors.blue,
                      icon: Icon(
                        Icons.person,
                        color: AppColors.blue,
                        size: 30,
                      ),
                      fillColor: AppColors.blue,
                      contentPadding: EdgeInsets.all(8)),
                  controller: loginController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  decoration: const InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.blue),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.blue),
                      ),
                      counterStyle: TextStyle(color: AppColors.blue),
                      labelText: "Password",
                      labelStyle: TextStyle(color: AppColors.blue),
                      focusColor: AppColors.blue,
                      icon: Icon(
                        Icons.vpn_key,
                        color: AppColors.blue,
                        size: 30,
                      ),
                      fillColor: AppColors.blue,
                      contentPadding: EdgeInsets.all(8)),
                  controller: passController,
                ),
              ),
              const SizedBox(height: 15),
              Center(
                child: InkWell(
                  child: const Text(
                    'Ch??a c?? t??i kho???n? Ch???n ????? ????ng k??',
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: AppColors.blue,
                        decoration: TextDecoration.underline),
                  ),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => RegisterPage()));
                  },
                ),
              ),
              const SizedBox(height: 15),
              Center(
                child: OutlinedButton(
                  child: const Text(
                    "Login",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: AppColors.blue,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                  ),
                  onPressed: () async {
                    await Firebase.initializeApp();
                    //route
                    try {
                      print(loginController.text);
                      print(passController.text);
                      var response = await _auth
                          .signInWithEmailAndPassword(
                              email: loginController.text,
                              password: passController.text);
                      // var response = await dio.signIn(loginController.text, passController.text);
                      if (response != null) {
                        print(response);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const MyHomePage()));
                      }
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'user-not-found') {
                        print('No user found for that email.');
                      } else if (e.code == 'wrong-password') {
                        print('Wrong password provided for that user.');
                      }
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
