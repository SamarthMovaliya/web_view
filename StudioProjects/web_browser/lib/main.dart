import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

void main() {
  runApp(const myApp());
}

class myApp extends StatefulWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  State<myApp> createState() => _myAppState();
}

class _myAppState extends State<myApp> {
  InAppWebViewController? inAppWebView;
  List myBookmarks = [];
  PullToRefreshController? pullToRefreshController;

  @override
  void initState() {
    pullToRefreshController = PullToRefreshController(
      onRefresh: () {
        inAppWebView?.reload();
      },
      options: PullToRefreshOptions(color: Colors.blue.shade900),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Flutter',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 30,
            ),
          ),
          backgroundColor: Colors.transparent,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blue.shade900,
                  Colors.blue.shade600,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),
          elevation: 0,
        ),
        body: InAppWebView(
          pullToRefreshController: pullToRefreshController,
          onLoadStop: (controller, url) async {
            await pullToRefreshController?.endRefreshing();
          },
          onWebViewCreated: (controller) {
            setState(() {
              inAppWebView = controller;
            });
          },
          initialUrlRequest: URLRequest(
            url: Uri.parse(
              'https://pub.dev/',
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          height: 45,
          width: 320,
          decoration: BoxDecoration(
            color: Colors.grey.shade500,
            borderRadius: BorderRadius.circular(100),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade900,
                  offset: const Offset(2, 3),
                  blurRadius: 10),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                onPressed: () async {
                  await inAppWebView?.loadUrl(
                    urlRequest: URLRequest(
                      url: Uri.parse('https://pub.dev/'),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.home,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () async {
                  await inAppWebView?.goForward();
                },
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () async {
                  await inAppWebView?.reload();
                },
                icon: const Icon(
                  Icons.refresh,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () async {
                  await inAppWebView?.goBack();
                },
                icon: const Icon(
                  Icons.arrow_back_ios_rounded,
                  color: Colors.white,
                ),
              ),
              IconButton(
                onPressed: () async {
                  Uri? uri = await inAppWebView?.getUrl();
                  String url = uri.toString();
                  myBookmarks.add(url);
                },
                icon: const Icon(
                  Icons.bookmark_add_outlined,
                  color: Colors.white,
                ),
              ),
              Builder(builder: (context) {
                return IconButton(
                  onPressed: () {
                    showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (context) => AlertDialog(
                        actions: [
                          ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Back')),
                        ],
                        title: const Text(
                          'My Bookmarks',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 30),
                        ),
                        content: SingleChildScrollView(
                          child: Column(
                            children: myBookmarks
                                .map(
                                  (e) => Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: Row(
                                      children: [
                                        const Icon(Icons.bookmarks),
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        GestureDetector(
                                          onTap: () async {
                                            Navigator.pop(context);
                                            await inAppWebView?.loadUrl(
                                              urlRequest: URLRequest(
                                                url: Uri.parse(e),
                                              ),
                                            );
                                          },
                                          child: Text(e),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.bookmarks,
                    color: Colors.white,
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
