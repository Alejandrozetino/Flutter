import 'package:flutter/material.dart';
import 'package:fl_components/theme/app_theme.dart';

class SliderScreen extends StatefulWidget {
   
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {

  double _sliderValue = 100;
  bool _sliderEnable = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sliders and Checks'),
      ),
      body: Column(
        children: [
      
          Slider.adaptive(
            min: 100,
            max: 600,
            activeColor: AppTheme.primary,
            divisions: 10,
            value: _sliderValue,
            onChanged: _sliderEnable
            ? (value) {
              _sliderValue = value;
              setState(() {});
              }
            : null
            ),

            Checkbox(
              activeColor: AppTheme.primary,
              value: _sliderEnable, 
              onChanged: (value) {
                _sliderEnable = value ?? true;
                setState(() {});
              },
            ),

            CheckboxListTile(
              activeColor: AppTheme.primary,
              title: const Text('Habilitar Slider'),
              value: _sliderEnable, 
              onChanged: (value) => setState(() {_sliderEnable = value ?? true;}),
              ),

            Switch(
              activeColor: AppTheme.primary,
              value: _sliderEnable, 
              onChanged: (value) => setState(() {_sliderEnable = value;}),
              ),

            SwitchListTile.adaptive(
            activeColor: AppTheme.primary,
            title: const Text('Habilitar Slider'),
            value: _sliderEnable, 
            onChanged: (value) => setState(() {_sliderEnable = value;}),
            ),
            
            const AboutListTile(),
      
            Expanded(
              child: SingleChildScrollView(
                child: Image(
                  image: const NetworkImage('https://www.teahub.io/photos/full/192-1929312_venom-and-spider-man-mobile-wallpaper-14286-data.jpg'),
                  fit: BoxFit.contain,
                  width: _sliderValue,
                  ),
              ),
            ),

      
        ],
      ),
    );
  }
}