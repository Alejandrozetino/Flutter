import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qr_scanner/providers/scan_list_provider.dart';
import 'package:qr_scanner/utils/utils.dart';

class ScanTiles extends StatelessWidget {

  final String tipo;

  const ScanTiles({
    super.key, 
    required this.tipo
    });
  
  @override
  Widget build(BuildContext context) {
    
    final scanListProvider = Provider.of<ScanListProvider>(context);
    final scans = scanListProvider.scans;

    return ListView.builder(
      itemCount: scans.length,
      itemBuilder: ( _ , position) => Dismissible(
        key: UniqueKey(),
        background: Container(
          color: Colors.red,
        ),
        onDismissed: (DismissDirection direction) {
          Provider.of<ScanListProvider>(context, listen: false)
            .deleteScanForId(scans[position].id!);
        },
        child: ListTile(
          leading: Icon( 
            this.tipo == 'http'
              ? Icons.compass_calibration
              : Icons.map, 
            color: Theme.of(context).primaryColor ),
          title: Text( scans[position].valor ),
          //subtitle: Text( scans[position].id.toString() ),
          trailing: const Icon( Icons.keyboard_arrow_right, color: Colors.grey ),
          onTap: () => launchUrl(context, scans[position]),
          ),
        ),
      );
  }
}