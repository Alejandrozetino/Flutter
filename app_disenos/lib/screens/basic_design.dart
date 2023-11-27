import 'package:flutter/material.dart';

class BasicDesignScreen extends StatelessWidget {
   
  const BasicDesignScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [

          const Image(image: AssetImage('assets/Loch-Awe.jpg')),

          const Title(),

          const ButtonSection(),

          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: const Text('Aute nostrud duis duis mollit eu excepteur pariatur deserunt. Sint aliqua sunt ad fugiat non aliqua aute amet laborum do. Nostrud consequat aliquip nostrud in ipsum qui ut ad velit do est occaecat excepteur minim. Consectetur veniam sint qui laboris elit ipsum cillum reprehenderit id deserunt sint reprehenderit anim.')
            ),

        ],
      )
    );
  }
}

class Title extends StatelessWidget {
  const Title({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      child: Row(
        children: [
    
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Oeschinen Lake Campground', style: TextStyle(fontWeight:  FontWeight.bold),),
              Text('Kandersteg, Switzerland', style: TextStyle(color: Colors.black45),),
            ],
          ),

          Expanded(child: Container()),
    
          const Icon(Icons.star, color: Colors.red,),
          const Text('41')
        ],
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [

            CustomButton(icon: Icons.phone, texto: 'Call',),
            CustomButton(icon: Icons.near_me, texto: 'Results'),
            CustomButton(icon: Icons.share, texto: 'Results',),

          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {

  final IconData icon;
  final String texto;
  
  const CustomButton({
    Key? key, 
    required this.icon, 
    required this.texto,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.lightBlue),
        Text(texto, style: const TextStyle(color: Colors.lightBlue))
      ],
    );
  }
}