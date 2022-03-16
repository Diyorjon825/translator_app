import 'package:flutter/material.dart';
import 'package:translate_application/ui/main_navigation/main_navigation.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final navigation = MainNavigation();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: navigation.routes,
    );
  }
}
