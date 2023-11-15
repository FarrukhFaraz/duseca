


import 'package:duseca/Models/car_seat_model.dart';
import 'package:flutter/cupertino.dart';

class PickUpProvider extends ChangeNotifier{

  int _totalSeat = 9;
  double seatCount = 9;
  CarSeatModel _carSeatModel = CarSeatModel();

  List<CarSeatModel> _seatList = [];

  PickUpProvider(){
    seatCount = double.parse(_totalSeat.toString());
    addAllInList(_totalSeat);
  }

  int get totalSeat => _totalSeat;
  set totalSeat(int val){
    _totalSeat = val;
    notifyListeners();
  }

  CarSeatModel get carSeatModel => _carSeatModel;
  set carSeatModel(CarSeatModel model){
   _carSeatModel  = model;
   notifyListeners();
  }

  List<CarSeatModel> get seatList => _seatList;

  setSeatCount(double val){
    seatCount = val;
    notifyListeners();
  }


  addInList(CarSeatModel model){
    _seatList.add(model);
  }

  addAllInList(int number){
    _totalSeat = number;
    _seatList = [];
    for(int i=0; i<number; i++){
      CarSeatModel model = CarSeatModel();
      model.number = i;
      if(i==0){
        model.notAvailable = true;
        model.selectedImage = 'unavailable.png';

      }
      else if(i==1){
        model.selected = true;
        model.selectedImage = 'selected.png';
      }
      else{
        model.selectedImage = 'available.png';
      }

      addInList(model);
    }
    notifyListeners();
  }


  updateSeat(int number){
    for (var carSeat in _seatList) {
      if (carSeat.number == number) {
        if(carSeat.selected){
          carSeat.selected = false;
          carSeat.selectedImage = 'available.png';
        }else{
          carSeat.selected = true;
          carSeat.selectedImage = 'selected.png';
        }
      }
    }
    notifyListeners();
  }




}