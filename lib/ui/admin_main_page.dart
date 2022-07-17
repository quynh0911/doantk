import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../const/colors.dart';

class AdminMainPage extends StatefulWidget{
  @override
  _AdminMainPageState createState() {
   return _AdminMainPageState();
  }

}
class _AdminMainPageState extends State<AdminMainPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.blue,
        centerTitle: true,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: const Text(
          "Quản lý tài khoản",
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }

}