import 'dart:math';
import 'package:flutter/material.dart';
import 'package:faker/faker.dart';


final faker = Faker();
final _random = Random();

int randomNum() => 1 + _random.nextInt(75 - 1);
String randomImage() => "https://picsum.photos/1000?image=${randomNum()}";

List mediaUrls = [

  // 9:16
  'https://v16-webapp.tiktok.com/7c4bf9616dc56000ba42f71fe0f62a79/62c853b1/video/tos/useast2a/tos-useast2a-pve-0037-aiso/929f7e5e43cc4e608b6d28d3cbae4096/?a=1988&ch=0&cr=0&dr=0&lr=tiktok_m&cd=0%7C0%7C0%7C0&br=1434&bt=717&btag=80000&cs=0&ds=3&ft=eXd.6Hk_Myq8Zge~Mwe2NQVQml7Gb&mime_type=video_mp4&qs=0&rc=OTNmOzk4aTMzOWhkOmY0aEBpajxucGU6Zjk2ZDMzZjczM0BiNmBgNjZgNmIxMTE0MDAwYSNsMmxlcjRnNW5gLS1kMWNzcw%3D%3D&l=202207080956050102450151460325A4DD',

  // 16:9
  'https://v16-webapp.tiktok.com/58d012494a0f90b03524a5ab6dc199d7/62c853e1/video/tos/alisg/tos-alisg-pve-0037/968278b87abc46d18ee7863c9b512a07/?a=1988&ch=0&cr=0&dr=0&lr=tiktok_m&cd=0%7C0%7C1%7C0&cv=1&br=602&bt=301&btag=80000&cs=0&ds=3&ft=eXd.6Hk_Myq8Zge~Mwe2NQVQml7Gb&mime_type=video_mp4&qs=0&rc=aTc2ZGVlZ2ZnNzo3PGgzNUBpMzQ4OGQ6ZnNoPDMzODgzNEBiXl9hY19fXjUxNjAuNTA2YSMtb2pscjRnaGJgLS1kLy1zcw%3D%3D&l=202207080956050102450151460325A4DD'
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
