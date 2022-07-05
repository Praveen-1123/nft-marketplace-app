// import 'package:flutter/material.dart';
// import 'package:remind_me/helpers/toast.dart';
// import 'package:remind_me/views/utils/loading_screen.dart';
// import 'package:remind_me/views/welcome/intro_screen.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class AuthenticationWrapperFirebase extends StatefulWidget {
//   @override
//   _AuthenticationWrapperFirebaseState createState() => _AuthenticationWrapperFirebaseState();
// }

// class _AuthenticationWrapperFirebaseState extends State<AuthenticationWrapperFirebase> {
//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//         future: SharedPreferences.getInstance(),
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             SharedPreferences prefs = snapshot.data;
//             bool firstTime = prefs.getBool('first_time');
//             if (firstTime != null && !firstTime) {
//               ToastMessage.toast("Welcome to Remind ME");
//               return IntroScreen();
//             } else {
//               prefs.setBool('first_time', false);
//               return IntroScreen();
//             }
//           }
//           return LoadingScreen();
//         });
//   }
// }
