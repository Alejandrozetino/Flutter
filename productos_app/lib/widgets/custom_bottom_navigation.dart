import 'package:flutter/material.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:productos_app/providers/ui_provider.dart';
import 'package:productos_app/screens/screens.dart';
import 'package:provider/provider.dart';

class CustomBottomNavigation extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    //Obtener el selectedMunuOpt
    final uiProvider = Provider.of<UiProvider>(context);
    final currentIndex = uiProvider.selectedMenuOpt;

    return CustomNavigationBar(
      onTap: (int index) => uiProvider.selectedMenuOpt = index,
      currentIndex: currentIndex,
      iconSize: 27.0,
      bubbleCurve: Curves.linear,
      selectedColor: Colors.indigo,
      strokeColor: Colors.indigo,
      unSelectedColor: Color(0xffacacac),
      backgroundColor: Colors.white,
      scaleFactor: 0.1,
      /*showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Colors.pink,
      backgroundColor: const Color.fromRGBO(55, 57, 84, 1),
      unselectedItemColor: const Color.fromRGBO(116, 117, 152, 1),*/
      items: [
        CustomNavigationBarItem(
          icon: Icon(Icons.home),
          ),

        CustomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          ),

        CustomNavigationBarItem(
          icon: Icon(Icons.person),
          ),
      ],
    );
  }
}