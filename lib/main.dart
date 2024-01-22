import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onedata_chatapp/Common%20Textstyle.dart';
import 'dart:math'as math;
import 'Common color.dart';
import 'Login.dart';

final String localUserId=math.Random().nextInt(10000).toString();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: black
      ),
      debugShowCheckedModeBanner: false,
      home: const Splashscreen(),
    );
  }
}

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {

  @override
  void initState() {
    splash();
    super.initState();
  }

  Future<void>splash()async {
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Loginscreen()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor:Colors.black,
      body: Container(
        decoration: const BoxDecoration(
            color: Colors.black
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset("Assets/logo.jpg"))),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:50.0),
                  child: FadeInLeft(child: Text("One Data ",style: splashtxt,)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:50.0),
                  child: FadeInRight(child: Text("Software Chat",style: splashtxt,)),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}



