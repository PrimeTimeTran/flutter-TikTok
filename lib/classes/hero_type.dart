import 'dart:math';
import 'package:flutter/material.dart';


final _random = Random();

int randomNum() => 1 + _random.nextInt(75 - 1);
String randomImage() => "https://picsum.photos/250?image=${randomNum()}";

class HeroType {
  String title;
  String subTitle;
  String image;
  MaterialColor materialColor;

  HeroType(
      {Key? key,
      this.title = '',
      this.subTitle = '',
      this.image = '',
      this.materialColor = Colors.red});

  List<HeroType> createSampleList() {
    List<HeroType> heroType = <HeroType>[];
    return heroType
      ..add(HeroType(
          title: 'Amber',
          subTitle: 'Lorem ipsum dolor sit amet',
          image: randomImage(),
          materialColor: Colors.amber))
      ..add(HeroType(
          title: 'Light Green',
          subTitle: 'Consectetur adipiscing elit',
          image: randomImage(),
          materialColor: Colors.lightGreen))
      ..add(HeroType(
          title: 'Light Blue',
          subTitle:
              'Sed do eiusmod tempor incididunt - Placerat ullamcorper nulla, nulla potenti consequat sem. Sed molestie litora. Sit diam lorem. Fringilla purus pharetra, pretium quam sed et. Ultricies at facilisis vehicula sit etiam urna, quis pellentesque, congue erat posuere auctor aut mauris, consequat ipsum aenean. Imperdiet iaculis quis lorem, arcu praesent leo cras placerat. Dapibus ligula risus eros curae, neque lobortis nunc libero dolor ac.',
          image: randomImage(),
          materialColor: Colors.lightBlue))
      ..add(HeroType(
          title: 'Deep Orange',
          subTitle: 'Ut labore et dolore magna aliqua',
          image: randomImage(),
          materialColor: Colors.deepOrange))
      ..add(HeroType(
          title: 'Teal',
          subTitle: 'Enim ad minim veniam',
          image: randomImage(),
          materialColor: Colors.teal))
      ..add(HeroType(
          title: 'Lime',
          subTitle: 'Duis aute irure dolor in reprehenderit',
          image: randomImage(),
          materialColor: Colors.lime))
      ..add(HeroType(
          title: 'Brown',
          subTitle: 'Eum ea dolore repudiandae',
          image: randomImage(),
          materialColor: Colors.brown))
      ..add(HeroType(
          title: 'Blue Grey',
          subTitle: 'Tollit docendi scriptorem nec id',
          image: randomImage(),
          materialColor: Colors.blueGrey))
      ..add(HeroType(
          title: 'Red',
          subTitle: 'Eros eruditi fierent mel et',
          image: randomImage(),
          materialColor: Colors.red))
      ..add(HeroType(
          title: 'Indigo',
          subTitle: 'Eros eruditi fierent mel et',
          image: randomImage(),
          materialColor: Colors.indigo))
      ..add(HeroType(
          title: 'Pink',
          subTitle: 'Veniam scripserit ad eum',
          image: randomImage(),
          materialColor: Colors.pink));
  }
}
