import 'package:do_an_tk/ui/login.dart';
import 'package:do_an_tk/ui/my_home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../const/colors.dart';

class RegisterPage extends StatefulWidget{
  @override
  _RegisterPageState createState() {
    return _RegisterPageState();
  }

}
class _RegisterPageState extends State<StatefulWidget>{
  TextEditingController loginController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController numberRoomController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blue,
        centerTitle: true,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text(
          "Đăng ký",
          style: TextStyle(fontSize: 20),
        ),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            children: [
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
                      labelText: "Nhắc lại mật khẩu",
                      labelStyle: TextStyle(color: AppColors.blue),
                      focusColor: AppColors.blue,
                      icon: Icon(
                        Icons.vpn_key,
                        color: AppColors.blue,
                        size: 30,
                      ),
                      fillColor: AppColors.blue,
                      contentPadding: EdgeInsets.all(8)),
                  controller: confirmPasswordController,
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
                      labelText: "Số phòng",
                      labelStyle: TextStyle(color: AppColors.blue),
                      focusColor: AppColors.blue,
                      icon: Icon(
                        Icons.vpn_key,
                        color: AppColors.blue,
                        size: 30,
                      ),
                      fillColor: AppColors.blue,
                      contentPadding: EdgeInsets.all(8)),
                  controller: numberRoomController,
                ),
              ),
              Center(
                child: OutlinedButton(
                  child: const Text(
                    "Đăng ký",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: AppColors.blue,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                  ),
                  onPressed: () {
                    //route
                    Navigator.push(context, MaterialPageRoute(builder: (_)=> const LoginScreen()));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  static Future<User?> registerUsingEmailPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = userCredential.user;
      await user!.updateProfile(displayName: name);
      await user.reload();
      user = auth.currentUser;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
    return user;
  }
}