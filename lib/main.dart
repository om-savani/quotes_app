import 'package:flutter/material.dart';
import 'package:quotes_app/routes/all_routes.dart';
import 'package:quotes_app/views/home_page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, routes: AppRoutes.routes);
  }
}
