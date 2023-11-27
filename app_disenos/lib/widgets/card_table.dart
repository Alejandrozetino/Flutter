import 'dart:ui';

import 'package:flutter/material.dart';

class CardTable extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Table(
      children: const [
        TableRow(
          children: [
            _SingleCard(color: Colors.blue, icon: Icons.pie_chart, text: 'General'),
            _SingleCard(color: Colors.pinkAccent, icon: Icons.car_rental, text: 'Transport'),
          ]
        ),

        TableRow(
          children: [
            _SingleCard(color: Colors.purple, icon: Icons.shop, text: 'Shopping'),
            _SingleCard(color: Colors.indigo, icon: Icons.cloud, text: 'Bill'),
          ]
        ),

        TableRow(
          children: [
            _SingleCard(color: Colors.deepOrange, icon: Icons.movie_creation, text: 'Entretaiment'),
            _SingleCard(color: Colors.brown, icon: Icons.bungalow, text: 'Grocery'),
          ]
        ),

        TableRow(
          children: [
            _SingleCard(color: Colors.blue, icon: Icons.pie_chart, text: 'General'),
            _SingleCard(color: Colors.pinkAccent, icon: Icons.car_rental, text: 'Transport'),
          ]
        ),

        TableRow(
          children: [
            _SingleCard(color: Colors.blue, icon: Icons.pie_chart, text: 'General'),
            _SingleCard(color: Colors.pinkAccent, icon: Icons.car_rental, text: 'Transport'),
          ]
        ),

        TableRow(
          children: [
            _SingleCard(color: Colors.blue, icon: Icons.pie_chart, text: 'General'),
            _SingleCard(color: Colors.pinkAccent, icon: Icons.car_rental, text: 'Transport'),
          ]
        ),
      ],
    );
  }
}

class _SingleCard extends StatelessWidget {

  final IconData icon;
  final Color color;
  final String text;

  const _SingleCard({
    super.key, 
    required this.icon, 
    required this.color, 
    required this.text
    });

  @override
  Widget build(BuildContext context) {
    return _CardBackground(
      child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  backgroundColor: color,
                  child: Icon(icon, size: 45, color: Colors.white),
                  radius: 30,
                ),
                const SizedBox(height: 10),
                Text(text, style: TextStyle(color: color, fontSize: 18))
              ],
            )
      );
  }
}

class _CardBackground extends StatelessWidget {

  final Widget child;

  const _CardBackground({
    super.key, 
    required this.child
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(25),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            height: 180,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(62, 66, 107, 0.7),
              borderRadius: BorderRadius.circular(30)
            ),
            child: child,
          ),
        ),
      ),
    );
  }
}