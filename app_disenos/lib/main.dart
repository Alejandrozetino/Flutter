import 'package:app_disenos/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'shopping_screen',
      theme: ThemeData.dark(),
      routes: {
        'basic_design':( _ ) => BasicDesignScreen(),
        'scroll_screen':( _ ) => ScrollScreen(),
        'home_screen':( _ ) => HomeScreen(),
        'shopping_screen':( _ ) => ShoppingScreen(),
      },
    );
  }
}