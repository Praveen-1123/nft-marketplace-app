import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:lottie/lottie.dart';
import 'package:nft/constants/gradients.dart';
import 'package:nft/constants/strings.dart';
import 'package:nft/views/auth/signin_screen.dart';
import 'package:nft/views/auth/signup_screen.dart';
import 'package:nft/widgets/buttons/gradient_button.dart';
import 'package:nft/widgets/navigation_anim/fade.dart';
import 'package:flutter/material.dart';
import 'package:nft/widgets/reusables/gradient_text.dart';

class AuthIntroScreen extends StatefulWidget {
  const AuthIntroScreen({Key key}) : super(key: key);

  @override
  _AuthIntroScreenState createState() => _AuthIntroScreenState();
}

class _AuthIntroScreenState extends State<AuthIntroScreen> {
  //list of anims animation assets
  List<String> anims = ['assets/lottie/nft-intro-v2.json'];

  // generates a new Random object
  final _random = new Random();
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: FadeIn(
          delay: const Duration(milliseconds: 200),
          duration: const Duration(milliseconds: 500),
          child: GradientText(
            APPNAME,
            gradient: AppGradients().appGradient,
            style: TextStyle(
              fontSize: 34,
              fontFamily: 'Orbitron',
              color: theme.textTheme.headline1.color,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FadeIn(
            delay: const Duration(milliseconds: 400),
            duration: const Duration(milliseconds: 500),
            child: Center(
              child: Container(
                height: size.height / 2.5,
                width: size.width,
                child: Lottie.asset(
                  anims[_random.nextInt(anims.length)],
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
          ),
          Column(
            children: [
              FadeIn(
                delay: const Duration(milliseconds: 500),
                duration: const Duration(milliseconds: 500),
                child: Container(
                  margin: EdgeInsets.only(bottom: 25, left: 15, right: 15),
                  child: Text(
                    "Hey there,\nyou new here?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 35,
                      letterSpacing: -1,
                      color: theme.textTheme.headline1.color,
                    ),
                  ),
                ),
              ),
              FadeInUp(
                delay: const Duration(milliseconds: 500),
                duration: const Duration(milliseconds: 500),
                child: GradientButton(
                  text: "Sign In",
                  onTap: () async {
                    Navigator.push(context, FadeRoute(page: SignInScreen()));
                  },
                ),
              ),
              FadeInUp(
                delay: const Duration(milliseconds: 700),
                duration: const Duration(milliseconds: 800),
                child: GradientButton(
                  text: "Sign Up",
                  onTap: () async {
                    Navigator.push(context, FadeRoute(page: SignUpScreen()));
                  },
                ),
              ),
            ],
          ),
          FadeIn(
            delay: const Duration(milliseconds: 850),
            duration: const Duration(milliseconds: 500),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  "Terms & Conditions",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: theme.textTheme.bodyText1.color,
                    fontSize: 15,
                  ),
                ),
                Text(
                  "Privacy policy",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: theme.textTheme.bodyText1.color,
                    fontSize: 15,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
