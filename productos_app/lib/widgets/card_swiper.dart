import 'package:flutter/material.dart';
import 'package:productos_app/models/products.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:productos_app/screens/screens.dart';
import 'package:productos_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../services/services.dart';

class CardSwiper extends StatelessWidget {

  final List<Product> products;

  const CardSwiper({
    super.key, 
    required this.products
    }); 


  @override
  Widget build(BuildContext context) {

    final productsService = Provider.of<ProductsService>(context);
    final size = MediaQuery.of(context).size;
    
    if(this.products.length == 0){
      return Container(
        width: double.infinity,
        height: size.height * 0.7,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Container(
      width: double.infinity,
      height: size.height * 0.8,
      child: Swiper(
        itemCount: products.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.9,
        itemHeight: size.height * 0.6,
        itemBuilder: (context, index) {

          final product = products[index];
          
          return GestureDetector(
            onTap: () {
            productsService.selectedProuct = productsService.products[index].copy();
            Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 400),
                pageBuilder: (_, __, ___) => ProductScreen(),
                transitionsBuilder: (context, animation, secondaryAnimation, child){
                  return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                },
              ),
            );
            //Navigator.pushNamed(context, 'product');
            },
            child: ProductCard( product: productsService.products[index],),
            /*child: Hero(
              tag: 'swiper-${product.id}',
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: FadeInImage(
                  placeholder: const AssetImage('assets/no-image.jpg'), 
                  image: NetworkImage( product.picture! ),
                  fit: BoxFit.cover,
                  ),
                ),
            ),*/
            );
          },
        ),
    );
  }

}