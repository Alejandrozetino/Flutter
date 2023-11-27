import 'package:flutter/material.dart';
import 'package:productos_app/providers/ui_provider.dart';
import 'package:productos_app/screens/screens.dart';
import 'package:productos_app/services/services.dart';
import 'package:productos_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final productsService = Provider.of<ProductsService>(context);
    final authService = Provider.of<AuthService>(context, listen: false);

    if( productsService.isLoading ) return LoadingScreen();

    return Scaffold(
      appBar: AppBar(
          title: const Text('Productos'),
          actions: [
            IconButton(
              icon: Icon( Icons.login_outlined ),
              onPressed: (){

                authService.logout();
                Navigator.pushReplacementNamed(context, 'login');

              },
            )
          ],
        ),
      /*body: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: productsService.products.length,
        itemBuilder: (context, int index) => GestureDetector(
          child:  ProductCard2( product: productsService.products[index],),
          onTap: () {
            productsService.selectedProuct = productsService.products[index].copy();
            Navigator.pushNamed(context, 'product');
          },
          )
        ),*/
        body: _HomePageBody(),
        /*body: SingleChildScrollView(
          child: Column(
            children: [
              CardSwiper( products: productsService.products ),
            ],
          ),
        ),*/
        bottomNavigationBar: CustomBottomNavigation(),
        /*floatingActionButton: FloatingActionButton(
          child: const Icon( Icons.add ),
          onPressed: () {

            productsService.selectedProuct = Product(
              available: true, 
              name: '', 
              price: 0
            );

            Navigator.pushNamed(context, 'product');
          },
        ),*/
      );
  }
}

class _HomePageBody extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    
    final productsService = Provider.of<ProductsService>(context);

    //Obtener el selectedMunuOpt
    final uiProvider = Provider.of<UiProvider>(context);

    //Cambiar para mostrar la pagina respectiva
    final currentIndex = uiProvider.selectedMenuOpt;

    //TEMPORAL  
    //final tempScan = new ScanModel(valor: 'http://google.com');
    //DBProvider.db.newScan(tempScan);

    switch(currentIndex){

      case 0:
        return SingleChildScrollView(
          child: Column(
            children: [
              CardSwiper( products: productsService.products ),
            ],
          ),
        );

      case 1:
        return LoginScreen();

      case 2:
        return SingleChildScrollView(
          child: Column(
            children: [
              CardSwiper( products: productsService.products ),
            ],
          ),
        );

      default:
        return SingleChildScrollView(
          child: Column(
            children: [
              CardSwiper( products: productsService.products ),
            ],
          ),
        );
    }
  }
}