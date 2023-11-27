import 'package:fl_components/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CustomCardType1 extends StatelessWidget {
  const CustomCardType1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
            const ListTile(
              leading: Icon(Icons.photo, color: AppTheme.primary,),
              title: Text('Soy un titulo'),
              subtitle: Text('Una tarjeta es una hoja de Material que se utiliza para representar alguna información relacionada, por ejemplo, un álbum, una ubicación geográfica, una comida, detalles de contacto, etc.'),
            ),

            Padding(
              padding: const EdgeInsets.only(right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {}, 
                    child: const Text('Cancel'),
                    ),
                  TextButton(
                    onPressed: () {}, 
                    child: const Text('Ok')
                    ),
                ],
              ),
            )
          ]
        ),
    );
  }
}