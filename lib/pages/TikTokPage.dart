import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

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
        width: 500,
        color: Colors.black87,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 500,
              width: 400,
              decoration: const BoxDecoration(color: Colors.red),
              child: const SizedBox(
                height: 500,
                width: 500,
                // child: VideoPlayerScreen(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
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
          ],
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

  PageController controller = PageController(initialPage: 0);

  contentBuilder(color) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Container(
      width: width,
      height: height,
      color: color,
      child: Container(
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
                    const Text(
                      'PrimeTimeTran',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          decoration: TextDecoration.none),
                    ),
                    const Text(
                      'PrimeTimeTran',
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                          decoration: TextDecoration.none),
                    ),
                    Row(
                      children: const [
                        Icon(Icons.my_library_music),
                        Text(
                          'PrimeTimeTran',
                          style: TextStyle(
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
                  padding: const EdgeInsets.only(right: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(Icons.person_pin_circle_sharp),
                      Column(
                        children: const [
                          Icon(Icons.heart_broken),
                          Text(
                            '904',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: const [
                          Icon(Icons.message),
                          Text(
                            '187',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: const [
                          Icon(Icons.bookmark_outlined),
                          Text(
                            '305',
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.white,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ],
                      ),
                      const Icon(Icons.share_sharp),
                      const Icon(Icons.music_video),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView(
          controller: controller,
          scrollDirection: Axis.vertical,
          children: [
            contentBuilder(Colors.red),
            contentBuilder(Colors.amber),
            contentBuilder(Colors.blue),
            contentBuilder(Colors.lightBlue),
            contentBuilder(Colors.lightGreen),
            contentBuilder(Colors.limeAccent),
            contentBuilder(Colors.red),
            contentBuilder(Colors.indigo),
            contentBuilder(Colors.cyan),
          ],
        ),
        const Positioned(left: 20, top: 20, child: Text('ejejeje')),
      ],
    );

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

class VideoPlayerApp extends StatelessWidget {
  const VideoPlayerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Video Player Demo',
      home: VideoPlayerScreen(),
    );
  }
}

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();

    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    _controller = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    );

    // Initialize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = _controller.initialize();

    // Use the controller to loop the video.
    _controller.setLooping(true);
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // Use a FutureBuilder to display a loading spinner while waiting for the
        // VideoPlayerController to finish initializing.
        body: FutureBuilder(
          future: _initializeVideoPlayerFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              // If the VideoPlayerController has finished initialization, use
              // the data it provides to limit the aspect ratio of the video.
              return AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                // Use the VideoPlayer widget to display the video.
                child: VideoPlayer(_controller),
              );
            } else {
              // If the VideoPlayerController is still initializing, show a
              // loading spinner.
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Wrap the play or pause in a call to `setState`. This ensures the
            // correct icon is shown.
            setState(() {
              // If the video is playing, pause it.
              if (_controller.value.isPlaying) {
                _controller.pause();
              } else {
                // If the video is paused, play it.
                _controller.play();
              }
            });
          },
          child: Container(
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
        )
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     // Wrap the play or pause in a call to `setState`. This ensures the
        //     // correct icon is shown.
        //     setState(() {
        //       // If the video is playing, pause it.
        //       if (_controller.value.isPlaying) {
        //         _controller.pause();
        //       } else {
        //         // If the video is paused, play it.
        //         _controller.play();
        //       }
        //     });
        //   },
        //   // Display the correct icon depending on the state of the player.
        //   child: Icon(
        //     _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        //   ),
        // ),
        );
  }
}
