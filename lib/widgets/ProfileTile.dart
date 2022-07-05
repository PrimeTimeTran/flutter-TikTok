import 'package:flutter/material.dart';

import 'package:worldlingo3/pages/DetailsPage.dart';
import 'package:worldlingo3/classes/hero_type.dart';

class ProfileTile extends StatefulWidget {
  const ProfileTile({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  State<ProfileTile> createState() => _ProfileTileState();
}

class _ProfileTileState extends State<ProfileTile> {
  List _heroTypeList = <HeroType>[];

  @override
  void initState() {
    super.initState();
    _heroTypeList = HeroType().createSampleList();
  }

  @override
  Widget build(BuildContext context) {
    final i = widget.index;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          PageRouteBuilder(
            fullscreenDialog: true,
            transitionDuration: const Duration(milliseconds: 250),
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return Details(
                heroType: HeroType(
                    title: _heroTypeList[i].title,
                    subTitle: _heroTypeList[i].subTitle,
                    image: _heroTypeList[i].image,
                    materialColor: _heroTypeList[i].materialColor),
              );
            },
            transitionsBuilder: (BuildContext context,
                Animation<double> animation,
                Animation<double> secondaryAnimation,
                Widget child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ),
        );
      },
      child: Container(
        child: Hero(
          tag: 'image' + _heroTypeList[i].title,
          child: Image.network(_heroTypeList[i].image, fit: BoxFit.cover),
        ),
      ),
    );
  }
}
