import 'package:flutter/cupertino.dart';

import '../Models/history_model.dart';

class HistoryProvider extends ChangeNotifier {
  List<HistoryModel> _historyList = [];

  HistoryProvider(){
    addAllHistoryList(4);
  }


  List<HistoryModel> get historyList => _historyList;

  set historyList(List<HistoryModel> list) {
    _historyList = list;
    notify();
  }


  addInList(HistoryModel model){
    _historyList.add(model);
  }

  addAllHistoryList(int number){
    for(int i=0; i<number; i++){
      HistoryModel model = HistoryModel(
        id: i,
        text1: 'Gorzow',
        text2: 'Berlin Airport',
        price: '\$45.99',
        location: 'Germany',
        image: 'van.png',
      );

      addInList(model);
    }
    notify();
  }


  notify(){
    notifyListeners();
  }

}
