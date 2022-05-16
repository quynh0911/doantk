import 'package:do_an_tk/const/colors.dart';
import 'package:flutter/material.dart';

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
                  onPressed: () {
                    //route
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
