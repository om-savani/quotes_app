import 'dart:io';

import 'package:flutter/material.dart';
import 'package:quotes_app/utils/utils.dart';

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
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: allQuotes.length,
            itemBuilder: (context, index) => Card(
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
    );
  }
}
