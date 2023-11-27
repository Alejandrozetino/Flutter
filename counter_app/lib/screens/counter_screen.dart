import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget{

  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {

  int counter = 10;

  void increase(){
    counter++;
    setState(() {});
  }

  void decrease(){
    counter--;
    setState(() {});
  }

  void restar(){
    counter = 0;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    const fontSize30 = TextStyle( fontSize: 30 );

    return Scaffold(
      appBar: AppBar(
        title: const Text('CounterScreen'),
        elevation: 10.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Clicks count', style: fontSize30),
            Text('$counter', style: fontSize30),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      //enviando funciones como argumentos¿
      floatingActionButton: CustomFloatingActions(
        increaseFunc: increase,
        decreaseFunc: decrease,
        restarFunc: restar
      ),
    );
  }
}

class CustomFloatingActions extends StatelessWidget {

  final Function increaseFunc; 
  final Function decreaseFunc; 
  final Function restarFunc; 

  const CustomFloatingActions({
    Key? key, 
    required this.increaseFunc, 
    required this.decreaseFunc, 
    required this.restarFunc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [

        FloatingActionButton(
          child: const Icon( Icons.exposure_minus_1_outlined ),
          onPressed: () => decreaseFunc(), //() => setState(() => counter--),
        ),

        FloatingActionButton(
          child: const Icon( Icons.restart_alt_rounded ),
          onPressed: () => restarFunc(), //() => setState(() => counter = 0),
        ),

        FloatingActionButton(
          child: const Icon( Icons.exposure_plus_1_outlined ),
          onPressed: () => increaseFunc(), //() => setState(() => counter++),
        ),

      ],
    );
  }
}