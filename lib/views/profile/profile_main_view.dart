import 'package:nft/utils/themes/themes_helper.dart';
import 'package:flutter/material.dart';

class MainProfilePage extends StatefulWidget {
  const MainProfilePage({Key key}) : super(key: key);

  @override
  _MainProfilePageState createState() => _MainProfilePageState();
}

class _MainProfilePageState extends State<MainProfilePage> {
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
            "Profile",
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
