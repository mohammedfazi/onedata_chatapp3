import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'Common Size.dart';
import 'Common Textstyle.dart';
import 'Common color.dart';

class Imagescreen extends StatefulWidget {
  String name,img;
   Imagescreen({super.key,required this.img,required this.name});

  @override
  State<Imagescreen> createState() => _ImagescreenState();
}

class _ImagescreenState extends State<Imagescreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: black,
        leading: IconButton(onPressed: (){Get.back();},icon: const Icon(Icons.arrow_back_ios,color: white,),),
        title: Text(widget.name,style: hometitle,),
      ),
      body: Center(
        child: SizedBox(
          height: displayheight(context)*0.30,
          width: double.infinity,
          child: Image.asset(widget.img,fit: BoxFit.cover,),
        ),
      ),
    );
  }
}
