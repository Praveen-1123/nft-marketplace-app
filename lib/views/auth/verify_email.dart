import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:lottie/lottie.dart';
import 'package:nft/constants/gradients.dart';
import 'package:nft/services/auth/auth_services_v2.dart';
import 'package:nft/utils/snackbar.dart';
import 'package:nft/widgets/buttons/flexible_button.dart';
import 'package:nft/widgets/reusables/gradient_text.dart';

class VerifyEmail extends StatefulWidget {
  final String email;
  const VerifyEmail({Key key, @required this.email}) : super(key: key);

  @override
  _VerifyEmailState createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  bool _isResendAgain = false;
  bool isLoading = false;

  String _code = '';

  // ignore: unused_field
  Timer _timer;

  int _start = 60;
  int resendCount = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // _timer.cancel();
    super.dispose();
  }

  void verifyOtp() async {
    setState(() {
      isLoading = true;
    });
    if (_code.length != 6) {
      GetXSnackBar().errorMessage("Invalid Otp", "Please enter a valid otp");
      setState(() {
        isLoading = false;
      });
    } else {
      await AuthServicesV2()
          .verifyEmail(widget.email, int.tryParse(_code), context);
      setState(() {
        isLoading = false;
      });
    }
  }

  void resend() async {
    setState(() {
      _isResendAgain = true;
      resendCount = resendCount + 1;
    });
    AuthServicesV2().resendVerificationCode(widget.email, context);
    const oneSec = Duration(seconds: 1);
    _timer = new Timer.periodic(oneSec, (timer) {
      setState(() {
        if (_start == 0) {
          _start = 60 * resendCount;
          _isResendAgain = false;
          timer.cancel();
        } else {
          _start--;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: FadeInDown(
          delay: const Duration(milliseconds: 500),
          duration: const Duration(milliseconds: 500),
          child: GradientText(
            "Verify Email",
            gradient: AppGradients().appGradient,
            style: TextStyle(
              fontSize: 32,
              fontFamily: 'Orbitron',
              fontWeight: FontWeight.bold,
              color: theme.textTheme.headline1.color,
            ),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FadeInLeft(
              delay: Duration(milliseconds: 400),
              duration: Duration(milliseconds: 500),
              child: Center(
                child: Container(
                  height: size.height / 3,
                  width: size.width / 1.4,
                  child: Lottie.asset(
                    'assets/lottie/otp.json',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Column(
              children: [
                FadeInLeft(
                  delay: Duration(milliseconds: 500),
                  duration: Duration(milliseconds: 500),
                  child: Text(
                    "Please enter the 6 digit code sent to \n ${widget.email}",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        color: theme.textTheme.bodyText2.color,
                        height: 1.5),
                  ),
                ),
                FadeInLeft(
                  delay: Duration(milliseconds: 600),
                  duration: Duration(milliseconds: 500),
                  child: VerificationCode(
                    length: 6,
                    textStyle: TextStyle(
                        fontSize: 20, color: theme.textTheme.headline1.color),
                    underlineColor: theme.textTheme.headline1.color,
                    keyboardType: TextInputType.number,
                    underlineUnfocusedColor: theme.textTheme.bodyText1.color,
                    onCompleted: (value) {
                      setState(() {
                        _code = value;
                      });
                    },
                    digitsOnly: true,
                    onEditing: (value) {},
                  ),
                ),
                FadeInLeft(
                  delay: Duration(milliseconds: 700),
                  duration: Duration(milliseconds: 500),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Didn't received the OTP?",
                        style: TextStyle(
                            fontSize: 14, color: Colors.grey.shade500),
                      ),
                      TextButton(
                        onPressed: () {
                          if (_isResendAgain) return;
                          resend();
                          // ToastMessage.toast("Coming soon...");
                        },
                        child: GradientText(
                          _isResendAgain
                              ? "Try again in " + _start.toString()
                              : "Resend",
                          gradient: AppGradients().appGradient,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            FadeInLeft(
              delay: Duration(milliseconds: 800),
              duration: Duration(milliseconds: 500),
              child: FlexibleButton(
                  isLoading: isLoading,
                  text: isLoading ? "Verifying..." : "Verify",
                  onPressed: () => verifyOtp()),
            ),
          ],
        ),
      ),
    );
  }
}
