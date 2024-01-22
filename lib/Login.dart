import 'package:flutter/material.dart';
import 'package:onedata_chatapp/snackbar.dart';


import 'Common Size.dart';
import 'Common Textstyle.dart';
import 'Screen1/Homepage.dart';
import 'Screen2/Homepage1.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {

  final String adminemaillogin="user1@gmail.com";
  final String adminpasswordlogin="123456";
  final String workersemaillogin="user2@gmail.com";
  final String workerspasswordlogin="123456";
  TextEditingController wloginemail=TextEditingController();
  TextEditingController wloginpass=TextEditingController();
  TextEditingController adminemail=TextEditingController();
  TextEditingController adminpassword=TextEditingController();



  int container=0;
  bool toggle=false;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.black,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: SizedBox(
                height: displayheight(context)*0.20,
                child: Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Text(container==0?"Welcome Back To OneData Solution Chat User1 Login":"Welcome Back To OneData Solution Chat User2 Login",style: hometitle,),
                ),

              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                height: displayheight(context)*0.07,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.white)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap:(){
                        setState(() {
                          container=0;
                        });
                      },
                      child: Container(
                        height: displayheight(context)*0.07,
                        width: displaywidth(context)*0.45,
                        decoration:  BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: container==0?Colors.white:Colors.transparent
                        ),
                        child: Center(child: Text("User1 Login",style: container==0?hometitle1:hometitle,)),
                      ),
                    ),
                    InkWell(
                      onTap:(){
                        setState(() {
                          container=1;
                        });
                      },
                      child: Container(
                        height: displayheight(context)*0.07,
                        width: displaywidth(context)*0.45,
                        decoration:  BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: container==1?Colors.white:Colors.transparent
                        ),
                        child: Center(child: Text("User2 Login",style: container==1?hometitle1:hometitle,)),
                      ),
                    ),

                  ],
                ),


              ),
            ),

            if(container==0)
              admin()
            else
              workerlogin(),




          ],
        ),
      ),
    );
  }
  Widget admin(){
    return Padding(
      padding: const EdgeInsets.only(top:30.0,bottom: 15.0,left: 10.0,right: 10.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Colors.white.withOpacity(0.5),
                  Colors.white.withOpacity(0.2),
                ],
                stops: [0.0,1.0]
            )
        ),

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 30,),
              Text("User1 Login",style: hometitle,),
              const SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  controller: adminemail,
                  cursorColor: Colors.white,
                  style: hometitle,
                  decoration: InputDecoration(
                      labelText: "Email Id",
                      labelStyle: hometitle,
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)
                      ),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)
                      )
                  ),
                ),
              ),
              const SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  controller: adminpassword,
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.white,
                  obscureText: toggle?true:false,
                  onTap: (){
                    setState(() {
                      toggle=!toggle;
                    });
                  },
                  style: hometitle,
                  decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: hometitle,
                      suffixIcon: Icon(toggle?Icons.visibility:Icons.visibility_off,color: Colors.white,),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)
                      ),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)
                      )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:15.0),
                child: SizedBox(
                    height: 40,
                    width: 120,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                        onPressed: () async {
                          if(adminemail.text.isEmpty){
                            StackDialog.show("One Data Solutions ChatApp", "Please Enter Email", Icons.email, Colors.black);
                          }
                          else if(adminpassword.text.isEmpty){
                            StackDialog.show("One Data Solutions ChatApp", "Please Enter Password", Icons.password, Colors.black);
                          }
                          else if(adminemail.text == adminemaillogin && adminpassword.text == adminpasswordlogin){
                            StackDialog.show("One Data Solutions ChatApp", "Login Sucessfully", Icons.verified, Colors.black);
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Homescreen()));
                          //
                          //   // var shref=await SharedPreferences.getInstance();
                          //   // shref.setBool('admin',true);
                          //
                          }
                          else{
                            StackDialog.show("One Data Solutions ChatApp", "Incorrect Email and Password ", Icons.verified, Colors.black);
                          }
                        }, child: Center(child: Text("Login",style: hometitle1,)))),
              ),
              SizedBox(height: 30,),
            ],
          ),
        ),


      ),
    );
  }

  Widget workerlogin(){
    return Padding(
      padding: const EdgeInsets.only(top:30.0,bottom: 15.0,left: 10.0,right: 10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white.withOpacity(0.5),
              Colors.white.withOpacity(0.2),
            ],
            stops: [0.0,1.0]
          )
        ),

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 30,),
              Text("User2 Login",style: hometitle,),
              const SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  controller:wloginemail ,
                  cursorColor: Colors.white,
                  style: hometitle,
                  decoration: InputDecoration(
                      labelText: "Email Id",
                      labelStyle: hometitle,
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)
                      ),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)
                      )
                  ),
                ),
              ),
              const SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextFormField(
                  controller: wloginpass,
                  keyboardType: TextInputType.text,
                  cursorColor: Colors.white,
                  obscureText: toggle?true:false,
                  onTap: (){
                    setState(() {
                      toggle=!toggle;
                    });
                  },
                  style: hometitle,
                  decoration: InputDecoration(
                      labelText: "Password",
                      labelStyle: hometitle,
                      suffixIcon: Icon(toggle?Icons.visibility:Icons.visibility_off,color: Colors.white,),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)
                      ),
                      focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)
                      )
                  ),
                ),
              ),
              // commonelevationbtn("Login", workerlogin())
              Padding(
                padding: const EdgeInsets.only(top:15.0),
                child: SizedBox(
                    height: 40,
                    width: 120,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                        onPressed: (){
                          if(wloginemail.text.isEmpty){
                            StackDialog.show("One Data Solutions ChatApp", "Please Enter Email", Icons.email, Colors.black);
                          }
                          else if(wloginpass.text.isEmpty){
                            StackDialog.show("One Data Solutions ChatApp", "Please Enter Password", Icons.password, Colors.black);
                          }
                          else if(wloginemail.text == workersemaillogin && wloginpass.text == workerspasswordlogin){
                            StackDialog.show("One Data Solutions ChatApp", "Login Sucessfully", Icons.verified, Colors.black);
                            Navigator.push(context, MaterialPageRoute(builder: (context)=> Homepage1()));
                          }
                          else{
                            StackDialog.show("One Data Solutions ChatApp", "Incorrect Email and Password ", Icons.verified, Colors.black);
                          }
                        }, child: Center(child: Text("Login",style: hometitle1,)))),
              ),
              SizedBox(height: 30,),
            ],
          ),
        ),
      ),
    );
  }
}
