import 'package:flutter/material.dart';
import 'package:translate_application/domain/factory/page_factory.dart';

class MainNavigation {
  static final pageFactory = PageFactory();

  final routes = <String, Widget Function(BuildContext)>{
    "/": (context) => pageFactory.buildHomePage(),
  };
}
