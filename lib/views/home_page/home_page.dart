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
  List<Color> bgColor = [
    const Color(0xffffc8dd),
    const Color(0xffa2d2ff),
    const Color(0xff81b29a),
    const Color(0xffa8dadc),
    const Color(0xffcdb4db),
  ];

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
            title: const Text("Alert Dialog !!"),
            content: const Text("Are you sure you want to EXIT?"),
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
          barrierDismissible: false,
        );
        if (canPop && context.mounted) {
          exit(0);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text("Home Page"),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    "https://i.pinimg.com/originals/88/e6/0a/88e60a88d533286491cbc74a7450335f.jpg"),
                fit: BoxFit.cover),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Expanded(
              // Changed from Flexible to Expanded
              child: CardSwiper(
                cardsCount: allQuotes.length,
                cardBuilder: (BuildContext context,
                    int index,
                    int horizontalOffsetPercentage,
                    int verticalOffsetPercentage) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        AppRoutes.detailpage,
                        arguments: allQuotes[index],
                      );
                    },
                    child: Center(
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 500),
                        height: 500,
                        width: 300,
                        decoration: BoxDecoration(
                          color: bgColor[index % bgColor.length],
                        ),
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
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Text(
                                "~ ${allQuotes[index].author}",
                                textAlign: TextAlign.end,
                                style: const TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
