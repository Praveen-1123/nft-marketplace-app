import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:nft/constants/gradients.dart';
import 'package:nft/services/api/connectivity.dart';
import 'package:nft/services/auth/auth_services_v2.dart';
import 'package:nft/services/others/validations.dart';
import 'package:nft/utils/snackbar.dart';
import 'package:nft/views/auth/signin_screen.dart';
import 'package:nft/widgets/buttons/flexible_button.dart';
import 'package:nft/widgets/navigation_anim/cupertino.dart';
import 'package:nft/widgets/reusables/gradient_text.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String buttonText = 'Sign Up';

  bool isLoading = false;

  TextEditingController _email = new TextEditingController();
  TextEditingController _address = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  TextEditingController _cpassword = new TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  void signUpValidation() async {
    isLoading = true;
    buttonText = 'Signing Up..';
    setState(() {});
    if (await Connectivity().checkConnection()) {
      if (_email.text == '') {
        GetXSnackBar().errorMessage("Email not found",
            "Please enter your email address to proceed further");
      } else if (await Validator().validateEmail(_email.text) == false) {
        GetXSnackBar().errorMessage(
            "Email not valid", "Please enter a valid email address");
      } else if (_password.text == '') {
        GetXSnackBar().errorMessage("Password not found",
            "Please enter your password to proceed further");
      } else if (_password.text.length < 8) {
        GetXSnackBar().warningMessage(
            "Password is not valid", "Password must be minimum 8 characters");
      } else if (_cpassword.text != _password.text) {
        GetXSnackBar().warningMessage(
            "Password dosen't match", "Password dosen't match. please check");
      } else {
        await AuthServicesV2().signUp(
          _email.text,
          _password.text,
          _address.text,
          context,
        );
      }
      isLoading = false;
      buttonText = 'Sign Up';
    } else {
      GetXSnackBar().warningMessage(
          "Failed", "Check your internet connection before continue");
      isLoading = false;
      buttonText = 'Sign Up';
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: theme.scaffoldBackgroundColor,
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  FadeInLeft(
                    delay: const Duration(milliseconds: 400),
                    duration: const Duration(milliseconds: 500),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 60, left: 10),
                      child: RotatedBox(
                        quarterTurns: -1,
                        child: GradientText(
                          'Sign up',
                          gradient: AppGradients().appGradient,
                          style: TextStyle(
                            fontSize: 38,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                  ),
                  FadeInRight(
                    delay: const Duration(milliseconds: 500),
                    duration: const Duration(milliseconds: 500),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30.0, left: 10.0),
                      child: Container(
                        height: 200,
                        width: 200,
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: 60,
                            ),
                            Center(
                              child: Text(
                                'Welcome...\nWe can start something new',
                                style: TextStyle(
                                  fontSize: 24,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              FadeIn(
                delay: const Duration(milliseconds: 700),
                duration: const Duration(milliseconds: 500),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, left: 50, right: 50),
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    child: TextField(
                      controller: _email,
                      cursorColor: theme.textTheme.headline1.color,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: theme.textTheme.headline1.color,
                        labelText: 'Email',
                        labelStyle: TextStyle(
                          color: theme.textTheme.bodyText1.color,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              FadeIn(
                delay: const Duration(milliseconds: 700),
                duration: const Duration(milliseconds: 500),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 50, right: 50),
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    child: TextField(
                      controller: _address,
                      cursorColor: theme.textTheme.headline1.color,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        fillColor: theme.textTheme.headline1.color,
                        labelText: 'Wallet address',
                        labelStyle: TextStyle(
                          color: theme.textTheme.bodyText1.color,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              FadeIn(
                delay: const Duration(milliseconds: 700),
                duration: const Duration(milliseconds: 500),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 50, right: 50),
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    child: TextField(
                      controller: _password,
                      obscureText: true,
                      cursorColor: theme.textTheme.headline1.color,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          color: theme.textTheme.bodyText1.color,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              FadeIn(
                delay: const Duration(milliseconds: 700),
                duration: const Duration(milliseconds: 500),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 50, right: 50),
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    child: TextField(
                      controller: _cpassword,
                      obscureText: true,
                      cursorColor: theme.textTheme.headline1.color,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        labelText: 'Confirm Password',
                        labelStyle: TextStyle(
                          color: theme.textTheme.bodyText1.color,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              FadeInRight(
                delay: const Duration(milliseconds: 500),
                duration: const Duration(milliseconds: 500),
                child: FlexibleButton(
                    isLoading: isLoading,
                    text: buttonText,
                    margin: EdgeInsets.only(left: size.width / 2, top: 25),
                    onPressed: () => signUpValidation()),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 30),
                child: Container(
                  alignment: Alignment.topRight,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      FadeInLeft(
                        delay: const Duration(milliseconds: 600),
                        duration: const Duration(milliseconds: 500),
                        child: Container(
                          margin: EdgeInsets.only(bottom: 10),
                          child: Text(
                            'old user?',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                      FadeInRight(
                        delay: const Duration(milliseconds: 600),
                        duration: const Duration(milliseconds: 500),
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              CupertinoRoute(
                                exitPage: this.widget,
                                enterPage: SignInScreen(),
                              ),
                            );
                          },
                          child: GradientText(
                            'Sign In',
                            gradient: AppGradients().appGradient,
                            style: TextStyle(
                              fontSize: 20,
                              color: theme.textTheme.headline1.color,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
