import 'package:flutter/material.dart';
import 'package:worldlingo3/classes/hero_type.dart';

class Details extends StatefulWidget {
  final HeroType heroType;

  const Details({Key? key, required this.heroType}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  late HeroType _heroType;
  late double _screenHeight;

  @override
  void initState() {
    super.initState();
    _heroType = widget.heroType;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _screenHeight = MediaQuery.of(context).size.height;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Hero(
          tag: 'image${_heroType.title}',
          child: Image.network(
            height: double.infinity,
            width: double.infinity,
            _heroType.image,
            fit: BoxFit.cover,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 15),
                  child: GestureDetector(
                    child: const Icon(Icons.arrow_back),
                    onTap: () => Navigator.of(context).pop(),
                  ),
                )
              ],
            ),
            Container(
              height: _screenHeight * .6,
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
                      child: Padding(
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
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      alignment: Alignment.centerRight,
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
          ],
        ),
      ],
    );
  }
}
