import 'package:flutter/material.dart';

import 'package:video_player/video_player.dart';
import 'package:worldlingo3/classes/ContentType.dart';

class MediaContent extends StatefulWidget {
  const MediaContent(
      {Key? key, this.index = 0, this.id = '0', this.discover = false})
      : super(key: key);
  final String id;
  final int index;
  final bool discover;

  @override
  State<MediaContent> createState() => _MediaContentState();
}

class _MediaContentState extends State<MediaContent>
    with TickerProviderStateMixin {
  late VideoPlayerController _controller;
  late final AnimationController _animationController =
      AnimationController(duration: const Duration(seconds: 10), vsync: this)
        ..repeat();

  ContentType getContent(String id) =>
      mediaList.firstWhere((content) => content.id == id);

  @override
  void initState() {
    debugPrint("Init MediaContent");
    super.initState();
    configVideo();
  }

  @override
  void dispose() {
    _controller.pause();
    _controller.dispose();
    _animationController.dispose();
    super.dispose();
  }

  void configVideo() {
    final url = getContent(widget.id).mediaUrl;
    _controller = VideoPlayerController.network(url)..initialize().then((_) {});

    // Autoplay is not PWA. Autoplay cannot work inside of web browsers without first having a user action
    // https://github.com/flutter/flutter/issues/47030#issuecomment-852564661
    Future.delayed(const Duration(milliseconds: 500), () {
      // _controller.addListener(checkVideo);
      _controller.setLooping(true);
      _controller.setVolume(1);
      _controller.play();
      // _showMyDialog();
    });
  }

  void checkVideo() {
    if (_controller.value.position ==
        const Duration(seconds: 0, minutes: 0, hours: 0)) {
      debugPrint('video Started');
    }

    if (!_controller.value.isPlaying &&
        _controller.value.duration == _controller.value.position) {
      debugPrint('video Ended');
      // _showMyDialog();
    }
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Whats your answer?'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                GestureDetector(
                  onTap: () {
                    debugPrint('Tapped');
                    Navigator.of(context).pop();
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(5),
                    child:
                        Text('A) Would you like to approve of this message?'),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    debugPrint('Tapped');
                    Navigator.of(context).pop();
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(5),
                    child:
                        Text('B) Would you like to approve of this message?'),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    debugPrint('Tapped');
                    Navigator.of(context).pop();
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(5),
                    child:
                        Text('C) Would you like to approve of this message?'),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    debugPrint('Tapped');
                    Navigator.of(context).pop();
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(5),
                    child:
                        Text('D) Would you like to approve of this message?'),
                  ),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('True'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('False'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  ContentType findContent(String id) =>
      mediaList.firstWhere((content) => content.id == id);

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final id = widget.id;
    final content = findContent(id);

    return GestureDetector(
      onTap: () {
        _controller.value.isPlaying ? _controller.pause() : _controller.play();
      },
      child: Container(
        width: width,
        height: height,
        color: content.materialColor,
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      if (widget.discover)
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, top: 20),
                            child: Column(
                              children: const [
                                Icon(Icons.arrow_back),
                                // Text(widget.id),
                              ],
                            ),
                          ),
                        )
                    ],
                  ),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Container(
                            alignment: Alignment.bottomLeft,
                            padding:
                                const EdgeInsets.only(bottom: 30, left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  content.creatorName,
                                  style: const TextStyle(
                                      fontSize: 20,
                                      color: Colors.white,
                                      decoration: TextDecoration.none),
                                ),
                                Text(
                                  content.caption,
                                  style: const TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey,
                                      decoration: TextDecoration.none),
                                ),
                                Row(
                                  children: [
                                    const Icon(Icons.my_library_music),
                                    Text(
                                      content.soundTitle,
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Icon(Icons.person_pin_circle_sharp),
                                  Column(
                                    children: [
                                      const Icon(Icons.heart_broken),
                                      Text(
                                        content.countLikes.toString(),
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
                                        content.countComments.toString(),
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
                                        content.countBookmarks.toString(),
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
                                        findContent(id).countShares.toString(),
                                        style: const TextStyle(
                                          fontSize: 15,
                                          color: Colors.white,
                                          decoration: TextDecoration.none,
                                        ),
                                      ),
                                    ],
                                  ),
                                  AnimatedBuilder(
                                    animation: _animationController,
                                    // child: const Icon(Icons.music_note),
                                    child: RawMaterialButton(
                                      onPressed: () {},
                                      elevation: 2.0,
                                      fillColor: Colors.white,
                                      padding: const EdgeInsets.all(3.0),
                                      shape: const CircleBorder(),
                                      child: const Icon(Icons.music_note),
                                    ),
                                    builder:
                                        (BuildContext context, Widget? child) {
                                      return Transform.rotate(
                                        angle:
                                            _animationController.value * 10.0,
                                        child: child,
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (_controller.value.isInitialized)
                    VideoProgressIndicator(
                      _controller,
                      allowScrubbing: true,
                      colors: const VideoProgressColors(
                          backgroundColor: Colors.red,
                          bufferedColor: Colors.black,
                          playedColor: Colors.blue),
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
