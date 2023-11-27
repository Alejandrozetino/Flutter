import 'package:flutter/material.dart';

class ProductsSlider extends StatelessWidget {
  const ProductsSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      child: const _ScrollProducts()
    );
  }
}

class _ScrollProducts extends StatelessWidget {
  const _ScrollProducts({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: const [
          _ScrollCards(image: 'assets/silla-moderna.png', title: 'Fasion sofa', price: 'Q279.99'),
          _ScrollCards(image: 'assets/sofa-cama.png', title: 'Fasion sofa', price: 'Q2300.99'),
          _ScrollCards(image: 'assets/sofa-oslo.png', title: 'Fasion sofa', price: 'Q999.99'),
          _ScrollCards(image: 'assets/silla-moderna.png', title: 'Fasion sofa', price: 'Q279.99'),
          _ScrollCards(image: 'assets/sofa-cama.png', title: 'Fasion sofa', price: 'Q2300.99'),
          _ScrollCards(image: 'assets/sofa-oslo.png', title: 'Fasion sofa', price: 'Q999.99'),
        ],
      ),
    );
  }
}

class _ScrollCards extends StatelessWidget {

  final String image;
  final String title;
  final String price;
  
  const _ScrollCards({
    Key? key, 
    required this.image, 
    required this.title, 
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
              margin: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 248, 244, 244),
                    ),
              height: 260,
              width: 220,
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Image(image: AssetImage(image), height: 300, alignment: AlignmentDirectional.topCenter),

                  _DetailsCard(title: title, price: price,)
                ],
              ),
            );
  }
}

class _DetailsCard extends StatelessWidget {

  final String title;
  final String price;
  
  const _DetailsCard({
    Key? key, 
    required this.title, 
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      height: 90,
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color.fromARGB(255, 255, 255, 255),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          
          Text(title, style: const TextStyle(color: Colors.black, fontSize: 19, fontWeight: FontWeight.bold)),

          Row(
            children: const [
              Text('details', style: TextStyle(color: Colors.black, fontSize: 12)),
              Icon(Icons.arrow_forward_ios_outlined, color: Colors.black, size: 12,)
            ],
          ),

          const SizedBox(height: 10,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(price, style: const TextStyle(color: Color.fromARGB(255, 34, 223, 223), fontSize: 29, fontWeight: FontWeight.bold)),
              const Icon(Icons.arrow_circle_right_rounded, color: Color.fromARGB(255, 34, 223, 223),)
            ],
          )

        ],
      ),
    );
  }
}