import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:quotes_app/utils/my_extentions.dart';
import '../../models/quote_model.dart';
import '../../utils/my_fontstyle.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int quotefontSize = 16;
  int authorfontSize = 12;
  Color textcolor = Colors.black;
  Color textBackgroundColor = Colors.white;
  String quotesFont = MyFonts.Roboto.name;
  String authorFonts = MyFonts.Roboto.name; // Background color variable
  int index = 0;
  bool isedit = false;

  void setIndex(int i) {
    index = i;
    setState(() {});
  }

  void _onMenuSelected(String value) {
    switch (value) {
      case 'Edit':
        isedit = true;
        setState(() {});
        break;
      case 'Reset':
        setState(() {
          quotefontSize = 16;
          authorfontSize = 12;
          textcolor = Colors.black;
          textBackgroundColor = Colors.white;
          quotesFont = MyFonts.Roboto.name;
          authorFonts = MyFonts.Roboto.name;
        });
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    QuoteModel quote = ModalRoute.of(context)!.settings.arguments as QuoteModel;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Page"),
        actions: [
          PopupMenuButton<String>(
            onSelected: _onMenuSelected,
            itemBuilder: (BuildContext context) {
              return {'Edit', 'Reset'}.map((String choice) {
                return PopupMenuItem<String>(
                  value: choice,
                  child: Text(choice),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      height: 300,
                      width: 300,
                      decoration: BoxDecoration(
                        color:
                            textBackgroundColor, // Apply background color here
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Expanded(
                            child: Text(
                              quote.quote,
                              maxLines: 6,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontFamily: quotesFont,
                                color: textcolor,
                                fontSize: quotefontSize.toDouble(),
                              ),
                            ),
                          ),
                          Text(
                            "~ ${quote.author}",
                            textAlign: TextAlign.end,
                            style: TextStyle(
                              fontFamily: authorFonts,
                              color: textcolor,
                              fontSize: authorfontSize.toDouble(),
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 350,
                      width: 300,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          TextButton.icon(
                            onPressed: () {},
                            label: Text(
                              quote.quotes_share.toString(),
                              style: const TextStyle(color: Colors.black),
                            ),
                            icon: const Icon(
                              CupertinoIcons.share,
                              color: Colors.black,
                            ),
                          ),
                          TextButton.icon(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.favorite_border,
                              color: Colors.black,
                            ),
                            label: Text(
                              quote.quotes_like.toString(),
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                          // IconButton(
                          //   onPressed: () {},
                          //   icon: const Icon(
                          //     sav,
                          //     color: Colors.black,
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              20.h,
              Visibility(
                visible: isedit,
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setIndex(0);
                        },
                        child: Container(
                          height: 60,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border(
                              bottom: BorderSide(
                                width: index == 0 ? 2.5 : 0,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          child: const Text(
                            "Text",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          setIndex(1);
                        },
                        child: Container(
                          height: 60,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border(
                              bottom: BorderSide(
                                width: index == 1 ? 5 : 0,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          child: const Text(
                            "Theme",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: isedit,
                child: IndexedStack(
                  index: index,
                  children: [
                    // Text Edit
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Quote Font Size"),
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.remove),
                                    onPressed: () {
                                      setState(() {
                                        if (quotefontSize > 12) {
                                          quotefontSize--;
                                        }
                                      });
                                    },
                                  ),
                                  Text(quotefontSize.toString()),
                                  IconButton(
                                    icon: const Icon(Icons.add),
                                    onPressed: () {
                                      setState(() {
                                        quotefontSize++;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Author Font Size"),
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.remove),
                                    onPressed: () {
                                      setState(() {
                                        if (authorfontSize > 12) {
                                          authorfontSize--;
                                        }
                                      });
                                    },
                                  ),
                                  Text(authorfontSize.toString()),
                                  IconButton(
                                    icon: const Icon(Icons.add),
                                    onPressed: () {
                                      setState(() {
                                        authorfontSize++;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                          10.h,
                          Text("Quote FontStyle"),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: MyFonts.values
                                  .map((e) => TextButton(
                                      onPressed: () {
                                        setState(() {
                                          quotesFont = e.name;
                                        });
                                      },
                                      child: Text(
                                        "Abc",
                                        style: TextStyle(fontFamily: e.name),
                                      )))
                                  .toList(),
                            ),
                          ),
                          10.h,
                          Text("Author FontStyle"),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: MyFonts.values
                                  .map((e) => TextButton(
                                      onPressed: () {
                                        setState(() {
                                          authorFonts = e.name;
                                        });
                                      },
                                      child: Text(
                                        "Abc",
                                        style: TextStyle(fontFamily: e.name),
                                      )))
                                  .toList(),
                            ),
                          ),
                          10.h,
                          ElevatedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text("Pick a Text Color"),
                                    content: BlockPicker(
                                      pickerColor: textcolor,
                                      onColorChanged: (Color value) {
                                        setState(() {
                                          textcolor = value;
                                        });
                                      },
                                    ),
                                    actions: [
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text("Close"),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: const Text("Pick Text Color"),
                          ),
                        ],
                      ),
                    ),
                    // Theme Edit (background color picker via ElevatedButton and AlertDialog)
                    Container(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title:
                                        const Text("Pick a Background Color"),
                                    content: BlockPicker(
                                      pickerColor: textBackgroundColor,
                                      onColorChanged: (Color value) {
                                        setState(() {
                                          textBackgroundColor = value;
                                        });
                                      },
                                    ),
                                    actions: [
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text("Close"),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: const Text("Pick Background Color"),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
