import 'package:nft/utils/themes/themes_helper.dart';
import 'package:flutter/material.dart';

class MainNftPage extends StatefulWidget {
  const MainNftPage({Key key}) : super(key: key);

  @override
  _MainNftPageState createState() => _MainNftPageState();
}

class _MainNftPageState extends State<MainNftPage> {
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
            "NFTs",
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
