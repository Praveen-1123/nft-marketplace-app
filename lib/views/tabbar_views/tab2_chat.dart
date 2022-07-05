import 'package:nft/services/auth/auth_services_v2.dart';
import 'package:flutter/material.dart';

class MainChatPage extends StatefulWidget {
  const MainChatPage({Key key}) : super(key: key);

  @override
  _MainChatPageState createState() => _MainChatPageState();
}

class _MainChatPageState extends State<MainChatPage> {
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            AuthServicesV2().signOut(context);
          },
          child: Text(
            "Chats",
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
