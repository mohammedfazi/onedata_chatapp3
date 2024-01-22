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


class Chatscreen1 extends StatefulWidget {
  String img,name;
   Chatscreen1({super.key,required this.img,required this.name});

  @override
  State<Chatscreen1> createState() => _Chatscreen1State();
}

class _Chatscreen1State extends State<Chatscreen1> {

  TextEditingController searchfield=TextEditingController();

  var _userServices1=Userservicejob();

  var _userServices=UserService();

  late List <User> _userList = [];


  getAllUserDetails()async{
    var users=await _userServices.readAllUsers();
    _userList=<User>[];
    users.forEach((user){
      setState(() {
        var userModel=User();
        userModel.id=user['id'];
        userModel.fullname=user['fullname']??'';
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
            children: const [
              CircleAvatar(
                backgroundColor: Colors.black,
                child: Icon(Icons.phone,color:white,),
              ),
              SizedBox(width: 10,),
              CircleAvatar(
                backgroundColor: Colors.black,
                child: Icon(Icons.videocam_rounded,color:white,),
              )
            ],
          )
        ],

      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top:15.0),
            child: Container(
              height: displayheight(context)*0.78,
              child:_userList.isEmpty?Center(child: CircularProgressIndicator(color: Colors.white,)): ListView.builder(
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
                                    child: Center(child: Text("${_userList[index].fullname ?? ''}",style: hometitle,)),
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
            ),
          ),
          Expanded(
            child: Container(
              height: displayheight(context)*0.10,
              width: double.infinity,
              color: Colors.grey,
              child:  Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children:<Widget> [
                      SizedBox(
                        width: displaywidth(context)*0.80,
                        child: TextFormField(
                          autofocus: true,
                          style: hometitle1,
                          controller: searchfield,
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
                            var _user=Userjob();
                            _user.name=searchfield.text;
                            var result = await _userServices1.SaveUser(_user);
                            print(result);
                            searchfield.text='';
                          })

                    ],
                  ),
                ),
              ),

            ),
          )
        ],
      ),
    );
  }
}
