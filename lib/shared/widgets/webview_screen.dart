import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jala/shared/colors.dart';
import 'package:jala/shared/text_styles.dart';
import 'package:share_plus/share_plus.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewScreen extends StatelessWidget {
  final String title;
  final Uri url;

  WebviewScreen({
    super.key,
    required this.title,
    required this.url,
  });

  final progress = 0.0.obs;
  @override
  Widget build(BuildContext context) {
    final webController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            print(progress / 100);
            this.progress(progress / 100);
          },
          onPageStarted: (String url) {},
          onPageFinished: (String url) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(url);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: textWhite(fontSize: 18),
        ),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              final message = '$title\n$url';
              Share.share(message);
            },
            icon: const Icon(Icons.share_outlined),
          )
        ],
      ),
      body: Column(
        children: [
          Obx(
            () => Visibility(
              visible: progress.value < 1,
              child: LinearProgressIndicator(
                value: progress.value.toDouble(),
                color: primaryColor,
              ),
            ),
          ),
          Expanded(
            child: WebViewWidget(controller: webController),
          )
        ],
      ),
    );
  }
}
