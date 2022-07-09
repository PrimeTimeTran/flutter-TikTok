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

    _controller = VideoPlayerController.network(findContent(widget.id).mediaUrl)
      ..initialize().then((_) {
        setState(() {}); //when your thumbnail will show.
      });
  }

  @override
  Widget build(BuildContext context) {
    final id = widget.id;

    return _controller.value.isInitialized
        ? SizedBox(
              width: 125,
              height: 150,
            child: VideoPlayer(_controller),
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
