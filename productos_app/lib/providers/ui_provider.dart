import 'package:flutter/material.dart';

class UiProvider extends ChangeNotifier{

  int _selectedMenuOpt = 0;

  int get selectedMenuOpt {
    return this._selectedMenuOpt;
  }

  set selectedMenuOpt(int index){
    this._selectedMenuOpt = index;

    //Notificar a todos los Whidgets que esten escuchando esté cambio.
    notifyListeners();
  }
}