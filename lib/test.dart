import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_slider_webview/carousel_slider.dart';
import 'package:image_slider_webview/home_screen.dart';
import 'package:image_slider_webview/utils.dart';

class test extends StatefulWidget {
  test({super.key});

  @override
  State<test> createState() => _testState();
}

class _testState extends State<test> {

  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('admin').snapshots();

  int currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _usersStream,
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: Text("Loading...."));
          } else if (snapshot.connectionState == ConnectionState.active ||
              snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const Text('Error');
            } else if (snapshot.hasData) {
              //  data = snapshot.data;
              // // List imagedata = data["imageData"];
              // print(data);
              // return Text("${data["title"]}");
              // var dd = snapshot.data!.docs;
              // print(dd.id);
              return Container(
                child: ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      // images.add( snapshot.data?.docs[index].data());
                      // d.add(data);
                      // print(d!["imageL"]);
                      // print(images);
                      // d.add(data);
                      // k = snapshot.data!.docs;
                      // List k = [
                      //   {data}
                      // ];
                      // d = [data];
                      // // print(k);

                      // List<Widget> i = k
                      //     .map((cimages) => Container(
                      //           child: Image.network(
                      //             cimages["imageL"],
                      //             fit: BoxFit.cover,
                      //           ),
                      //         ))
                      //     .toList();

                      // Map singleImageData = imagedata[index];
                      // print(data!.id);
                      return ElevatedButton(
                          onPressed: () async {
                            // print("object");
                            await firestore_get();
                            // Get.to(() => HomePage());
                          },
                          child: Text("data"));
                      // return Image.network("${data["imageL"]}");
                      // return PageView(
                      //   controller: _pageController,
                      //   children: carouselItems,
                      //   onPageChanged: (int page) {
                      //     // print(page);
                      //     // print(carouselItems[0]);
                      //     setState(() {
                      //       // _startTimer();
                      //       currentPage = page;
                      // da[page];
                      //     });
                      //   },
                      // );
                    }),
              );
            }
          }
          return Container();
        });
  }
}

// List<Widget> i = d
//     .map((cimages) => Container(
//           child: Image.network(
//             cimages["imageL"],
//             fit: BoxFit.cover,
//           ),
//         ))
//     .toList();

// List k = [];