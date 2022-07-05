import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

String baseUrl = "http://192.168.18.123:3200/v1";

class Api {
  Future<dynamic> healthCheck() async {
    try {
      var res = await http.get(Uri.parse(baseUrl));
      String source = Utf8Decoder().convert(res.bodyBytes);
      return jsonDecode(source);
    } catch (e) {
      debugPrint("catch::health::check-$e");
    }
  }

  Future<dynamic> signIn(String email, String password) async {
    try {
      var res = await http.post(
        Uri.parse(baseUrl + "/user/login"),
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      String source = Utf8Decoder().convert(res.bodyBytes);
      return jsonDecode(source);
    } catch (e) {
      debugPrint("catch::login::user-$e");
    }
  }

  Future<dynamic> signUp(String email, String password, String address) async {
    try {
      var res = await http.post(
        Uri.parse(baseUrl + "/user/register"),
        body: jsonEncode({
          "email": email,
          "password": password,
          "address": address,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      String source = Utf8Decoder().convert(res.bodyBytes);
      return jsonDecode(source);
    } catch (e) {
      debugPrint("catch::register::user-$e");
    }
  }

  Future<dynamic> verifyEmail(String email, int code) async {
    try {
      var res = await http.post(
        Uri.parse(baseUrl + "/user/verify/email"),
        body: jsonEncode({
          "email": email,
          "verificationCode": code,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      String source = Utf8Decoder().convert(res.bodyBytes);
      return jsonDecode(source);
    } catch (e) {
      debugPrint("catch::verify::email-$e");
    }
  }

  Future<dynamic> requestVerificationCode(String email) async {
    try {
      var res = await http.post(
        Uri.parse(baseUrl + "/user/verify/resendcode"),
        body: jsonEncode({
          "email": email,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      String source = Utf8Decoder().convert(res.bodyBytes);
      return jsonDecode(source);
    } catch (e) {
      debugPrint("catch::verify::email-$e");
    }
  }

  void launchURL(String url) async {
    if (!await launchUrl(Uri.tryParse(url))) throw 'Could not launch $url';
  }
}
