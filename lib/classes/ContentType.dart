import 'dart:math';
import 'package:uuid/uuid.dart';

import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

final faker = Faker();
final _random = Random();

int randomNum() => 1 + _random.nextInt(75 - 1);
String randomImage() => "https://picsum.photos/1000?image=${randomNum()}";

List mediaUrls = [
  // 9:16
  'https://assets.mixkit.co/videos/preview/mixkit-man-runs-past-ground-level-shot-32809-large.mp4',

  // 16:9
  'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
];

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

class ContentType {
  String id;
  String title;
  String creatorName;
  String creatorAvatarUrl;
  String soundTitle;
  String caption;
  String image;
  String subTitle;
  String mediaUrl;
  int countLikes;
  int countComments;
  int countBookmarks;
  int countShares;
  MaterialColor materialColor;

  ContentType(
      {Key? key,
      this.id = '',
      this.image = '',
      this.creatorAvatarUrl = '',
      this.title = '',
      this.creatorName = '',
      this.caption = '',
      this.subTitle = '',
      this.countLikes = 0,
      this.countComments = 0,
      this.countBookmarks = 0,
      this.countShares = 0,
      this.soundTitle = '',
      this.mediaUrl = '',
      this.materialColor = Colors.red});

  List<ContentType> createSampleList() {
    List<ContentType> contentType = <ContentType>[];
    for (var i = 0; i < 30; i++) {
      var uuid = const Uuid();

      contentType.add(
        ContentType(
            id: uuid.v1(),
            creatorName: faker.person.name(),
            caption: faker.lorem.sentences(1).join(),
            soundTitle: faker.lorem.words(3).join(' '),
            countLikes: faker.randomGenerator.integer(50000, min: 100),
            countComments: faker.randomGenerator.integer(1000, min: 10),
            countBookmarks: faker.randomGenerator.integer(2000, min: 10),
            countShares: faker.randomGenerator.integer(50000, min: 100),
            image: randomImage(),
            mediaUrl: mediaUrls[_random.nextInt(mediaUrls.length)],
            materialColor: colors[_random.nextInt(colors.length)]),
      );
    }
    return contentType;
  }
}

final mediaList = ContentType().createSampleList();
