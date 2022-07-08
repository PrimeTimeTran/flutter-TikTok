import 'dart:math';
import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

final faker = Faker();
final _random = Random();

int randomNum() => 1 + _random.nextInt(75 - 1);
String randomImage() => "https://picsum.photos/1000?image=${randomNum()}";

List mediaUrls = [
  // 9:16
  // Brain Screen
  'https://v16-webapp.tiktok.com/7c4bf9616dc56000ba42f71fe0f62a79/62c853b1/video/tos/useast2a/tos-useast2a-pve-0037-aiso/929f7e5e43cc4e608b6d28d3cbae4096/?a=1988&ch=0&cr=0&dr=0&lr=tiktok_m&cd=0%7C0%7C0%7C0&br=1434&bt=717&btag=80000&cs=0&ds=3&ft=eXd.6Hk_Myq8Zge~Mwe2NQVQml7Gb&mime_type=video_mp4&qs=0&rc=OTNmOzk4aTMzOWhkOmY0aEBpajxucGU6Zjk2ZDMzZjczM0BiNmBgNjZgNmIxMTE0MDAwYSNsMmxlcjRnNW5gLS1kMWNzcw%3D%3D&l=202207080956050102450151460325A4DD',

  // Bout to go out
  'https://v16-webapp.tiktok.com/4dc28a81577d7a438bf7438c6e31991d/62c86f5c/video/tos/useast2a/tos-useast2a-pve-0037-aiso/8603d8f6f6d14cfb98e8440863cdd641/?a=1988&ch=0&cr=0&dr=0&lr=tiktok_m&cd=0%7C0%7C0%7C0&br=1252&bt=626&btag=80000&cs=0&ds=3&ft=eXd.6Hk_Myq8Z2RKewe2N.ijml7Gb&mime_type=video_mp4&qs=0&rc=aTw7NWVlOWg6NGVlOWQ7Z0BpMzRzdmQ6ZndqPDMzZjczM0A0YWAyMC5jXzYxYmExX2MtYSNpM2sycjRfYjZgLS1kMWNzcw%3D%3D&l=202207081154040102440690740D33FD18',

  // If I had a knife
  'https://v16-webapp.tiktok.com/f9423e65cdc2471c87f1bb9abda2d5e3/62c86f55/video/tos/useast2a/tos-useast2a-pve-0037-aiso/224e19c13be04b8c93e5cc1c34df851d/?a=1988&ch=0&cr=0&dr=0&lr=tiktok_m&cd=0%7C0%7C0%7C0&br=1178&bt=589&btag=80000&cs=0&ds=3&ft=eXd.6Hk_Myq8Z2RKewe2N.ijml7Gb&mime_type=video_mp4&qs=0&rc=M2kzOTtnaDk7aDc7OGRnNEBpM2l1d2c6ZmVxPDMzZjczM0BgYzMzMDFiNjExNF9jYy9hYSNyamRncjRnaTZgLS1kMWNzcw%3D%3D&l=202207081154040102440690740D33FD18',

  // If I punched me
  'https://v16-webapp.tiktok.com/59301d42de61d8d81177f67fde5c9ed3/62c86f22/video/tos/useast2a/tos-useast2a-pve-0037-aiso/aa2fa8abb0dd4a099b33f9fc07a539ee/?a=1988&ch=0&cr=0&dr=0&lr=tiktok_m&cd=0%7C0%7C0%7C0&br=956&bt=478&btag=80000&cs=0&ds=3&ft=eXd.6Hk_Myq8ZgEKewe2Nlwz2l7Gb&mime_type=video_mp4&qs=0&rc=NmhlPGg6NzY3OGc1aGU4ZUBpamY4OGg6ZnBlPDMzZjczM0BiXjIuMDJjNmAxY15hNV5gYSNzNGphcjRvY19gLS1kMWNzcw%3D%3D&l=2022070811532501024502202605358F8F',

  // Tatted Guy
  'https://v16-webapp.tiktok.com/686b9924089353b9d945f48ae75e3ff1/62c8620c/video/tos/useast2a/tos-useast2a-pve-0037-aiso/1fb8e80f3a17463d974554b5ac690a1d/?a=1988&ch=0&cr=0&dr=0&lr=tiktok_m&cd=0%7C0%7C1%7C0&cv=1&br=2750&bt=1375&btag=80000&cs=0&ds=3&ft=eXd.6Hk_Myq8Z2-jewe2N-aWml7Gb&mime_type=video_mp4&qs=0&rc=PDMzOWhnODU1PDppZzgzNEBpamt2OTo6Zmp3ZTMzZjgzM0AuMi00YjAvNjAxYzM1YDBgYSNtaDYwcjRncDBgLS1kL2Nzcw%3D%3D&l=20220708105732010244069074202DBB9F',

  // If someone hits me
  'https://v16-webapp.tiktok.com/3a8886f1d75db147a670ead949fa2d34/62c86f24/video/tos/useast2a/tos-useast2a-pv-0037-aiso/eef896315fdc42848731fd904977a86f/?a=1988&ch=0&cr=0&dr=0&lr=tiktok_m&cd=0%7C0%7C0%7C0&cv=1&br=33118&bt=16559&btag=40000&ds=4&ft=eXd.6Hk_Myq8ZgEKewe2Nlwz2l7Gb&mime_type=video_mp4&qs=13&rc=M3k8NTQ6ZndsZDMzZjczM0BpM3k8NTQ6ZndsZDMzZjczM0AxYmk0cjRnbHFgLS1kMWNzYSMxYmk0cjRnbHFgLS1kMWNzcw%3D%3D&l=2022070811532501024502202605358F8F',

  // 16:9
  // 'What should I say next?'
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
