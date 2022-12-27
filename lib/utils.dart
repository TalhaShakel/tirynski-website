import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:get/get.dart';
import 'package:image_slider_webview/carousel_slider.dart';

setwal(context, path) async {
  int location = WallpaperManager.BOTH_SCREEN;
  var file = await DefaultCacheManager().getSingleFile(path);
  bool result =
      await WallpaperManager.setWallpaperFromFile(file.path, location);
  Navigator.of(context).pop();
}

infoimage(txt, onPressed) {
  return SingleChildScrollView(
    child: Column(
      children: [
        Text(
          "$txt",
          style: TextStyle(),
        ),
        ElevatedButton(onPressed: onPressed, child: Text("Back to image"))
      ],
    ),
  );
}
firestore_get() async {
  CollectionReference  userData =
      await FirebaseFirestore.instance.collection("admin");
  Stream<QuerySnapshot> _ = userData.snapshots();
  // print(userData);
  userData.doc();
  userData .get() .then((value)  {
    print(value.docs);
    value.docs.forEach((_) {
     images.add(_.data());
      //  print(_.data());
      }
    );
  });
  print(images2);
 
}
List images2 =[];

List<Widget> carouselItems = images
    .map((cimages) => Container(
      child: Image.network(
        cimages["imageL"].toString().trim(),
        fit: BoxFit.cover,
      ),
    ))
    .toList();
