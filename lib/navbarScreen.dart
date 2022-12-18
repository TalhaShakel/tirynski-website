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
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Color(0xff054f72),
          leading: IconButton(
            icon: Icon(
              Icons.home,
              size: 40,
            ),
            onPressed: () {},
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Row(
                  children: [
                    Text(
                      "EN: Change Language",
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
                "About the Talk",
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
          )),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
              height: 500,
              width: Get.width,
              child: Image(
                image: AssetImage("assets/ss.png"),
                fit: BoxFit.fitWidth,
              )),
          Container(
            height: 100,
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
                  Text(
                    "Download de Tyrinski app in de google play store",
                    style: TextStyle(fontSize: 25, color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
          //////////////////////////
          Container(
            height: 200,
            width: Get.width,
            color: Color(0xffcccccc),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Download de Tyrinski app in de google play store",
                  style: TextStyle(fontSize: 25, color: Colors.black),
                ),
                Text(
                  "Download de Tyrinski app in de google play store",
                  style: TextStyle(fontSize: 25, color: Colors.black),
                ),
              ],
            ),
          ),
          /////////////////////////////
          Container(
            height: 300,
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
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.all(8.0),
                      height: 250.h,
                      // width: 100.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        image: DecorationImage(
                          image: AssetImage("assets/c.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 80.0.r,
                          backgroundImage: NetworkImage("${data["images"]}"),
                          backgroundColor: Colors.transparent,
                        ),
                      ),
                    ),
                  ),
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
                          "${data["text2"]} ",
                          softWrap: true,
                          style:
                              TextStyle(fontSize: 18.sp, color: Colors.black),
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
          SizedBox(
            height: 50.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: defaultpadding),
            child: Text(
              "${data["text"]} ",
              softWrap: true,
              style: TextStyle(fontSize: 18.sp, color: Colors.black),
            ),
          ),
          SizedBox(
            height: 100.h,
          )
        ]),
      ),
    );
  }
}
