import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/providers/scan_list_provider.dart';
import 'package:qr_scanner/utils/utils.dart';

class CustomScanButton extends StatelessWidget {
  const CustomScanButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      //elevation: 0,
      child: const Icon(Icons.filter_center_focus),
      onPressed: () async {

        //Para disparar la camara
        String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#3D8BEF', 'Cancel', true, ScanMode.QR);

        if(barcodeScanRes == '-1'){
          return;
        }

        //Buscan en el arbol de widgets la instancia del ScanListProvider
        // ignore: use_build_context_synchronously
        final scanListProvider = Provider.of<ScanListProvider>(context, listen: false);
        final newScan = await scanListProvider.newScan(barcodeScanRes);

        // ignore: use_build_context_synchronously
        launchUrl(context, newScan);
      },
    );
  }
}