import 'dart:io';

import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

enum ConnectionStatus { connected, notConttected }

class HomePageViewModel extends ChangeNotifier {
  bool authInProgress = false;
  bool canSubmit = false;
  String input = "";
  String output = "";
  final translator = GoogleTranslator();
  ConnectionStatus connectedToInternet = ConnectionStatus.connected;

  void translate() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        connectedToInternet = ConnectionStatus.connected;
      }
    } on SocketException catch (_) {
      connectedToInternet = ConnectionStatus.notConttected;
      notifyListeners();
      return;
    }

    if (!canSubmit) {
      return;
    }
    authInProgress = true;
    canSubmit = false;
    notifyListeners();

    output = (await translator.translate(input, to: "en", from: "uz")).text;
    authInProgress = false;
    notifyListeners();
  }

  void changeInput(String text) {
    if (text.isEmpty) {
      canSubmit = false;
    } else {
      canSubmit = true;
    }
    input = text;
    notifyListeners();
  }
}
