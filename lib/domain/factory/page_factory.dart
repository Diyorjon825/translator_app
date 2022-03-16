import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:translate_application/ui/screens/home_page/home_page.dart';
import 'package:translate_application/ui/screens/home_page/home_page_view_model.dart';

class PageFactory {
  Widget buildHomePage() {
    return ChangeNotifierProvider(
      create: (context) => HomePageViewModel(),
      child: const HomePage(),
    );
  }
}
