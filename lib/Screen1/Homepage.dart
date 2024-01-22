import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


import '../Common Size.dart';
import '../Common Textstyle.dart';
import '../Common color.dart';
import '../Imagescreen.dart';
import '../Login.dart';
import 'chatascreen.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {

  List <dynamic> datas=[

    {
      "img":"Assets/img.png",
      "name":"Mohammed fazil",
    },
    // {
    //   "img":"Assets/img_1.png",
    //   "name":"Mohammed Irfan",
    // },
    // {
    //   "img":"Assets/img_2.png",
    //   "name":"Richard",
    // },
    // {
    //   "img":"Assets/img_3.png",
    //   "name":"Daniel Smith",
    // },
    // {
    //   "img":"Assets/img_4.png",
    //   "name":"John",
    // },
    // {
    //   "img":"Assets/img_5.png",
    //   "name":"Mark Berk",
    // },
    // {
    //   "img":"Assets/img_6.png",
    //   "name":"Zuberrg",
    // },
  ];


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor:Colors.grey.shade700,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("OneData Software Chat ",style: hometitle,),
            ),
          ],
        ),
        actions: [
          IconButton(onPressed: (){logout();}, icon: Icon(Icons.logout,color: white),)
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top:15.0),
        child: SizedBox(
          height: displayheight(context)*0.90,
          child: ListView.builder(
              itemCount: datas.length,
              itemBuilder: (BuildContext context,int index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: displayheight(context)*0.08,
                    decoration:  BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(30)
                    ),
                    child: Center(
                      child: ListTile(
                        onTap: (){
                          Get.to(Chatscreen(name:datas[index]['name'],img:datas[index]['img']));
                        },
                        leading: InkWell(
                          onTap: (){
                            Get.to(Imagescreen(name:datas[index]['name'],img:datas[index]['img']));
                          },
                          child: CircleAvatar(
                            radius: 30.0,
                            backgroundImage: AssetImage(datas[index]['img']),
                          ),
                        ),
                        title: Text(datas[index]['name'],style: hometitle,),
                        // trailing: Text("$now",style:hometitle ,),
                      ),
                    ),
                  ),
                );

          }),
        ),
      )

    );
  }
  logout(){
    return showDialog(context: context, builder: (param){
      return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)
        ),
        actions: [
          TextButton(onPressed: (){Get.back();}, child: Text("No",style:hometitle1),
          ),
          TextButton(onPressed: ()async{

            Get.to(Loginscreen());
          },
            child: Text("Yes",style:hometitle1 ,),
          )
        ],
        title: Text("Are you sure you want Exit OneData Software Solution!",style: hometitle1,),
      );
    });
  }
}
