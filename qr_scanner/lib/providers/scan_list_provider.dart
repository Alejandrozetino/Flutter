import 'package:flutter/material.dart';
import 'package:qr_scanner/providers/db_provider.dart';

//Actualizar la interfaz de usuario
class ScanListProvider extends ChangeNotifier{

  List<ScanModel> scans = [];
  String selectedType = 'http';

  Future<ScanModel> newScan(String value) async {
    
    final newScan = new ScanModel(valor: value);

    //Insertar a BD
    final id = await DBProvider.db.newScan(newScan);

    //Asignar el ID de la base de datos al modelo
    newScan.id = id;
    
    //Si el tipo que agregamos es igual a la pestaña lo agregamos al arreglo
    // y actualizamos la UI
    if( this.selectedType == newScan.tipo){
      this.scans.add(newScan);

      //Notificar que hay que actualizar
      notifyListeners();
    }

    return newScan;
  }

  loadScans() async {

    //Traemos todos los registros de la BD
    final scans = await DBProvider.db.getAllScans();

    //Con el operador spred (...) remplazamos y asignamos todos los scans
    // que acabamos de obtener
    this.scans = [...scans];
    notifyListeners();
  }

  loadScanForType( String type ) async {
    //Traemos los registros de la BD que cumplen con un cierto tipo
    final scans = await DBProvider.db.getScansForType(type);

    //Con el operador spred (...) remplazamos y asignamos todos los scans
    // que acabamos de obtener
    this.scans = [...scans];
    this.selectedType = type;
    notifyListeners();
  }

  deleteAll() async {
    await DBProvider.db.deleteAllScans();
    this.scans = [];
    notifyListeners();
  }

  deleteScanForId( int id ) async {
    await DBProvider.db.deleteScan(id);
  }
}