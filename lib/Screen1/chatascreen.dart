import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onedata_chatapp/db_helper1/User1.dart';
import 'package:onedata_chatapp/db_helper1/userservicejob.dart';
import '../Common Size.dart';
import '../Common Textstyle.dart';
import '../Common color.dart';
import '../Imagescreen.dart';
import '../db_helper/User.dart';
import '../db_helper/userService.dart';


class Chatscreen extends StatefulWidget {
  String img,name;
   Chatscreen({super.key,required this.name,required this.img});

  @override
  State<Chatscreen> createState() => _ChatscreenState();
}

class _ChatscreenState extends State<Chatscreen> {

  TextEditingController searchfield1=TextEditingController();

  var _userServices=UserService();

  late List <Userjob> _userList = [];

  var _userServicesjob=Userservicejob();

  getAllUserDetails()async{
    var users=await _userServicesjob.readaallusers();
    _userList=<Userjob>[];
    users.forEach((user){
      setState(() {
        var userModel=Userjob();
        userModel.id=user['id'];
        userModel.name=user['name']??'';
        _userList.add(userModel);
      });
    });
  }

  @override
  void initState() {
    getAllUserDetails();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.grey,
        leading: IconButton(onPressed: (){Get.back();},icon: const Icon(Icons.arrow_back_ios,color: white,),),
        title: InkWell(
          onTap: (){
            Get.to(Imagescreen(name:widget.name,img:widget.img));
          },
          child: Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(widget.img),
              ),
              const SizedBox(width: 10,),
              Text(widget.name,style: hometitle,),
            ],
          ),
        ),
        actions:  [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              InkWell(
                onTap: (){
                  // Get.to(Audiocall());
                },
                child: const CircleAvatar(
                  backgroundColor: Colors.black,
                  child: Icon(Icons.phone,color:white,),
                ),
              ),
              const SizedBox(width: 10,),
              InkWell(
                onTap: (){},
                child: const CircleAvatar(
                  backgroundColor: Colors.black,
                  child: Icon(Icons.videocam_rounded,color:white,),
                ),
              )
            ],
          )
        ],

      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top:15.0),
            child: SizedBox(
              height: displayheight(context)*0.78,
              child:_userList.isEmpty?Center(child: Text(""),):ListView.builder(
                itemCount: _userList.length,
                  itemBuilder: (BuildContext context,int index){
                return Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        height:displayheight(context)*0.10,
                        width:double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height:displayheight(context)*0.08,
                              decoration: const BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),topRight: Radius.circular(20))
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(child: Text("${_userList[index].name ?? ''}",style: hometitle,)),
                              ),
                            ),
                            const SizedBox(width: 100,)
                          ],
                        ),
                      ),
                    ),
                    // Align(
                    //   alignment: Alignment.centerRight,
                    //   child: SizedBox(
                    //     height:displayheight(context)*0.10,
                    //     width:double.infinity,
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.end,
                    //
                    //       children: [
                    //         const SizedBox(width: 100,),
                    //         Container(
                    //           height:displayheight(context)*0.08,
                    //           decoration: const BoxDecoration(
                    //               color: Colors.blue,
                    //               borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),topLeft: Radius.circular(20))
                    //           ),
                    //           child: Padding(
                    //             padding: const EdgeInsets.all(8.0),
                    //             child: Center(child: Text("How are you?",style: hometitle,)),
                    //           ),
                    //         ),
                    //
                    //       ],
                    //     ),
                    //   ),
                    // )
                  ],
                );
              })
              // ListView(
              //   scrollDirection: Axis.vertical,
              //   children: [
              //     Align(
              //       alignment: Alignment.centerLeft,
              //       child: SizedBox(
              //         height:displayheight(context)*0.10,
              //         width:double.infinity,
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.start,
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Container(
              //               height:displayheight(context)*0.08,
              //               decoration: const BoxDecoration(
              //                   color: Colors.grey,
              //                   borderRadius: BorderRadius.only(bottomRight: Radius.circular(20),topRight: Radius.circular(20))
              //               ),
              //               child: Padding(
              //                 padding: const EdgeInsets.all(8.0),
              //                 child: Center(child: Text("Mohammed fazil",style: hometitle,)),
              //               ),
              //             ),
              //             const SizedBox(width: 100,)
              //           ],
              //         ),
              //       ),
              //     ),
              //     Align(
              //       alignment: Alignment.centerRight,
              //       child: SizedBox(
              //         height:displayheight(context)*0.10,
              //         width:double.infinity,
              //         child: Row(
              //           mainAxisAlignment: MainAxisAlignment.end,
              //
              //           children: [
              //             const SizedBox(width: 100,),
              //             Container(
              //               height:displayheight(context)*0.08,
              //               decoration: const BoxDecoration(
              //                   color: Colors.blue,
              //                   borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),topLeft: Radius.circular(20))
              //               ),
              //               child: Padding(
              //                 padding: const EdgeInsets.all(8.0),
              //                 child: Center(child: Text("How are you?",style: hometitle,)),
              //               ),
              //             ),
              //
              //           ],
              //         ),
              //       ),
              //     )
              //
              //   ],
              // ),
            ),
          ),
          Expanded(
            child: Container(
              height: displayheight(context)*0.10,
              width: double.infinity,
              color: Colors.grey,
              child:  Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: displaywidth(context)*0.80,
                      child: TextFormField(
                        autofocus: true,
                        style: hometitle1,
                        controller: searchfield1,
                        cursorColor: Colors.grey,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderSide:const BorderSide(color:white ),
                                borderRadius: BorderRadius.circular(30)
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderSide:const BorderSide(color:white ),
                                borderRadius: BorderRadius.circular(30)
                            ),
                            fillColor: white,
                            focusColor: white,
                            filled: true
                        ),
                      ),
                    ),
                    FloatingActionButton(
                        backgroundColor: black,
                        child: const Icon(Icons.send,color: white,),
                        onPressed: ()async{
                          var _user=User();
                          _user.fullname=searchfield1.text;
                          var result = await _userServices.SaveUser(_user);
                          print(result);
                          searchfield1.text='';
                        })
                  ],
                ),
              ),

            ),
          )
        ],
      ),
    );
  }
}
