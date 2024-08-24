import 'package:books_app/controller/bookdetailscontroller.dart';
import 'package:books_app/core/services/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

class Booksdetails extends StatelessWidget {
  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  BookController bookcontroller = Get.put(BookController());
  MyServices myservices = Get.put(MyServices());
  Booksdetails({super.key});

  @override
  Widget build(BuildContext context) {
    // Retrieve the arguments
    final Map<String, dynamic> aboutbook = Get.arguments;
    double consta = 100;
    double length = consta * aboutbook['buy_links'].length;
    double finallength = length + 380;

    return Scaffold(
      appBar: AppBar(
        title: Text("Books details".tr),
      ),
      // floatingActionButton: FloatingActionButton(
      //     onPressed: () {
      //       print(myservices.sharedpreferences.getString("lang"));
      //     },
      //     child: Text("C")),
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: aboutbook.isEmpty
            ? Center(child: Lottie.asset("assets/lottie/nodata"))
            : ListView(
              children:[Container(
                  child: Column(
                    children: [
                      SizedBox(height: 5),
                      // Book image and rank
                      Row(
                        children: [
                          Container(
                            width: 220,
                            height: 220,
                            decoration: BoxDecoration(
                              border: const Border(
                                bottom: BorderSide(width: 16.0, color: Colors.grey),
                                top: BorderSide(width: 16.0, color: Colors.grey),
                              ),
                              borderRadius: BorderRadius.circular(55),
                              color: Colors.blue,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Image.network(
                                aboutbook['book_image'] ??
                                    'https://i.pinimg.com/564x/91/a6/49/91a64924e129124f5e1080c628613e6c.jpg',
                                height: 50,
                                errorBuilder: (context, error, stackTrace) {
                                  return Image.asset(
                                    'assets/91a64924e129124f5e1080c628613e6c.jpg',
                                    width: 100,
                                    height: 100,
                                  );
                                },
                              ),
                            ),
                          ),
                          SizedBox(width: 20),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.greenAccent,
                                  borderRadius: BorderRadius.circular(20)),
                              width: 90,
                              height: 50,
                              child: Row(
                                children: [
                                  myservices.sharedpreferences.getString("lang") ==
                                          "en"
                                      ? Padding(
                                          padding: const EdgeInsets.only(left: 20),
                                          child: Text(
                                            "${aboutbook['rank'] ?? 0}",
                                            style: TextStyle(
                                                fontSize: 30, color: Colors.blue),
                                          ),
                                        )
                                      : Padding(
                                          padding: const EdgeInsets.only(right: 20),
                                          child: Text(
                                            "${aboutbook['rank'] ?? 0}",
                                            style: TextStyle(
                                                fontSize: 30, color: Colors.blue),
                                          ),
                                        ),
                                  const Icon(
                                    Icons.star,
                                    size: 50,
                                    color: Colors.yellow,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 25),
                      // Book details (title, author, description)
                      Row(
                        children: [
                          Container(
                            width: 100,
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color.fromARGB(255, 13, 72, 150), width: 8),
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                                child: Text(
                              "title".tr,
                              style: TextStyle(fontSize: 20, color: Colors.black),
                            )),
                          ),
                          Container(
                            width: 240,
                            height: 55,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color.fromARGB(255, 13, 72, 150), width: 8),
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(child: Text(aboutbook['title'] ?? 'No Title')),
                          ),
                        ],
                      ),
                      SizedBox(height: 25),
                      Row(
                        children: [
                          Container(
                            width: 100,
                            height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color.fromARGB(255, 13, 72, 150), width: 8),
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                                child: Text(
                              "author".tr,
                              style: TextStyle(fontSize: 20, color: Colors.black),
                            )),
                          ),
                          Container(
                            width: 240,
                            height: 55,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color.fromARGB(255, 13, 72, 150), width: 8),
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                                child: Text(aboutbook['author'] ?? 'No Author')),
                          ),
                        ],
                      ),
                      SizedBox(height: 25),
                      Row(
                        children: [
                          Container(
                            width: 100,
                            height: 90,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color.fromARGB(255, 13, 72, 150), width: 8),
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                                child: Text(
                              "Des".tr,
                              style: TextStyle(fontSize: 20, color: Colors.black),
                            )),
                          ),
                          Container(
                            width: 240,
                            height: 95,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color.fromARGB(255, 13, 72, 150), width: 8),
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Text(
                                    aboutbook['description'] ?? 'No Description'),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 60),
                      // Buy links
                      Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            width: 800,
                            height: finallength,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.indigo, width: 10),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      ...List.generate(
                                        aboutbook['buy_links'].length,
                                        (int index) => Padding(
                                          padding: const EdgeInsets.all(18.0),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.green,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            margin: EdgeInsets.all(7.0),
                                            height: 120,
                                            width: 150,
                                            child: Center(
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: Text(
                                                  "${'FROM'.tr} ${aboutbook['buy_links'][index]['name']}",
                                                  style: TextStyle(fontSize: 18),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 10,
                                  height: double.infinity,
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.deepPurple[400]!,
                                        Colors.blue,
                                        Colors.green,
                                        Colors.red
                                      ],
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      ...List.generate(
                                        aboutbook['buy_links'].length,
                                        (int index) => Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 45, top: 30),
                                          child: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.blue,
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            margin: EdgeInsets.all(8.0),
                                            height: 80,
                                            width: 150,
                                            child: Center(
                                              child: Padding(
                                                padding: const EdgeInsets.all(8.0),
                                                child: InkWell(
                                                  onTap: () async {
                                                    print("onclik ");
                                                    print(
                                                        aboutbook['buy_links'][index]
                                                            ['url']);
                                                    Uri url = Uri.parse(
                                                        aboutbook['buy_links']
                                                            [index]['url']);
                                                    _launchInBrowser(url);
                                                  },
                                                  child: Text("buy".tr,
                                                      style: TextStyle(
                                                          color: Colors.black)),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            bottom: 850,
                            right: 100,
                            child: Container(
                              width: 150,
                              height: 60,
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                    colors: [Colors.blue, Colors.green]),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Center(
                                child: Text(
                                  "buylinks".tr,
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                ]
            ),
      ),
    );
  }
}
