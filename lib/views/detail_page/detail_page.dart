import 'package:flutter/material.dart';

import '../../models/quote_model.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int quotefontSize = 16;
  int authorfontSize = 12;
  @override
  Widget build(BuildContext context) {
    QuoteModel quote = ModalRoute.of(context)!.settings.arguments as QuoteModel;
    Size size = MediaQuery.sizeOf(context);
    print(quote.quote);
    print(quote.author);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Page"),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              quote.quote,
              maxLines: 6,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: quotefontSize.toDouble(),
                // fontFamily: ,
              ),
            ),
            Text(
              "~ ${quote.author}",
              textAlign: TextAlign.end,
              style: TextStyle(
                color: Colors.white,
                fontSize: authorfontSize.toDouble(),
                fontWeight: FontWeight.w600,
                // fontFamily: ,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
