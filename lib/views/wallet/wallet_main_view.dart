import 'package:nft/utils/themes/themes_helper.dart';
import 'package:flutter/material.dart';

class MainWalletPage extends StatefulWidget {
  const MainWalletPage({Key key}) : super(key: key);

  @override
  _MainWalletPageState createState() => _MainWalletPageState();
}

class _MainWalletPageState extends State<MainWalletPage> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            ThemesHelper().toggleTheme(context);
          },
          child: Text(
            "Wallet",
            style: TextStyle(
              fontSize: 30,
              fontFamily: 'Orbitron',
              fontWeight: FontWeight.bold,
              color: theme.textTheme.headline1.color,
            ),
          ),
        ),
      ),
    );
  }
}
