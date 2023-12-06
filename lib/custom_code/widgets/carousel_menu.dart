// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:carousel_slider/carousel_slider.dart';

class CarouselMenu extends StatefulWidget {
  const CarouselMenu({
    Key? key,
    this.width,
    this.height,
    this.jsonMenuItems,
  }) : super(key: key);

  final double? width;
  final double? height;
  final dynamic jsonMenuItems;

  @override
  _CarouselMenuState createState() => _CarouselMenuState();
}

class _CarouselMenuState extends State<CarouselMenu> {
  List<CarouselItem> carouselItems = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    buildCarouselWidgets();
  }

  void buildCarouselWidgets() {
    for (var data in widget.jsonMenuItems) {
      carouselItems
          .add(CarouselItem(data['imageUrl'], data['title'], data['route']));
    }
  }

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: carouselItems.length,
      itemBuilder: (context, index, realIndex) {
        var item = carouselItems[index];
        var title = item.title;
        var route = item.route;
        var imageUrl = item.imageUrl;
        return GestureDetector(
          onTap: () {
            //context.pushNamed(route);
          },
          child: Column(
            children: [
              Expanded(
                  child:
                      Image.network(imageUrl, fit: BoxFit.cover, width: 1000)),
              Text(title)
            ],
          ),
        );
      },
      options: CarouselOptions(
        autoPlay: false,
        enlargeCenterPage: true,
        aspectRatio: 2.0,
      ),
    );
  }
}

class CarouselItem {
  String imageUrl = "";
  String title = "";
  String route = "";
  CarouselItem(String imageUrl, String title, String route) {
    this.imageUrl = imageUrl;
    this.title = title;
    this.route = route;
  }
}
