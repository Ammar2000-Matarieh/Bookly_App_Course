import 'package:bookly/core/utils/functions/custom_snack.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchedCustomUrl(context, String? url) async {
  // check null value in api :
  if (url != null) {
    final Uri uri = Uri.parse(url);
    //volumeInfo.previewLink!
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      customSnack(context, "Cannot Lunched $url");
    }
  }
}
