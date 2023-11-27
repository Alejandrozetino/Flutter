import 'package:app_disenos/widgets/custom_bottom_navigation.dart';
import 'package:app_disenos/widgets/products_slider.dart';
import 'package:flutter/material.dart';

import 'package:app_disenos/widgets/custom_listView.dart';

class ShoppingScreen extends StatelessWidget {
  const ShoppingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 248, 244, 244),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [

              _CardsPromotions(),

              const CustomListView(),

              const SizedBox(height: 35),

              const _TitleScroll(),

              const ProductsSlider(),

              const SizedBox(height: 35),

              const _TitleScroll(),

              const ProductsSlider(),
            ],
          ),
        ),
        bottomNavigationBar: CustomBottomNavigation(),
      );
  }
}

class _TitleScroll extends StatelessWidget {
  const _TitleScroll({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: const [

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Text('Modern products', style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }
}

class _CardsPromotions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final boxDecoration = BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color.fromARGB(167, 233, 228, 228),
              );
              
    return Container(
          decoration: boxDecoration,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          width: double.infinity,
          height: 200,
          //color: Color.fromARGB(255, 227, 222, 222),
          child: Stack(
            children: [

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [

                  const Text('2023', style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold)),
                
                  const Text('Fashion simple stool', style: TextStyle(color: Colors.black, fontSize: 30, fontWeight: FontWeight.bold)),
                
                  TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 34, 223, 223),
                      shape: const StadiumBorder(),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0.5),
                      child: Text('More', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                      ),
                    onPressed: () {}, 
                    ),
                  ],
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    const Image(image: AssetImage('assets/silla-moderna.png')),
                  ],
                )
                
              ]
            ),
          );
  }
}