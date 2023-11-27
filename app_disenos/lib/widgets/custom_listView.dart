import 'package:flutter/material.dart';

class CustomListView extends StatelessWidget {
  const CustomListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: const [
        CardOptions(image: 'assets/icono-sofa.png', title: 'Sofa'),
        CardOptions(image: 'assets/icono-lampes.png', title: 'Lampes'),
        CardOptions(image: 'assets/icono-cabinet.png', title: 'Cabinet'),
        CardOptions(image: 'assets/icono-stool.png', title: 'Stool'),
      ],
    );
  }
}

class CardOptions extends StatelessWidget {

  final String image;
  final String title;
  
  const CardOptions({
    Key? key, 
    required this.image, 
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Image(image: AssetImage(image)),

        const SizedBox(height: 5,),

        Text(title, style: const TextStyle(color: Color.fromARGB(255, 85, 79, 79), fontSize: 20 )),
      ],
    );
  }
}