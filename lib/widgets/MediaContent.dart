import 'package:flutter/material.dart';

import 'package:video_player/video_player.dart';
import 'package:worldlingo3/classes/ContentType.dart';

class VideoApp extends StatefulWidget {
  const VideoApp({Key? key, required this.url}) : super(key: key);
  final String url;
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    final url = widget.url;
    super.initState();
    _controller = VideoPlayerController.network(url)
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    _controller.setLooping(true);
    _controller.setVolume(.8);

    Future.delayed(const Duration(milliseconds: 500), () {
      _controller.play();
    });
  }

  void myMethodIWantToCallFromAnotherWidget() {
    print('calling myMethodIWantToCallFromAnotherWidget..');
    // actual implementation here
  }

  

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return MaterialApp(
      title: 'Video Demo',
      home: Scaffold(
        body: Center(
          child: _controller.value.isInitialized
              ? SizedBox(
                  height: height,
                  width: width,
                  child: VideoPlayer(_controller),
                )
              : Container(),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}

class MediaContent extends StatefulWidget {
  const MediaContent({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  State<MediaContent> createState() => _MediaContentState();
}

class _MediaContentState extends State<MediaContent> {
  late List _contentTypeList = <ContentType>[];
  final GlobalKey<_MediaContentState> _myWidgetState =
      GlobalKey<_MediaContentState>();

  @override
  void initState() {
    super.initState();
    _contentTypeList = ContentType().createSampleList();
  }

  void onSomeEvent() {
    print('On Some Event');
    // _myWidgetState.currentState?.myMethodIWantToCallFromAnotherWidget();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final i = widget.index;
    return Container(
      width: width,
      height: height,
      color: _contentTypeList[i].materialColor,
      child: Stack(
        children: [
          VideoApp(url: _contentTypeList[i].mediaUrl, key: _myWidgetState),
          Container(
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
                          GestureDetector(
                            child: const Icon(Icons.person_pin_circle_sharp),
                            onTap: () {
                              onSomeEvent();
                              print('HJISISISI');
                            },
                          ),
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
    );
  }
}
