import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:video_player/video_player.dart';
import 'package:worldlingo3/classes/ContentType.dart';

class MediaContent extends StatefulWidget {
  const MediaContent({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  State<MediaContent> createState() => _MediaContentState();
}

class _MediaContentState extends State<MediaContent> {
  late List _contentTypeList = <ContentType>[];
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _contentTypeList = ContentType().createSampleList();
    _controller =
        VideoPlayerController.network(_contentTypeList[widget.index].mediaUrl)
          ..initialize().then((_) {
            setState(() {});
          });

    _controller.setLooping(true);
    // _controller.setVolume(0.5);
    _controller.setVolume(1);

    // Autoplay is not PWA. Autoplay cannot work inside of web browsers without first having a user action
    // https://github.com/flutter/flutter/issues/47030#issuecomment-852564661
    Future.delayed(const Duration(milliseconds: 500), () {
      if (kIsWeb) {
        if (widget.index != 0) {
          _controller.play();
        }
      } else {
        _controller.play();
      }
    });
  }

  @override
  void dispose() {
    _controller.pause();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final i = widget.index;

    return GestureDetector(
      onTap: () {
        _controller.value.isPlaying ? _controller.pause() : _controller.play();
      },
      child: Container(
        width: width,
        height: height,
        color: _contentTypeList[i].materialColor,
        child: Stack(
          children: [
            _controller.value.isInitialized
                ? _controller.value.aspectRatio < 1.0
                    ? SizedBox(
                        height: height,
                        width: width,
                        child: VideoPlayer(_controller),
                      )
                    : Align(
                        child: AspectRatio(
                          aspectRatio: _controller.value.aspectRatio,
                          child: VideoPlayer(_controller),
                        ),
                      )
                : Container(),
            Container(
              width: width,
              height: height,
              alignment: Alignment.bottomCenter,
              color: Colors.transparent,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      alignment: Alignment.bottomLeft,
                      padding: const EdgeInsets.only(bottom: 30, left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            _contentTypeList[i].creatorName,
                            style: const TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                decoration: TextDecoration.none),
                          ),
                          Text(
                            _contentTypeList[i].caption,
                            style: const TextStyle(
                                fontSize: 15,
                                color: Colors.grey,
                                decoration: TextDecoration.none),
                          ),
                          Row(
                            children: [
                              const Icon(Icons.my_library_music),
                              Text(
                                _contentTypeList[i].soundTitle,
                                style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.grey,
                                    decoration: TextDecoration.none),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.centerRight,
                      height: height / 1.8,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Icon(Icons.person_pin_circle_sharp),
                            Column(
                              children: [
                                const Icon(Icons.heart_broken),
                                Text(
                                  _contentTypeList[i].countLikes.toString(),
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                const Icon(Icons.message),
                                Text(
                                  _contentTypeList[i].countComments.toString(),
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                const Icon(Icons.bookmark_outlined),
                                Text(
                                  _contentTypeList[i].countBookmarks.toString(),
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                const Icon(Icons.share_sharp),
                                Text(
                                  _contentTypeList[i].countShares.toString(),
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Colors.white,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ],
                            ),
                            const Icon(Icons.music_video),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
