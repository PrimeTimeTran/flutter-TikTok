import 'dart:math';
import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

final faker = Faker();
final _random = Random();

int randomNum() => 1 + _random.nextInt(75 - 1);
String randomImage() => "https://picsum.photos/1000?image=${randomNum()}";

List mediaUrls = [
  // 9:16
  'https://assets.mixkit.co/videos/preview/mixkit-man-under-multicolored-lights-1237-large.mp4',
  'https://assets.mixkit.co/videos/preview/mixkit-womans-feet-splashing-in-the-pool-1261-large.mp4',
  'https://assets.mixkit.co/videos/preview/mixkit-silhouette-of-urban-dancer-in-smoke-33898-large.mp4',
  'https://assets.mixkit.co/videos/preview/mixkit-tree-with-yellow-flowers-1173-large.mp4',
  'https://assets.mixkit.co/videos/preview/mixkit-man-runs-past-ground-level-shot-32809-large.mp4',

  // 16:9
  'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
  'https://assets.mixkit.co/videos/preview/mixkit-sunset-over-the-coast-of-florida-24550-large.mp4',
  'https://assets.mixkit.co/videos/preview/mixkit-florida-state-flag-18081-large.mp4'
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
      contentType.add(
        ContentType(
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
