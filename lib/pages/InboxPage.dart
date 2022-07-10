import 'package:flutter/material.dart';

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
                  child: CircleAvatar(
                    radius: 30,
                    backgroundImage:
                        NetworkImage('https://picsum.photos/250?image=$i'),
                  ),
                );
              },
            ),
          ),
          Row(children: const [Text('Messages')]),
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
                          children: const [
                            Text('Hslslslsl'),
                            Text('Hslslslsl')
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
