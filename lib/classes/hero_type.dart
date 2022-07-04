import 'dart:math';
import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

final faker = Faker();
final _random = Random();

int randomNum() => 1 + _random.nextInt(75 - 1);
String randomImage() => "https://picsum.photos/250?image=${randomNum()}";

List colors = [
  Colors.red,
  Colors.amber,
  Colors.lightGreen,
  Colors.lightBlue,
  Colors.deepOrange,
  Colors.teal,
  Colors.lime,
  Colors.brown,
  Colors.blueGrey,
  Colors.red,
  Colors.indigo,
  Colors.pink,
];

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
    for (var i = 0; i < 10; i++) {
      heroType.add(
        HeroType(
            title: faker.job.title(),
            subTitle: faker.lorem.sentences(5).join(),
            image: randomImage(),
            materialColor: colors[_random.nextInt(colors.length)]),
      );
    }
    return heroType;
  }
}
