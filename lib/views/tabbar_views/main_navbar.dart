import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:nft/views/tabbar_views/tab1_nft.dart';
import 'package:nft/views/tabbar_views/tab2_chat.dart';
import 'package:nft/views/tabbar_views/tab3_social.dart';
import 'package:nft/views/tabbar_views/tab4_wallet.dart';
import 'package:nft/views/tabbar_views/tab5_profile.dart';

class MainBottomBar extends StatefulWidget {
  const MainBottomBar({Key key}) : super(key: key);

  @override
  _MainBottomBarState createState() => _MainBottomBarState();
}

class _MainBottomBarState extends State<MainBottomBar> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      body: IndexedStack(
        index: _index,
        children: [
          MainNftPage(),
          MainChatPage(),
          MainSocialPage(),
          MainWalletPage(),
          MainProfilePage(),
        ],
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(bottom: 30, left: 5, right: 5),
        child: GNav(
          gap: 10,
          iconSize: 25,
          haptic: false,
          tabBorderRadius: 15,
          selectedIndex: _index,
          curve: Curves.decelerate,
          activeColor: theme.canvasColor,
          tabBackgroundColor: theme.cardColor,
          duration: Duration(milliseconds: 200),
          color: theme.canvasColor.withOpacity(0.7),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          onTabChange: (value) {
            _index = value;
            setState(() {});
          },
          tabs: [
            GButton(icon: LineIcons.store, text: 'Home'),
            GButton(icon: LineIcons.facebookMessenger, text: 'Chat'),
            GButton(icon: LineIcons.heart, text: 'Social'),
            GButton(icon: LineIcons.wallet, text: 'Wallet'),
            GButton(icon: LineIcons.user, text: 'Profile')
          ],
        ),
      ),
    );
  }
}
