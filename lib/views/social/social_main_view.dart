import 'package:nft/utils/themes/themes_helper.dart';
import 'package:flutter/material.dart';

class MainSocialPage extends StatefulWidget {
  const MainSocialPage({Key key}) : super(key: key);

  @override
  _MainSocialPageState createState() => _MainSocialPageState();
}

class _MainSocialPageState extends State<MainSocialPage> {
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
            "Social",
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
