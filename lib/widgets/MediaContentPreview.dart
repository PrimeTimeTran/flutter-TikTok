import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
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

  ContentType getContent(String id) =>
      mediaList.firstWhere((content) => content.id == id);

  @override
  void initState() {
    super.initState();
    final url = getContent(widget.id).mediaUrl;
    debugPrint('MediaPreview ${widget.id}: $url');
    _controller = VideoPlayerController.network(url)
      ..initialize().then((_) {
        setState(() {});
      });
    Future.delayed(const Duration(milliseconds: 500), () {
      if (kIsWeb) {
        // _controller.play();
      } else {
        _controller.play();
      }
    });
  }

  @override
  void dispose() {
    debugPrint('Disposing MediaPreview');
    _controller.dispose();
    super.dispose();
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
