import 'package:flutter/material.dart';

class Listview1Screen extends StatelessWidget {
   
  final options = const['God of War', 'Fifa', 'Super Smash' ];

  const Listview1Screen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List View 1'),
      ),
      body: ListView(
        children: [
          
          // ... Operador Spread(...) para extraer cada uno de los elementos de la lista
          //     y mostrar el Widget
          ...options.map(
            (game) => ListTile(
              leading: Icon(Icons.gamepad_outlined),
              title: Text(game),
              trailing: Icon(Icons.arrow_forward_ios_outlined),
            )).toList(),

          //ListTile(
          //  title: Text('Hola Mundo'),
          //)

        ],
      )
    );
  }
}