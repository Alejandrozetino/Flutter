import 'package:flutter/material.dart';

import 'package:qr_scanner/widgets/widgets.dart';

class DirectionsPage extends StatelessWidget {

  const DirectionsPage({super.key});

  @override
  Widget build(BuildContext context) {

    return const ScanTiles(tipo: 'http');
  }
}