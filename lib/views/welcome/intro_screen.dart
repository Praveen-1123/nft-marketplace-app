import 'package:animate_do/animate_do.dart';
import 'package:nft/constants/gradients.dart';
import 'package:nft/constants/strings.dart';
import 'package:nft/widgets/navigation_anim/fade.dart';
import 'package:flutter/material.dart';
import 'package:nft/widgets/reusables/asset_image.dart';
import 'package:nft/widgets/reusables/gradient_text.dart';

import '../auth/auth_intro.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    return Container(
      color: theme.backgroundColor,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            automaticallyImplyLeading: false,
            title: FadeInDown(
              delay: const Duration(milliseconds: 500),
              duration: const Duration(milliseconds: 500),
              child: GradientText(
                "Welcome",
                gradient: AppGradients().appGradient,
                style: TextStyle(
                  fontSize: 40,
                  fontFamily: 'Orbitron',
                  fontWeight: FontWeight.bold,
                  color: theme.textTheme.headline1.color,
                ),
              ),
            ),
          ),
          body: Container(
            margin: EdgeInsets.only(left: 10, top: 20, right: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ElasticIn(
                  delay: const Duration(milliseconds: 100),
                  duration: const Duration(milliseconds: 500),
                  child: Center(
                    child: MyAssetImage(
                      path: 'assets/icons/nft-main.png',
                      fit: BoxFit.cover,
                      radius: 250,
                      height: size.height / 3.5,
                      width: size.width / 1.6,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  child: FadeIn(
                    delay: const Duration(milliseconds: 500),
                    duration: const Duration(milliseconds: 500),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: new TextSpan(
                        children: [
                          new TextSpan(
                            text:
                                'This is an NFT Marketplace where you can Mint, Buy and Sell your NFTs.',
                            style: new TextStyle(
                              fontSize: 20,
                              color: theme.textTheme.headline1.color,
                            ),
                          ),
                          // new TextSpan(
                          //   text: APPWEBSITEURL,
                          //   style: new TextStyle(
                          //     fontSize: 20,
                          //     color: Colors.blue,
                          //   ),
                          //   recognizer: new TapGestureRecognizer()
                          //     ..onTap = () {
                          //       Api().launchURL(APPWEBSITEURL);
                          //     },
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
                Spin(
                  delay: const Duration(milliseconds: 500),
                  duration: const Duration(milliseconds: 1000),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        // AdaptiveTheme.of(context).setDark();
                        Navigator.push(
                            context, FadeRoute(page: AuthIntroScreen()));
                      },
                      child: FadeIn(
                        delay: const Duration(milliseconds: 400),
                        duration: const Duration(milliseconds: 500),
                        child: Container(
                          height: 80,
                          width: 80,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            gradient: AppGradients().appGradient,
                            borderRadius: BorderRadius.all(
                              Radius.circular(50),
                            ),
                          ),
                          child: Text(
                            "GO",
                            style: TextStyle(
                              fontSize: 20,
                              color: theme.textTheme.headline2.color,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          bottomNavigationBar: FadeInUp(
            delay: const Duration(milliseconds: 500),
            duration: const Duration(milliseconds: 500),
            child: Container(
              width: size.width,
              height: 30,
              alignment: Alignment.center,
              child: Text(
                "All rights reserved @$APPNAME 2021",
                style: TextStyle(
                  color: theme.textTheme.bodyText1.color,
                  fontSize: 13,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
