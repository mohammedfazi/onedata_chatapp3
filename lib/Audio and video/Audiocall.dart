// import 'package:flutter/material.dart';
// import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
// import '../main.dart';
// import 'Utils.dart';
//
// class Audiocall extends StatefulWidget {
//   const Audiocall({super.key});
//
//   @override
//   State<Audiocall> createState() => _AudiocallState();
// }
//
// class _AudiocallState extends State<Audiocall> {
//
//
//
//   final callTextcontroller=TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       body: Center(
//         child: ZegoUIKitPrebuiltCall(
//           appID: Utils.appId,
//           appSign: Utils.appSignIn,
//           callID: callTextcontroller.text,
//           userID: localUserId,
//           userName: 'user_$localUserId',
//           config: ZegoUIKitPrebuiltCallConfig.oneOnOneVoiceCall(),
//
//         ),
//       ),
//     );
//   }
// }
