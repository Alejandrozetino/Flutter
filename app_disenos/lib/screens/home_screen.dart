import 'package:app_disenos/widgets/background.dart';
import 'package:app_disenos/widgets/card_table.dart';
import 'package:app_disenos/widgets/custom_bottom_navigation.dart';
import 'package:app_disenos/widgets/page_title.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [

          Background(),

          _HomeBody(),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}

class _HomeBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          PageTitle(),

          CardTable(),
        ],
      ),
    );
  }
}