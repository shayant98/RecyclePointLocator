import 'package:rpl/app/app.locator.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:url_launcher/url_launcher.dart';

class SupportViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  void navigateToHome() {
    _navigationService.back();
  }

  Future<void> navigateToGoogleMaps() async {
    final String latitude = '5.829474';
    final String longitude = '-55.205778';
    String googleUrl = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    await _launchLink(googleUrl);
  }

  Future<void> navigateToPhone() async {
    await _launchLink("tel://7113929");
  }

  navigateToWebsite() async {
    await _launchLink("http://suresur.green");
  }

  _launchLink(link) async {
    try {
      if (await canLaunch(link)) {
        await launch(link);
      }
    } catch (e) {}
  }
}
