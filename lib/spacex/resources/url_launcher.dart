// ignore_for_file: deprecated_member_use

import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
