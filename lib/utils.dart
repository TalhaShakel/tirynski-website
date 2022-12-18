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

List<Widget> carouselItems = images
    .map((cimages) => Container(
      child: Image.network(
        cimages["images"],
        fit: BoxFit.cover,
      ),
    ))
    .toList();
