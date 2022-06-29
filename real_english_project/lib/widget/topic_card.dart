import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/constants.dart';

class TopicCard extends StatelessWidget {
  const TopicCard(
      {Key? key,
      required this.content,
      required this.image,
      required this.title})
      : super(key: key);

  final String image;
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              margin: EdgeInsets.all(8),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              height: 120,
              width: 120,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    image,
                    fit: BoxFit.fill,
                    height: double.infinity,
                    width: double.infinity,
                  )),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: defaultPadding / 2),
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  Text(
                    content,
                    style: TextStyle(color: primaryColor),
                  ),
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
