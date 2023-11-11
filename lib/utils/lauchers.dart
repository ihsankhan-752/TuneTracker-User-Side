import 'package:url_launcher/url_launcher.dart';

class AppLaunchers {
  static launchFacebook() async {
    const facebookAppUrl = 'https://www.facebook.com/flickradio';
    const fallbackUrl = 'https://www.facebook.com/flickradio';

    try {
      bool canLaunchInApp = await canLaunchUrl(Uri.parse(facebookAppUrl));

      if (canLaunchInApp) {
        await launchUrl(Uri.parse(facebookAppUrl));
      } else {
        await launchUrl(Uri.parse(fallbackUrl));
      }
    } catch (e) {
      await launchUrl(Uri.parse(fallbackUrl));
    }
  }

  static launchInstagram() async {
    const instagramAppUrl = 'https://www.instagram.com/flickradio';
    const fallbackUrl = 'https://www.instagram.com/flickradio';

    try {
      bool canLaunchInApp = await canLaunchUrl(Uri.parse(instagramAppUrl));

      if (canLaunchInApp) {
        await launchUrl(Uri.parse(instagramAppUrl));
      } else {
        await launchUrl(Uri.parse(fallbackUrl));
      }
    } catch (e) {
      await launchUrl(Uri.parse(fallbackUrl));
    }
  }

  static launchEmail() async {
    const email = 'mailto:hello@flick.fm';

    if (!await canLaunchUrl(Uri.parse(email))) {
      await launchUrl(Uri.parse(email));
    } else {
      throw 'Could not launch $email';
    }
  }

  void launchSpotifyUrl(String url) async {
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }
}
