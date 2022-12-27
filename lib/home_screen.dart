import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:get/get.dart';
import 'package:image_slider_webview/carousel_slider.dart';
import 'package:image_slider_webview/navbarScreen.dart';
import 'package:image_slider_webview/timerAngle.dart';
import 'package:image_slider_webview/utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

enum EggType { soft, hard }

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController(initialPage: 0);
  int currentPage = 0;
  late Timer timer;
  late Timer timer1;

  EggType? eggType;
  /////////////////// asign timer value
  Map<EggType, double> cookPeriod = {EggType.soft: 0.10};
  double remainingTime = 0;
  bool counting = false;

  bool info = false;

  bool isPageshow = false;

  @override
  void initState() {
    super.initState();
    //slider time
    _startTimer();
    timetochange();

    eggType = EggType.soft;
    _startTimer();
  }

  timetochange() {
    // _startTimer();
    timer1 = Timer.periodic(Duration(seconds: 10), (timer1) {
      print("currentPage ${currentPage}");
      print("timer1 ${timer1.isActive}");
      if (currentPage < images.length - 1) {
        _startTimer();

        currentPage++;
        print("currentPage ${currentPage}");
        _startTimer();
      } else {
        _startTimer();
        currentPage = 0;
        print("currentPage ${currentPage}");
        _startTimer();
      }
      _pageController.animateToPage(currentPage,
          duration: Duration(milliseconds: 250), curve: Curves.easeIn);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      height: Get.height,
      width: Get.width,
      child: GestureDetector(
        onTap: () {
          setState(() {});
          isPageshow = true;
          // Get.to(NavBarScreen(
          //   data: images[currentPage],
          // ));
        },
        child: Stack(
          children: [
            // isPageshow == true
            //     ? Container(
            //         height: Get.height * 0.8,
            //         child: NavBarScreen(data: images[currentPage]),
            //       )
            //     : Container(),
            Positioned(
              top: 0,
              child: Container(
                height: Get.height * 0.8,
                color: Colors.blue,
                // child: NavBarScreen(data: images[currentPage]),
              ),
            ),

            PageView(
              controller: _pageController,
              children: carouselItems,
              onPageChanged: (int page) {
                // print(page);
                // print(carouselItems[0]);
                setState(() {
                  _startTimer();
                  currentPage = page;
                  images[page];
                });
              },
            ),
            Positioned(
              right: 300,
              // left: 0,
              top: 200,
              child: Center(
                child: Container(
                  height: Get.height * 0.3,
                  width: Get.height * 0.3,
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "${images[currentPage]["description"]}",
                    style: TextStyle(color: Colors.amber),
                  ),
                ),
              ),
            ),
            /////////////////////
            Positioned(
              bottom: 10.h,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(height: 100.h, child: Image.asset("assets/NS.png")),
                  // Container(height: 80.h, child: _renderEggImage()),
                ],
              ),
            ),
            ///////////////////
            Positioned(
              bottom: 15.h,
              left: 102.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(height: 90.h, child: _renderEggImage()),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }

  _resetRemainingTime() {
    setState(() {
      remainingTime = (cookPeriod[eggType]! * 60);
    });
  }

  _twoDigits(int n) {
    return n.toString().padLeft(2, "0");
  }

  _cancelTimer() {
    if (timer != null) {
      timer.cancel();
      // timer =
      // _resetRemainingTime();
      // _startTimer();
    }
    setState(() {
      counting = false;
    });
  }

  _tick() {
    setState(() {
      remainingTime -= 1;
      if (remainingTime <= 0) {
        _cancelTimer();
        _resetRemainingTime();
      }
    });
  }

  _startTimer() {
    if (counting) {
      _cancelTimer();
      _resetRemainingTime();
    } else {
      timer = Timer.periodic(Duration(seconds: 1), (_) {
        _tick();
      });
      setState(() {
        counting = true;
      });
    }
  }

  Widget _renderEggImage() {
    String imgPath = 'assets/c.png';
    final totalTime = cookPeriod[eggType]! * 60;
    final percent = remainingTime / totalTime;

    return CustomPaint(
      // size: Size.fromHeight(2),
      foregroundPainter: EggOverlay(bgColor: Colors.black, percent: percent),
      child: CircleAvatar(
        radius: 100.0.r,
        backgroundColor: Colors.grey,
        child: Image.asset(imgPath),
      ),
    );
  }
}
