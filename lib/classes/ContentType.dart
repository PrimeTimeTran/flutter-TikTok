import 'dart:math';
import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

final faker = Faker();
final _random = Random();

int randomNum() => 1 + _random.nextInt(75 - 1);
String randomImage() => "https://picsum.photos/1000?image=${randomNum()}";

List mediaUrls = [
  'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
  // 'https://v16-webapp.tiktok.com/fb3db6c80a8d3c4c24126ff7bbd07638/62c495c6/video/tos/useast2a/tos-useast2a-pve-0037-aiso/224e19c13be04b8c93e5cc1c34df851d/?a=1988&ch=0&cr=0&dr=0&lr=tiktok_m&cd=0%7C0%7C0%7C0&br=1178&bt=589&btag=80000&cs=0&ds=3&ft=eXd.6Hk_Myq8Z-.dMwe2NyfQml7Gb&mime_type=video_mp4&qs=0&rc=M2kzOTtnaDk7aDc7OGRnNEBpM2l1d2c6ZmVxPDMzZjczM0BgYzMzMDFiNjExNF9jYy9hYSNyamRncjRnaTZgLS1kMWNzcw%3D%3D&l=202207051349000102450151462334E1B4',
  // 'https://v16-webapp.tiktok.com/4921b0284009fcd311e43b72b27146dc/62c495f2/video/tos/useast2a/tos-useast2a-pve-0037-aiso/8603d8f6f6d14cfb98e8440863cdd641/?a=1988&ch=0&cr=0&dr=0&lr=tiktok_m&cd=0%7C0%7C0%7C0&br=1252&bt=626&btag=80000&cs=0&ds=3&ft=eXd.6Hk_Myq8ZK.dMwe2NI~Hrl7Gb&mime_type=video_mp4&qs=0&rc=aTw7NWVlOWg6NGVlOWQ7Z0BpMzRzdmQ6ZndqPDMzZjczM0A0YWAyMC5jXzYxYmExX2MtYSNpM2sycjRfYjZgLS1kMWNzcw%3D%3D&l=202207051349380102451331141034AA2D',
  // 'https://v16-webapp.tiktok.com/52a6e204e0a415919e17bcb7a76e4c9b/62c495ba/video/tos/useast2a/tos-useast2a-pve-0037-aiso/aa2fa8abb0dd4a099b33f9fc07a539ee/?a=1988&ch=0&cr=0&dr=0&lr=tiktok_m&cd=0%7C0%7C0%7C0&br=956&bt=478&btag=80000&cs=0&ds=3&ft=eXd.6Hk_Myq8Z-.dMwe2NyfQml7Gb&mime_type=video_mp4&qs=0&rc=NmhlPGg6NzY3OGc1aGU4ZUBpamY4OGg6ZnBlPDMzZjczM0BiXjIuMDJjNmAxY15hNV5gYSNzNGphcjRvY19gLS1kMWNzcw%3D%3D&l=202207051349000102450151462334E1B4',
  // 'https://v16-webapp.tiktok.com/f75a6841f746013545fd896b53a98665/62c499fc/video/tos/useast2a/tos-useast2a-pve-0037c001-aiso/47811f245d5542abace08f2ccfb42e18/?a=1988&ch=0&cr=0&dr=0&lr=tiktok_m&cd=0%7C0%7C1%7C0&cv=1&br=2396&bt=1198&btag=80000&cs=0&ds=3&ft=eXd.6Hk_Myq8ZoGdMwe2NI~Hrl7Gb&mime_type=video_mp4&qs=0&rc=OmU6OTplNjdpM2Q4Zjo8M0BpM3Zsdjc6ZjZzPDMzZjgzM0AtNWM0Y2IxXjIxMDQ2YGFeYSM1NGlrcjQwNWNgLS1kL2Nzcw%3D%3D&l=2022070514071001024500411423364EB2',
  // 'https://v16-webapp.tiktok.com/b7897aefb926bef0235d5ad6301950ec/62c49a2d/video/tos/useast2a/tos-useast2a-pve-0037-aiso/bc28458ceeef4c349af6a22935808a9a/?a=1988&ch=0&cr=0&dr=0&lr=tiktok_m&cd=0%7C0%7C1%7C0&cv=1&br=5062&bt=2531&btag=80000&cs=0&ds=3&ft=eXd.6Hk_Myq8Z0GdMwe2NBBhml7Gb&mime_type=video_mp4&qs=0&rc=Zzc0Nzg2ODk0aGdnZjNkZkBpanQ6ajQ6ZjVwOzMzZjgzM0A0YjZfNjYzNmAxY2M2NDRfYSNoNV9fcjRvYTZgLS1kL2Nzcw%3D%3D&l=202207051407530102451292070E38C126',
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
