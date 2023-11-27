import 'package:app_noticias/src/pages/tab1_page.dart';
import 'package:app_noticias/src/pages/tab2_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
  const TabsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NavegacionModel(),
      child: Scaffold(
        body: _Paginas(),
        bottomNavigationBar: _Navegacion(),
      ),
    );
  }
}

class _Navegacion extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final navegacionModel = Provider.of<_NavegacionModel>(context);

    return BottomNavigationBar(
      currentIndex: navegacionModel.paginaActual,
      onTap: (index) => navegacionModel.paginaActual = index,
      items: [
        BottomNavigationBarItem( icon: Icon(Icons.person_outline), label: 'Para ti'),
        BottomNavigationBarItem( icon: Icon(Icons.public), label: 'Encabezado'),
      ]
      );
  }
}

class _Paginas extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final navegacionModel = Provider.of<_NavegacionModel>(context);

    return PageView(
      controller: navegacionModel.pageController,
      physics: NeverScrollableScrollPhysics(),
      children: [

        Tab1Page(),
        Tab2Page(),
        
      ],
    );
  }
}


class _NavegacionModel with ChangeNotifier{

  int _paginaActual = 0;
  PageController _pageController = PageController();

  int get paginaActual => this._paginaActual;

  set paginaActual(int pagina) {
    this._paginaActual = pagina;

    _pageController.animateToPage(
      pagina, 
      duration: Duration(milliseconds: 250), 
      curve: Curves.easeOut
    );

    //Notificar a todos los widgets que se redibujen
    notifyListeners();
  }

  PageController get pageController => this._pageController;

}