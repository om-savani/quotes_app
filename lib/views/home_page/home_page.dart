import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:quotes_app/utils/utils.dart';

import '../../routes/all_routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (val, res) async {
        if (val) {
          return;
        }
        bool canPop = await showDialog(
            context: context,
            builder: (context) => AlertDialog(
                  title: const Text("Alert Dialogue !!"),
                  content: const Text("Are you sure for EXIT ? "),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context, true);
                      },
                      child: const Text("YES"),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context, false);
                      },
                      child: const Text("NO"),
                    ),
                  ],
                ),
            barrierDismissible: false);
        if (canPop && context.mounted) {
          exit(0);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Home Page"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Flexible(
            child: CardSwiper(
              cardsCount: allQuotes.length,
              cardBuilder: (BuildContext context,
                      int index,
                      int horizontalOffsetPercentage,
                      int verticalOffsetPercentage) =>
                  GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, AppRoutes.detailpage);
                  arguments:
                  allQuotes[index];
                },
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: Text(
                            allQuotes[index].quote,
                            maxLines: 8,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text(
                          textAlign: TextAlign.end,
                          "~ ${allQuotes[index].author}",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
