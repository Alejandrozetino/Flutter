
import 'package:fl_components/router/app_routes.dart';
import 'package:fl_components/theme/app_theme.dart';
import 'package:flutter/material.dart';
//import 'package:fl_components/screens/screens.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final menuOptions = AppRoutes.menuOptions;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Componentes en Flutter'),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => ListTile(
          leading: Icon(menuOptions[index].icon , color: AppTheme.primary,),
          title: Text(menuOptions[index].name),
          onTap: () {

            //FORMA 1: Navegar entre paginas
          
            //final route = MaterialPageRoute(builder: (context) => const Listview2Screen());
            //Navigator.push(context, route);

            //FOMRA 2(recomendada): Navergar entre paginas
            Navigator.pushNamed(context, menuOptions[index].route);
          },
        ),
        separatorBuilder: (_, __) => const Divider(),
        itemCount: menuOptions.length,
      )
    );
  }
}