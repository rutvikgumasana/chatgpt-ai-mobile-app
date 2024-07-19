import 'package:chat_gpt_app/components/snackbar.dart';
import 'package:url_launcher/url_launcher.dart';

// ------------ Common Functionality -------------

class CommonMethod {
  DateTime currentUtcTime(String utcTime) {
    DateTime utcDateTime = DateTime.parse(utcTime.toString()).toUtc().toLocal();
    String formattedDateTime = utcDateTime.toString();
    return DateTime.parse(formattedDateTime);
  }

  Future<void> onShareButtonPressed({required String launchUrlLink, required String launchUrlName}) async {
    if (launchUrlLink.isNotEmpty) {
      String webSiteUrl = launchUrlLink;
      if (launchUrlLink.startsWith('http://') || launchUrlLink.startsWith('https://')) {
        webSiteUrl = launchUrlLink;
      } else {
        webSiteUrl = 'http://$launchUrlLink';
      }

      try {
        if (await canLaunchUrl(Uri.parse(webSiteUrl))) {
          await launchUrl(Uri.parse(webSiteUrl), mode: LaunchMode.externalApplication);
        } else {
          CustomSnackBar.showGetXSnackBar(toastType: ToastType.error, message: "Enable to redirect $launchUrlName");
        }
      } catch (error) {
        throw ("Cannot Open $launchUrlName");
      }
    } else {
      CustomSnackBar.showGetXSnackBar(toastType: ToastType.error, message: "$launchUrlName not available");
    }
  }
}
