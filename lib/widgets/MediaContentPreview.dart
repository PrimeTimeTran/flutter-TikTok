import 'package:flutter/material.dart';

import 'package:video_player/video_player.dart';

import 'package:worldlingo3/classes/ContentType.dart';

class MediaContentPreview extends StatefulWidget {
  const MediaContentPreview({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  State<MediaContentPreview> createState() => _MediaContentPreviewState();
}

class _MediaContentPreviewState extends State<MediaContentPreview> {
  late List _contentTypeList = <ContentType>[];
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _contentTypeList = ContentType().createSampleList();
    _controller =
        VideoPlayerController.network(_contentTypeList[widget.index].mediaUrl)
          ..initialize().then((_) {
            setState(() {}); //when your thumbnail will show.
          });
  }

  @override
  Widget build(BuildContext context) {
    final i = widget.index;

    return _controller.value.isInitialized
        ? GestureDetector(
            onTap: () {
              print('Before $i');
              Navigator.pushNamed(
                context,
                '/media-content',
                arguments: <String, int>{
                  'index': i,
                },
              );
            },
            child: SizedBox(
              width: 125,
              height: 150,
              child: VideoPlayer(_controller),
            ),
          )
        // : const CircularProgressIndicator();
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
