import 'package:animate_do/animate_do.dart';
import 'package:nft/constants/colors.dart';
import 'package:nft/constants/strings.dart';
import 'package:nft/services/auth/auth_services.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      AuthServices().checkAuthState(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            FadeIn(
              delay: const Duration(milliseconds: 400),
              duration: const Duration(milliseconds: 500),
              child: Pulse(
                delay: const Duration(milliseconds: 200),
                duration: const Duration(milliseconds: 6000),
                child: Image.asset(
                  'assets/common/bg_purple.png',
                  fit: BoxFit.cover,
                  height: size.height,
                  width: size.width,
                  color: Colors.black.withOpacity(0.5),
                  colorBlendMode: BlendMode.dstATop,
                ),
              ),
            ),
            Flash(
              delay: const Duration(milliseconds: 1500),
              duration: const Duration(milliseconds: 750),
              child: Text(
                APPNAME,
                style: TextStyle(
                  fontFamily: 'Orbitron',
                  fontSize: 40,
                  color: AppColors.secondaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
