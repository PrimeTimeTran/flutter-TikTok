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

class _TikTokPageState extends State<TikTokPage> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      child: Column(
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
    );
  }
}
