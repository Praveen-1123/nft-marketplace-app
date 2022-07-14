import 'package:nft/constants/strings.dart';
import 'package:nft/services/api/user_repository.dart';
import 'package:nft/services/localstorage/getx_storage.dart';
import 'package:nft/services/localstorage/shared_references.dart';
import 'package:nft/utils/snackbar.dart';
import 'package:nft/views/auth/verify_email.dart';
import 'package:nft/views/welcome/main_navbar.dart';
import 'package:nft/views/welcome/intro_screen.dart';
import 'package:nft/widgets/navigation_anim/fade.dart';
import 'package:flutter/material.dart';

class AuthServicesV2 {
  Future<bool> checkAuth() async {
    String email = await readData(ls_email_key);
    String token = await readData(ls_token_key);

    if (email != null && token != null) {
      await writePrefsBool(login_key, true);
    } else {
      await writePrefsBool(login_key, false);
    }
    return false;
  }

  void checkAuthState(BuildContext context) async {
    String email = await readData(ls_email_key);
    String token = await readData(ls_token_key);

    if (email != null && token != null) {
      Navigator.push(context, FadeRoute(page: MainBottomBar()));
    } else {
      Navigator.push(context, FadeRoute(page: IntroScreen()));
    }
  }

  Future signIn(
    String email,
    String password,
    BuildContext context,
  ) async {
    try {
      var data = await Api().signIn(email, password);
      if (data['success']) {
        if (data['result']['emailVerified']) {
          Navigator.pushAndRemoveUntil(
              context, FadeRoute(page: MainBottomBar()), (route) => false);
          await writeData(ls_email_key, data['result']['email']);
          await writeData(ls_address, data['result']['address']);
          await writeData(ls_token_key, data['result']['token']);
          checkAuth();
          GetXSnackBar().successMessage("Logged In", data['result']['message']);
        } else {
          await Api().requestVerificationCode(email);
          Navigator.push(
            context,
            FadeRoute(
              page: VerifyEmail(
                email: email,
              ),
            ),
          );
          GetXSnackBar().warningMessage("Verify Email",
              "Email not verified. Please verify your email to continue");
        }
      } else {
        GetXSnackBar().errorMessage("Failed!", data['result']['message']);
      }
    } catch (e) {
      GetXSnackBar().errorMessage(
          "Failed!", "Unknown error occured. Please contact support.");
      debugPrint("catch::login::user-$e");
    }
  }

  Future signUp(
    String email,
    String password,
    String address,
    BuildContext context,
  ) async {
    try {
      var data = await Api().signUp(email, password, address);
      if (data['success']) {
        GetXSnackBar().infoMessage("Registered", data['result']['message']);
        await writeData(ls_email_key, email);
        await writeData(ls_address, address);
        if (data['result']['user']['code'] != null) {
          await verifyEmail(data['result']['user']['email'],
              data['result']['user']['code'], context);
        } else {
          Api().requestVerificationCode(email);
          Navigator.push(
            context,
            FadeRoute(
              page: VerifyEmail(
                email: data['result']['user']['email'],
              ),
            ),
          );
        }
      } else {
        GetXSnackBar().errorMessage("Failed!", data['result']['message']);
      }
    } catch (e) {
      debugPrint("catch::signup::user-$e");
    }
  }

  Future verifyEmail(String email, int code, BuildContext context) async {
    try {
      var data = await Api().verifyEmail(email, code);
      if (data['success']) {
        GetXSnackBar().successMessage("Verified", data['result']['message']);
        await writeData(ls_email_key, email);
        await writeData(ls_token_key, data['result']['token']);
        Navigator.pushAndRemoveUntil(
            context, FadeRoute(page: MainBottomBar()), (route) => false);
        checkAuth();
      } else {
        GetXSnackBar().errorMessage("Failed!", data['result']['message']);
      }
    } catch (e) {
      debugPrint("catch::verify::email-$e");
    }
  }

  Future resendVerificationCode(String email, BuildContext context) async {
    try {
      var data = await Api().requestVerificationCode(email);
      if (data['success']) {
        GetXSnackBar().successMessage("Code Sent", data['result']['message']);
      } else {
        GetXSnackBar().errorMessage("Failed!", data['result']['message']);
      }
    } catch (e) {
      debugPrint("catch::verify::email-$e");
    }
  }

  Future signOut(BuildContext context) async {
    try {
      await deleteAllData();
      checkAuth();
      Navigator.pushAndRemoveUntil(
          context, FadeRoute(page: IntroScreen()), (route) => false);
    } catch (e) {
      debugPrint("catch::login::user-$e");
    }
  }
}
