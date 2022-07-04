import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePage();
}


class _ProfilePage extends State<ProfilePage> {
  final int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            Column(
              children: [
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      width: 100.0,
                      height: 100.0,
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const Text('PrimeTimeTran'),
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: const [
                              Text("117"),
                              Text("Following"),
                            ],
                          ),
                          Column(
                            children: const [
                              Text("117"),
                              Text("Following"),
                            ],
                          ),
                          Column(
                            children: const [
                              Text("117"),
                              Text("Following"),
                            ],
                          ),
                        ],
                      ),
                    ),
                    OutlinedButton(
                        style: ButtonStyle(
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.blue),
                          overlayColor:
                              MaterialStateProperty.resolveWith<Color?>(
                            (Set<MaterialState> states) {
                              if (states.contains(MaterialState.hovered)) {
                                return Colors.blue.withOpacity(0.04);
                              }
                              if (states.contains(MaterialState.focused) ||
                                  states.contains(MaterialState.pressed)) {
                                return Colors.blue.withOpacity(0.12);
                              }
                              return null; // Defer to the widget's default.
                            },
                          ),
                        ),
                        onPressed: () {},
                        child: const Text('TextButton'))
                  ],
                )
              ],
            ),
            Expanded(
              child: Container(
                color: Colors.green,
                child: const Text('Hello World'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
