import 'package:flutter/material.dart';

class TikTokPage extends StatefulWidget {
  const TikTokPage({Key? key}) : super(key: key);

  @override
  State<TikTokPage> createState() => _TikTokPageState();
}

class CustomIcon extends StatelessWidget {
  const CustomIcon({Key? key, required this.icon}) : super(key: key);
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: 40,
      color: Colors.white,
    );
  }
}
class VideoContainer extends StatelessWidget {
  const VideoContainer({Key? key, required this.title, required this.desc})
      : super(key: key);
  final String title;
  final String desc;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return SizedBox(
      child: Container(
        height: height - (kToolbarHeight + 20),
        width: 500,
        color: Colors.black87,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                desc,
                style: const TextStyle(
                  color: Colors.white,
                  // fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TikTokPageState extends State<TikTokPage> {
  final List<Widget> children = [
    const VideoContainer(
      title: "Apples 🍎",
      desc: "Keep the doctors away",
    ),
    const VideoContainer(
      title: "Banana 🍌",
      desc: "Are good for the body & world",
    ),
    const VideoContainer(
      title: "Carrot 🥕",
      desc: "Are the favorites of a bunny 🐰",
    ),
    const VideoContainer(
      title: "Dog 🐕",
      desc: "Are mens best friend",
    ),
    const VideoContainer(
      title: "Eagle 🦅",
      desc: "Lead the fight to freedom",
    ),
    const VideoContainer(
      title: "Fairy 🧚‍♀️",
      desc: "Are magical creatures",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
          scrollDirection: Axis.vertical,
          physics: const PageScrollPhysics(), // this for snapping
          itemCount: children.length,
          itemBuilder: (_, index) => children[index],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: const EdgeInsets.only(top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Following',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 20),
                  Text(
                    'For You',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(right: 10, bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    children: const [
                      CustomIcon(icon: Icons.account_circle_rounded),
                      SizedBox(height: 10),
                      CustomIcon(icon: Icons.favorite),
                      SizedBox(height: 10),
                      CustomIcon(icon: Icons.message),
                      SizedBox(height: 10),
                      CustomIcon(icon: Icons.share),
                      SizedBox(height: 30),
                      CustomIcon(icon: Icons.library_music),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
