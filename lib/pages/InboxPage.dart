import 'package:flutter/material.dart';

import 'package:faker/faker.dart';

final faker = Faker();
class InboxPage extends StatefulWidget {
  const InboxPage({Key? key}) : super(key: key);

  @override
  State<InboxPage> createState() => _InboxPage();
}

class _InboxPage extends State<InboxPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: 100,
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (ctx, i) {
                return Padding(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage:
                            NetworkImage('https://picsum.photos/250?image=$i'),
                      ),
                      Text(
                        faker.person.firstName(),
                        style: const TextStyle(
                            color: Colors.black87, fontSize: 10),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Row(children: const [Text('Messages')]),
          ),
          ListView.separated(
            shrinkWrap: true,
            itemCount: 20,
            separatorBuilder: (context, index) {
              return const Divider();
            },
            itemBuilder: (ctx, i) {
              return Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundImage:
                          NetworkImage('https://picsum.photos/250?image=$i'),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              faker.person.name(),
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              faker.lorem.sentences(1).join(),
                              style: const TextStyle(color: Colors.black87),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: Text('Hslslslsl'),
                  )
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
