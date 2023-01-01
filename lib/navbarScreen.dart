import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

var defaultpadding = Get.width * 0.1;

class NavBarScreen extends StatelessWidget {
  var data;

  NavBarScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    print(data);
    return Container(
      // margin: EdgeInsets.symmetric(horizontal: 400.w),
      color: Color.fromARGB(255, 0, 50, 77),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.08),
        child: Scaffold(
          appBar: AppBar(
              backgroundColor: Color(0xff054f72),
              leading: IconButton(
                icon: Icon(
                  Icons.home,
                  size: 40,
                ),
                onPressed: () {
                  Get.back();
                },
              ),
              title: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Text(
                            // "EN: Change Language",
                            "NL: verander taal",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          Icon(Icons.arrow_drop_down)
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Text(
                      // "About the Talk",
                      "over het gesprek",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Text(
                      "Tirynski",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Text(
                      "Contact",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                    SizedBox(
                      width: 50,
                    )
                  ],
                ),
              )),
          body: SingleChildScrollView(
            child: Column(children: [
              Container(
                  height: 500.h,
                  width: Get.width,
                  child: Image(
                    image: AssetImage("assets/ss.png"),
                    fit: BoxFit.fitWidth,
                  )),
              Container(
                height: 70.h,
                width: Get.width,
                color: Color(0xff8e8e8e),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: defaultpadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage("assets/gp.png"),
                        fit: BoxFit.fitWidth,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        child: Text(
                          "Download de Tyrinski app in de google play store",
                          softWrap: true,
                          style:
                              TextStyle(fontSize: 18.sp, color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              //////////////////////////
              Container(
                height: 180.h,
                width: Get.width,
                color: Color(0xffcccccc),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${data["title"]} ",

                      // "Download de Tyrinski app in de google play store. Download de Tyrinski app in de google play store",

                      style: TextStyle(fontSize: 18.sp, color: Colors.black),
                    ),
                  ],
                ),
              ),
              /////////////////////////////
              Container(
                height: 216.h,
                width: Get.width,
                color: Color(0xff8e8e8e),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: defaultpadding),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // SizedBox(
                      //   width: 100.w,
                      // ),
                      // Container(
                      //   decoration: BoxDecoration(
                      //     image: DecorationImage(
                      //       image: AssetImage("assets/c.png"),
                      //       fit: BoxFit.cover,
                      //     ),
                      //   ),
                      //   child: Image.network(
                      //       "${data["images"]}") /* add child content here */,
                      // ),
                      // CircleAvatar(
                      //   radius: 56,
                      //   backgroundColor: Colors.red,
                      //   child: Padding(
                      //     padding: const EdgeInsets.all(8), // Border radius
                      //     child: ClipOval(
                      //         child: Image.network('${data["images"]}')),
                      //   ),
                      // ),
                      Container(
                        padding: EdgeInsets.all(8), // Border width
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(128, 128, 128, 35),
                            shape: BoxShape.circle),

                        child: Container(
                          padding: EdgeInsets.all(5), // Border width
                          decoration: BoxDecoration(
                              color: Color.fromARGB(255, 250, 175, 35),
                              shape: BoxShape.circle),

                          child: Container(
                            padding: EdgeInsets.all(8), // Border width
                            decoration: BoxDecoration(
                                color: Colors.black, shape: BoxShape.circle),
                            child: ClipOval(
                              child: SizedBox.fromSize(
                                size: Size.fromRadius(48), // Image radius
                                child: Image.network("${data["imageL"]}",
                                    fit: BoxFit.cover),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Padding(

                      //   padding: const EdgeInsets.all(8.0),
                      //   child: Container(
                      //     margin: EdgeInsets.all(8.0),
                      //     height: 200.h,
                      //     // width: 100.w,
                      //     decoration: BoxDecoration(
                      //       borderRadius: BorderRadius.circular(25),
                      //       image: DecorationImage(
                      //         image: AssetImage("assets/c.png"),
                      //         fit: BoxFit.contain,
                      //       ),
                      //     ),
                      //     child: Padding(
                      //       padding: const EdgeInsets.all(18.0),
                      //       child: Image.network(
                      //         "${data["images"]}",
                      //         height: 150,
                      //         width: 150,
                      //         //  fit: BoxFit.contain
                      //       ),
                      //     ),
                      //   ),
                      // ),

                      // Image(
                      //   image: NetworkImage("${data["images"]}"),
                      //   fit: BoxFit.fitWidth,
                      // ),
                      SizedBox(
                        width: 30,
                      ),
                      Expanded(
                        child: Wrap(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              "${data["description"]} ",
                              softWrap: true,
                              style: TextStyle(
                                  fontSize: 14.sp, color: Colors.black),
                            ),
                            // Text(
                            //   "Download de Tyrinski app in de google play store",
                            //   style: TextStyle(fontSize: 12, color: Colors.black),
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              /////////////////
              // SizedBox(
              //   height: 50.h,
              // ),
              // Padding(
              //   padding: EdgeInsets.symmetric(horizontal: defaultpadding),
              //   child: Text(
              //     "${data["text"]} ",
              //     softWrap: true,
              //     style: TextStyle(fontSize: 18.sp, color: Colors.black),
              //   ),
              // ),
              SizedBox(
                height: 100.h,
              )
            ]),
          ),
        ),
      ),
    );
  }
}
