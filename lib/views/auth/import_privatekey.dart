import 'package:animate_do/animate_do.dart';
import 'package:nft/services/auth/auth_services.dart';
import 'package:nft/utils/snackbar.dart';
import 'package:nft/widgets/buttons/flexible_button.dart';
import 'package:nft/widgets/reusables/appbar.dart';
import 'package:nft/widgets/reusables/validate_password.dart';
import 'package:nft/widgets/wallet_msg/wallet_security.dart';
import 'package:flutter/material.dart';

class ImportPrivatekey extends StatefulWidget {
  const ImportPrivatekey({Key key}) : super(key: key);

  @override
  _ImportPrivatekeyState createState() => _ImportPrivatekeyState();
}

class _ImportPrivatekeyState extends State<ImportPrivatekey> {
  TextEditingController _privateKey = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  bool isLoading = false;

  void validateForm() async {
    setState(() {
      isLoading = true;
    });
    if (_privateKey.text.length != 64) {
      GetXSnackBar().errorMessage("Invalid Key", "Please enter a valid Key");
      setState(() {
        isLoading = false;
      });
    } else {
      bool validation = await validatePassword(context, _password);
      if (validation == null) {
        isLoading = false;
        GetXSnackBar()
            .errorMessage("Password required", "Please enter a valid Password");
      } else {
        bool valid = await AuthServices()
            .saveWithSeed(context, _privateKey.text, _password.text);
        if (!valid) {
          isLoading = false;
        }
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: MyAppBar(
        title: "Import with PrivateKey",
        actions: [],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  FadeInRight(
                    delay: const Duration(milliseconds: 400),
                    duration: const Duration(milliseconds: 500),
                    child: Text(
                      "Enter your Private Key",
                      style: TextStyle(
                        fontSize: 40,
                        fontFamily: 'Orbitron',
                        fontWeight: FontWeight.bold,
                        color: theme.textTheme.headline1.color,
                      ),
                    ),
                  ),
                  FadeInRight(
                    delay: const Duration(milliseconds: 500),
                    duration: const Duration(milliseconds: 500),
                    child: Container(
                      alignment: Alignment.center,
                      padding:
                          const EdgeInsets.only(left: 5, top: 30, bottom: 5),
                      child: Text(
                        "Enter your private key here to restore your wallet!",
                        style: TextStyle(
                          color: theme.textTheme.bodyText1.color,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  FadeInRight(
                    delay: const Duration(milliseconds: 600),
                    duration: const Duration(milliseconds: 500),
                    child: Container(
                      width: size.width,
                      padding: const EdgeInsets.only(left: 5),
                      child: TextField(
                        maxLines: 3,
                        controller: _privateKey,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(12.0)),
                            borderSide:
                                BorderSide(color: theme.focusColor, width: 2),
                          ),
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: theme.focusColor, width: 2),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10.0)),
                          ),
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            color: theme.textTheme.bodyText1.color,
                          ),
                          hintText: 'Enter the Private Key',
                        ),
                        style: TextStyle(
                          fontSize: 15,
                          color: theme.textTheme.headline1.color,
                        ),
                      ),
                    ),
                  ),
                  FadeInRight(
                    delay: const Duration(milliseconds: 700),
                    duration: const Duration(milliseconds: 500),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: FlexibleButton(
                        onPressed: () => validateForm(),
                        isLoading: isLoading,
                        text: isLoading ? "IMPORTING..." : "IMPORT",
                        width: size.width / 2,
                        margin: EdgeInsets.only(top: 10),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: size.height / 6,
              ),
              FadeIn(
                delay: const Duration(milliseconds: 1000),
                duration: const Duration(milliseconds: 500),
                child: WalletSecurityNote(),
              ),
              SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
