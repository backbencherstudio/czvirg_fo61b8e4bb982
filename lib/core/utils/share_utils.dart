import 'package:share_plus/share_plus.dart';

class ShareUtils {
  ShareUtils._();

  /// Shares a message with a title and a link using the device's native share dialog.
  /// 
  /// [title] The title of the content being shared.
  /// [url] The link to the content.
  /// [messagePrefix] An optional custom message before the URL. Defaults to 'Check this out 👇'.
  static Future<void> shareContent({
    required String title,
    required String url,
    String messagePrefix = 'Check this out 👇',
  }) async {
    final String shareMessage = "$title\n\n$messagePrefix\n$url";
    
    // Uses the share_plus package to invoke the native share dialog
    await SharePlus.instance.share(
      ShareParams(
        text: shareMessage,
        title: title, // Optional but good practice where supported
      ),
    );
  }
}
