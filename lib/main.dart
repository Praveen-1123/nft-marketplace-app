import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:nft/utils/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nft/views/welcome/splash_screen.dart';
import 'constants/strings.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  await GetStorage.init();
  runApp(NftMarket(themeMode: savedThemeMode));
}

class NftMarket extends StatefulWidget {
  final themeMode;
  const NftMarket({Key key, @required this.themeMode}) : super(key: key);

  @override
  _NftMarketState createState() => _NftMarketState();
}

class _NftMarketState extends State<NftMarket> {
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: Themes().lightTheme,
      dark: Themes().darkTheme,
      initial: widget.themeMode ?? AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme,
        darkTheme: darkTheme,
        title: APPNAME,
        home: SplashScreen(),
      ),
    );
  }
}
