import 'package:flutter/material.dart';
import 'package:prueba/share_preferences.dart/preferences.dart';
import 'package:prueba/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {

  static const String routeName = 'Home';
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      drawer: const SideMenu(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('DarkMode: ${ Preferences.isDarkmode}'),
          Divider(),
          Text('Género: ${ Preferences.gender}'),
          Divider(),
          Text('Nombre de usuario: ${ Preferences.name}'),
          Divider(),
        ],
      )
    );
  }
}