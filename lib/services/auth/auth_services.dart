import 'package:nft/constants/strings.dart';
import 'package:nft/services/api/blockchain_api.dart';
import 'package:nft/services/localstorage/getx_storage.dart';
import 'package:nft/services/others/encrypt_decrypt.dart';
import 'package:nft/utils/snackbar.dart';
import 'package:nft/views/tabbar_views/main_navbar.dart';
import 'package:nft/views/welcome/intro_screen.dart';
import 'package:nft/widgets/navigation_anim/fade.dart';
import 'package:nft/widgets/navigation_anim/size_transition.dart';
import 'package:flutter/material.dart';

class AuthServices {
  //check authentication
  void checkAuthState(BuildContext context) async {
    String privatekey = await readData(LSENCRYPTEDPRIVATEKEY);
    String address = await readData(LSENCRYPTEDADDRESS);
    if (address != null && privatekey != null) {
      Navigator.push(context, FadeRoute(page: MainBottomBar()));
    } else {
      Navigator.push(context, FadeRoute(page: IntroScreen()));
    }
  }

  void clearData(BuildContext context) async {
    await deleteAllData();
    Navigator.pushAndRemoveUntil(
        context, FadeRoute(page: IntroScreen()), (route) => false);
  }

  Future<bool> saveWithSeed(
    BuildContext context,
    String seed,
    String password,
  ) async {
    bool validation = false;
    try {
      String privateKey = BlockchainAPi.privateKeyFromMnemonic(seed.trim());
      String data = encryptAESCryptoJS(privateKey, password);
      await writeData(LSENCRYPTEDPRIVATEKEY, data);
      String address =
          await BlockchainAPi().getAddressFromPrivateKey(privateKey);
      await writeData(LSENCRYPTEDADDRESS, address);
      String saved = await readData(LSENCRYPTEDPRIVATEKEY);
      if (saved == null) {
        GetXSnackBar()
            .errorMessage("Can't validate", "Please try again later..");
        validation = false;
      } else {
        validation = false;
        Navigator.push(context, SizeRoute(page: MainBottomBar()));
      }
    } catch (e) {
      validation = false;
      GetXSnackBar().errorMessage("Can't validate", "Please try again later..");
      debugPrint("error::saveuser::catch $e");
    }
    return validation;
  }

  Future<bool> saveWithPrivateKey(
    BuildContext context,
    String privateKey,
    String password,
  ) async {
    bool validation = false;
    try {
      String data = encryptAESCryptoJS(privateKey, password);
      await writeData(LSENCRYPTEDPRIVATEKEY, data);
      String address = await BlockchainAPi().getAddressFromPrivateKey(data);
      await writeData(LSENCRYPTEDADDRESS, address);
      String saved = await readData(LSENCRYPTEDPRIVATEKEY);
      if (saved == null) {
        GetXSnackBar()
            .errorMessage("Can't validate", "Please try again later..");
        validation = false;
      } else {
        validation = false;
        Navigator.push(context, SizeRoute(page: MainBottomBar()));
      }
    } catch (e) {
      validation = false;
      GetXSnackBar().errorMessage("Can't validate", "Please try again later..");
      debugPrint("error::saveuser::catch $e");
    }
    return validation;
  }
}
