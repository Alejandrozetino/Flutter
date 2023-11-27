import 'package:flutter/material.dart';
import 'package:fl_components/screens/screens.dart';
import 'package:fl_components/models/models.dart';

class AppRoutes{

  static const initialRoute = 'home';

  static final menuOptions = <MenuOption>[
    //TODO: borrar home
    //MenuOption(route: 'home', name: 'Home Screen', screen: const HomeScreen(), icon: Icons.home),
    MenuOption(route: 'listview1', name: 'List View 1', screen: const Listview1Screen(), icon: Icons.list_alt),
    MenuOption(route: 'listview2', name: 'List View 2', screen: const Listview2Screen(), icon: Icons.list_outlined),
    MenuOption(route: 'alert', name: 'Alert', screen: const AlertScreen(), icon: Icons.warning_amber_outlined),
    MenuOption(route: 'card', name: 'Card', screen: const CardScreen(), icon: Icons.card_membership_rounded),
    MenuOption(route: 'avatar', name: 'Circle avatar', screen: const AvatarScreen(), icon: Icons.supervised_user_circle),
    MenuOption(route: 'animated', name: 'Animated container', screen: const AnimatedScreen(), icon: Icons.play_circle_fill_rounded),
    MenuOption(route: 'inputs', name: 'Inputs', screen: const InputsScreen(), icon: Icons.input_outlined),
    MenuOption(route: 'slider', name: 'Slider and Checks', screen: const SliderScreen(), icon: Icons.slow_motion_video_rounded),
    MenuOption(route: 'listviewbuilder', name: 'InfiniteScrol and Pull to refresh', screen: const ListviewBuilderScreen(), icon: Icons.build_circle_outlined),
  ];

  static Map<String, Widget Function(BuildContext)> getAppRoutes(){

    Map<String, Widget Function(BuildContext)> appRoutes = {

    };

    appRoutes.addAll({ 'home' : (BuildContext contex) => const HomeScreen() });

    for (final option in menuOptions){
        appRoutes.addAll({ option.route : (BuildContext contex) => option.screen });
      } 

    return appRoutes;
  }

 // static Map<String, Widget Function(BuildContext)> routes = {
 //   'home':(context) => const HomeScreen(),
 //   'listview1':(context) => const Listview1Screen(),
 //   'listview2':(context) => const Listview2Screen(),
 //   'alert' : (context) => const AlertScreen(),
 //};

  static Route<dynamic> onGenerateRoute(RouteSettings settings){
    return MaterialPageRoute(
          builder: (context) => const AlertScreen(),
          );
  }
}