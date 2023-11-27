import 'package:flutter/material.dart';
import 'package:fl_components/Widgets/widgets.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Widget'),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        children: const [
          CustomCardType1(),
          SizedBox(height: 20),
          CustomCardType2(name: 'Paisaje escala de rojos' ,imageUrl: 'https://img.freepik.com/free-vector/natural-landscape-wallpaper-video-conferencing_23-2148651571.jpg?w=2000'),
          SizedBox(height: 20),
          CustomCardType2(name: null ,imageUrl: 'https://img.freepik.com/free-vector/nature-scene-with-river-hills-forest-mountain-landscape-flat-cartoon-style-illustration_1150-37326.jpg?w=2000'),
          SizedBox(height: 20),
          CustomCardType2(imageUrl: 'https://img.freepik.com/free-vector/best-scene-nature-landscape-mountain-river-forest-with-sunset-evening-warm-tone-illustration_1150-39403.jpg?w=2000'),
          SizedBox(height: 20),
          CustomCardType2(imageUrl: 'https://www.lookslikefilm.com/wp-content/uploads/2019/02/Florian-Wenzel.jpg'),
        ],
      )
    );
  }
}