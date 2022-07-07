// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import 'package:worldlingo3/widgets/MediaContent.dart';
class TikTokPage extends StatefulWidget {
  const TikTokPage({Key? key}) : super(key: key);

  @override
  State<TikTokPage> createState() => _TikTokPageState();
}

class _TikTokPageState extends State<TikTokPage> {

  @override
  void initState() {
    super.initState();
  }

  PageController controller = PageController(initialPage: 0);


  showAlertDialog(BuildContext context) {
    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Simple Alert"),
      content: const Text("This is an alert message."),
      actions: [
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () => showAlertDialog(context));
    return Stack(
      children: [
        PageView(
          controller: controller,
          scrollDirection: Axis.vertical,
          children: [
            for (var i = 0; i < 30; i++) MediaContent(index: i),
          ],
        ),
        const Positioned(left: 20, top: 20, child: Text('PrimeTimeTran1')),
      ],
    );
  }
}
