import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MaterialApp(
      home: HomeScreen(),
    ),
  );
}

class HomeScreen extends StatelessWidget {

  // 웹뷰 컨트롤러 선언
  final WebViewController webViewController = WebViewController()
  ..loadRequest(Uri.parse('https://github.com/SuuuHyeon'))
  ..setJavaScriptMode(JavaScriptMode.unrestricted);

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('웹뷰 테스트'),
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
      ),
      body: WebViewWidget(controller: webViewController),
    );
  }
}
