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
  late double _screenWidth;
  late double _screenHeight;

  @override
  void initState() {
    super.initState();
    _heroType = widget.heroType;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _screenWidth = MediaQuery.of(context).size.width;
    _screenHeight = MediaQuery.of(context).size.height;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_heroType.title),
        backgroundColor: _heroType.materialColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ), 
      ),
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            Hero(
              tag: 'background${_heroType.title}',
              child: Container(
                color: _heroType.materialColor,
              ),
            ),
            Positioned(
              top: 0.0,
              left: 0.0,
              height: 230.0,
              width: _screenWidth,
              child: Hero(
                tag: 'image${_heroType.title}',
                child: Image.network(
                  _heroType.image,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
            Positioned(
              top: 250.0,
              left: 32.0,
              width: _screenWidth - 64.0,
              child: Hero(
                tag: 'text${_heroType.title}',
                child: Material(
                  color: Colors.transparent,
                  child: Text(
                    _heroType.title,
                    style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: _heroType.materialColor.shade900),
                  ),
                ),
              ),
            ),
            Positioned(
                top: 280.0,
                left: 32.0,
                width: _screenWidth - 64.0,
                child: Hero(
                    tag: 'subtitle${_heroType.title}',
                    child: Material(
                        color: Colors.transparent,
                        child: Text(
                          _heroType.subTitle,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
