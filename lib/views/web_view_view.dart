import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewView extends StatelessWidget {
  static const String id = "/WebViewView";

  const WebViewView({super.key});

  @override
  Widget build(BuildContext context) {
    var isLoading = true.obs;
    final String url = Get.arguments as String;

    var navigationDelegate = NavigationDelegate(
      onPageStarted: (url) => isLoading(true),
      onPageFinished: (url) => isLoading(false),
    );

    return SafeArea(
      child: Stack(
        children: [
          WebViewWidget(
            controller: WebViewController()
              ..setJavaScriptMode(JavaScriptMode.unrestricted)
              ..setNavigationDelegate(navigationDelegate)
              ..canGoBack()
              ..canGoForward()
              ..loadRequest(Uri.parse(url)),
          ),
          Obx(
            () => ModalProgressHUD(
              inAsyncCall: isLoading.value,
              child: Container(),
            ),
          ),
        ],
      ),
    );
  }
}
