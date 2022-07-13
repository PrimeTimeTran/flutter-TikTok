import 'dart:math';
import 'package:uuid/uuid.dart';

import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

final faker = Faker();
final _random = Random();
const uuid = Uuid();

int randomNum() => 1 + _random.nextInt(75 - 1);
String randomImage() => "https://picsum.photos/1000?image=${randomNum()}";

List mediaUrls = [
  // 9:16
  'https://assets.mixkit.co/videos/preview/mixkit-man-runs-past-ground-level-shot-32809-large.mp4',
  'https://assets.mixkit.co/videos/preview/mixkit-red-frog-on-a-log-1487-large.mp4',
  'https://assets.mixkit.co/videos/preview/mixkit-woman-running-above-the-camera-on-a-running-track-32807-large.mp4',
  'https://assets.mixkit.co/videos/preview/mixkit-two-avenues-with-many-cars-traveling-at-night-34562-large.mp4',
  'https://assets.mixkit.co/videos/preview/mixkit-under-a-peripheral-road-with-two-avenues-on-the-sides-34560-large.mp4',
  'https://assets.mixkit.co/videos/preview/mixkit-city-traffic-on-bridges-and-streets-34565-large.mp4',
  'https://assets.mixkit.co/videos/preview/mixkit-womans-silhouette-walking-on-the-beach-at-sunset-1214-large.mp4',
  'https://assets.mixkit.co/videos/preview/mixkit-portrait-of-a-woman-in-a-pool-1259-large.mp4',
  'https://assets.mixkit.co/videos/preview/mixkit-a-woman-walking-on-the-beach-on-a-sunny-day-1208-large.mp4',
  'https://assets.mixkit.co/videos/preview/mixkit-womans-portrait-wearing-a-bikini-at-the-beach-1215-large.mp4',
  'https://assets.mixkit.co/videos/preview/mixkit-a-woman-in-a-bikini-in-front-of-a-tiled-1263-large.mp4',
  'https://assets.mixkit.co/videos/preview/mixkit-basketball-player-dribbling-then-dunking-2285-large.mp4',
  'https://assets.mixkit.co/videos/preview/mixkit-basketballs-being-shot-in-a-street-rink-2286-large.mp4',
  'https://assets.mixkit.co/videos/preview/mixkit-circuit-board-2381-large.mp4',
  'https://assets.mixkit.co/videos/preview/mixkit-woman-walking-by-a-pool-3157-large.mp4',
  'https://assets.mixkit.co/videos/preview/mixkit-woman-sitting-on-the-edge-of-a-pool-3158-large.mp4',
  'https://assets.mixkit.co/videos/preview/mixkit-machinery-of-a-very-close-watch-3673-large.mp4',
  'https://assets.mixkit.co/videos/preview/mixkit-mist-at-the-base-of-a-snowy-mountain-3308-large.mp4',
  'https://assets.mixkit.co/videos/preview/mixkit-snow-falling-in-a-pine-forest-3352-large.mp4',
  'https://assets.mixkit.co/videos/preview/mixkit-old-street-at-night-3456-large.mp4',
  'https://assets.mixkit.co/videos/preview/mixkit-woman-sitting-reading-in-pajamas-4950-large.mp4',
  'https://assets.mixkit.co/videos/preview/mixkit-young-sportsman-jumping-rope-at-home-5050-large.mp4',
  'https://assets.mixkit.co/videos/preview/mixkit-domino-effect-on-dark-background-5253-large.mp4',
  'https://assets.mixkit.co/videos/preview/mixkit-man-playing-with-a-tower-of-poker-chips-5251-large.mp4',
  'https://assets.mixkit.co/videos/preview/mixkit-candies-in-a-waffle-cone-on-a-yellow-background-10368-large.mp4',
  'https://assets.mixkit.co/videos/preview/mixkit-hand-holding-a-rubik-cube-that-seems-to-melt-on-13765-large.mp4',

  // 16:9
  // 'https://assets.mixkit.co/videos/preview/mixkit-beach-front-with-children-playing-2176-large.mp4',
  // 'https://assets.mixkit.co/videos/preview/mixkit-one-on-one-basketball-game-751-large.mp4',
  // 'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
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
    List<ContentType> mediaList = <ContentType>[];
    for (var i = 0; i < 30; i++) {
      var url = mediaUrls[_random.nextInt(mediaUrls.length)];
      mediaList.add(
        ContentType(
          id: '$i',
          mediaUrl: url,
          image: randomImage(),
          creatorName: faker.person.name(),
          caption: faker.lorem.sentences(1).join(),
          soundTitle: faker.lorem.words(3).join(' '),
          materialColor: colors[_random.nextInt(colors.length)],
          countLikes: faker.randomGenerator.integer(50000, min: 100),
          countComments: faker.randomGenerator.integer(1000, min: 10),
          countBookmarks: faker.randomGenerator.integer(2000, min: 10),
          countShares: faker.randomGenerator.integer(50000, min: 100),
        ),
      );
    }
    return mediaList;
  }
}

var mediaList = ContentType().createSampleList();

reset() {
  print('Bout to Reset');
  mediaList = ContentType().createSampleList();
}
