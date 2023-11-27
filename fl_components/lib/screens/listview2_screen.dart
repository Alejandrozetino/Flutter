import 'package:flutter/material.dart';

class Listview2Screen extends StatelessWidget {
   
  final options = const['God of War', 'Fifa', 'Super Smash' ];

  const Listview2Screen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List View 2'),
      ),
      body: ListView.separated(
        itemCount: options.length,
        itemBuilder: (context, index) => ListTile(
              leading: const Icon(Icons.games_outlined, color: Colors.indigo,),
              title: Text(options[index]),
              trailing: const Icon(Icons.arrow_forward_ios_rounded, color: Colors.indigo, ),
              onTap: () {
                
              },
            ),
        separatorBuilder: (_ , __) => const Divider(),
      )
    );
  }
}