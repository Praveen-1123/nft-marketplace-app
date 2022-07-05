import 'package:url_launcher/url_launcher.dart';

class Api {
  void launchURL(String url) async {
    if (!await launchUrl(Uri.tryParse(url))) throw 'Could not launch $url';
  }
}
