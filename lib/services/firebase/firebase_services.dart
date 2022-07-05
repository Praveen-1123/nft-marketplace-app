// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:remind_me/views/welcome/home_screen.dart';
// import 'package:remind_me/views/welcome/intro_screen.dart';
// import 'package:remind_me/constants/strings.dart';

// class FirebaseServices {
//   FirebaseAuth _auth = FirebaseAuth.instance;
//   FirebaseFirestore _firestore = FirebaseFirestore.instance;

//   String currentUserId() {
//     return _auth.currentUser.uid;
//   }

//   String useremail() {
//     User user = _auth.currentUser;
//     return user.email;
//   }

//   User currentUser() {
//     return _auth.currentUser;
//   }

//   void checkAuthState() async {
//     if (_auth.currentUser == null) {
//       Get.off(IntroScreen());
//     } else {
//       Get.off(MainScreen());
//     }
//   }

//   Stream<User> get authStateChanges => _auth.authStateChanges();

//   Future<void> signOut() async {
//     await _auth.signOut();
//   }

//   Future<void> addtokenid(Map<String, dynamic> body) async {
//     try {
//       await _firestore.collection(NOTIFICATION).doc(useremail()).set(body);
//     } catch (error) {
//       return Future.error("Failed to Refferral code",
//           StackTrace.fromString("This is its trace"));
//     }
//   }

//   Future<String> signIn(String email, String password) async {
//     try {
//       await FirebaseAuth.instance
//           .signInWithEmailAndPassword(email: email, password: password);
//       return "success";
//     } catch (e) {
//       debugPrint("${e.code}");
//       if (e.code == 'user-not-found') {
//         debugPrint('No user found for that email.');
//         return 'No user found for that email.';
//       } else if (e.code == 'wrong-password') {
//         debugPrint('Wrong password. ');
//         return 'Wrong password.';
//       } else if (e.code == 'unknown') {
//         debugPrint('Email/password should not be empty');
//         return 'Email/password should not be empty';
//       }
//       return 'Email Not verified or Invalid credentials entered. Kindly check';
//     }
//   }

//   Future<String> signUp(
//     String email,
//     String password,
//   ) async {
//     try {
//       await FirebaseAuth.instance
//           .createUserWithEmailAndPassword(email: email, password: password);
//       return 'success';
//     } catch (e) {
//       debugPrint("${e.code}");
//       if (e.code == 'ERROR_WEAK_PASSWORD') {
//         debugPrint('The password provided is too weak.');
//         return 'The password provided is too weak.';
//       } else if (e.code == 'ERROR_EMAIL_ALREADY_IN_USE') {
//         debugPrint('The account already exists for that email.');
//         return 'The account already exists for that email.';
//       } else if (e.code == 'email-already-in-use') {
//         debugPrint('The account already exists for that email.');
//         return 'The account already exists for that email.';
//       } else if (e.code == 'weak-password') {
//         debugPrint('The password must be at least 6 characters ');
//         return 'The password must be at least 6 characters.';
//       }
//       return 'Something went wrong.';
//     }
//   }
// }
