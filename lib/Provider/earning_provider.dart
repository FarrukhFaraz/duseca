import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EarningProvider extends ChangeNotifier {
  String _initialValue = '';
  String get initialValue => _initialValue;
  set initialValue(String val){
    _initialValue = val;
    notify();
  }



  notify(){
    notifyListeners();
  }
}
