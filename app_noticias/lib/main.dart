import 'package:app_noticias/src/services/news_services.dart';
import 'package:app_noticias/src/theme/tema.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'src/pages/pages.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NewsService() ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: miTema,
        debugShowCheckedModeBanner: false,
        home: TabsPage(),
      ),
    );
  }
}
