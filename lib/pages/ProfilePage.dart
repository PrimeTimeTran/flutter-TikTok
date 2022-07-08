import 'package:adaptive_action_sheet/adaptive_action_sheet.dart';
import 'package:flutter/material.dart';

import 'package:worldlingo3/pages/VietnamPage2.dart';
import 'package:worldlingo3/widgets/NestedTabBar.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePage();
}

class _ProfilePage extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text('Loi Tran'),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const VietnamPage2()),
            );
          },
          icon: const Icon(Icons.people_alt_outlined),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.remove_red_eye_outlined),
            onPressed: () {
              showAdaptiveActionSheet(
                context: context,
                actions: <BottomSheetAction>[
                  BottomSheetAction(
                    title: const Text(
                      'Creator Tools',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onPressed: () {},
                    leading:
                        const Icon(Icons.phonelink_setup_outlined, size: 25),
                  ),
                  BottomSheetAction(
                    title: const Text(
                      'Settings & Privacy',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    onPressed: () {},
                    leading: const Icon(
                      Icons.settings,
                      size: 25,
                    ),
                  ),
                ],
              );
            },
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu),
          ),
        ],
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Column(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    child: const CircleAvatar(
                      radius: 48,
                      backgroundImage:
                          NetworkImage('https://picsum.photos/250?image=1'),
                    ),
                  ),
                  const Text(
                    "@primetimetran",
                    style: TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: const [
                            Text(
                              "117",
                              style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Following",
                              style: TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: const [
                            Text(
                              "82",
                              style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Followers",
                              style: TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: const [
                            Text(
                              "249",
                              style: TextStyle(
                                color: Colors.black87,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "Likes",
                              style: TextStyle(
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  OutlinedButton(
                    style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.blue),
                      overlayColor: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.hovered)) {
                            return Colors.blue.withOpacity(0.04);
                          }
                          if (states.contains(MaterialState.focused) ||
                              states.contains(MaterialState.pressed)) {
                            return Colors.blue.withOpacity(0.12);
                          }
                          return null;
                        },
                      ),
                    ),
                    onPressed: () {},
                    child: const Text('Edit Profile'),
                  ),
                ],
              )
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            child: const Text(
              '💯☮️🙇🏻‍♂️🐒🤔👨🏻‍🎓🥋🧑🏻‍💻 👨🏻‍🏫 👨🏻‍🍳 ✍️🗽🦁🔫💂🏻‍♀️🌏🇺🇸🇻🇳🧙🏻‍♂️',
              textAlign: TextAlign.center,
            ),
          ),
          NestedTabBar(),
        ],
      ),
    );
  }
}
