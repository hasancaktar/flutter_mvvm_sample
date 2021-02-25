import 'package:flutter/cupertino.dart';
import 'model.dart';

class ModelView extends ChangeNotifier {
  final _model = Model();
  int state = 0;
  final username = TextEditingController();
  final password = TextEditingController();
  
  login() {
    final data = {"username": username.text, "password": password.text};
    if (state != 0) return;
    state = 1;
    notifyListeners();
    _model.login(data).listen((v) {
      if (v != 0) {
        state = 2;
        notifyListeners();
        Future.delayed(Duration(seconds: 3), () {
          state = 0;
          notifyListeners();
        });
      } else {
        state = 3;
        notifyListeners();
        Future.delayed(Duration(seconds: 3), () {
          state = 0;
          notifyListeners();
        });
      }
    });
  }
}
