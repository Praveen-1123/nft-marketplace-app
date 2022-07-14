import 'package:flutter/material.dart';
import 'package:nft/constants/strings.dart';
import 'package:nft/helpers/toast.dart';
import 'package:nft/utils/loading_screen.dart';
import 'package:nft/views/welcome/main_navbar.dart';
import 'package:nft/views/welcome/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationWrapper extends StatefulWidget {
  @override
  _AuthenticationWrapperState createState() => _AuthenticationWrapperState();
}

class _AuthenticationWrapperState extends State<AuthenticationWrapper> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: SharedPreferences.getInstance(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          SharedPreferences prefs = snapshot.data;
          bool firstTime = prefs.getBool('first_time');
          bool isLoggedIn = prefs.getBool(login_key);
          if (firstTime != null &&
              !firstTime &&
              isLoggedIn != null &&
              !isLoggedIn) {
            ToastMessage.toast("Welcome to $APPNAME");
            return SplashScreen();
          } else if (isLoggedIn != null && isLoggedIn) {
            return MainBottomBar();
          } else {
            prefs.setBool('first_time', false);
            return SplashScreen();
          }
        }
        return LoadingScreen();
      },
    );
  }
}
