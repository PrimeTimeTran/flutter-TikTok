import 'package:flutter/material.dart';

import 'package:video_player/video_player.dart';

import 'package:worldlingo3/classes/ContentType.dart';

class MediaContentPreview extends StatefulWidget {
  const MediaContentPreview({Key? key, this.id = '0'}) : super(key: key);
  final String id;

  @override
  State<MediaContentPreview> createState() => _MediaContentPreviewState();
}

class _MediaContentPreviewState extends State<MediaContentPreview> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    ContentType findContent(String id) =>
        mediaList.firstWhere((content) => content.id == id);
    var go = findContent(widget.id).mediaUrl;
    debugPrint('Preview Content');
    debugPrint(go);
    _controller = VideoPlayerController.network(go)
      ..initialize().then((_) {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return _controller.value.isInitialized
        ? SizedBox(
            width: 125,
            height: 150,
            child: Stack(
              children: [
                VideoPlayer(_controller),
                Text(
                  widget.id,
                  style: const TextStyle(color: Colors.yellow),
                ),
              ],
            ),
          )
        : const SizedBox(
            width: 125,
            height: 150.0,
            child: Padding(
              padding: EdgeInsets.all(50),
              child: CircularProgressIndicator(),
            ),
          );
  }
}
