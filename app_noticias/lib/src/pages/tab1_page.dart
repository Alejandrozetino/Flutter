import 'package:app_noticias/src/services/news_services.dart';
import 'package:app_noticias/src/widgets/lista_noticias.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Tab1Page extends StatefulWidget {
  
  @override
  State<Tab1Page> createState() => _Tab1PageState();
}

class _Tab1PageState extends State<Tab1Page> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {

    final newsService = Provider.of<NewsService>(context); 

    return Scaffold(
      body: ( newsService.headLines.length == 0)
          ? const Center( child: CircularProgressIndicator() )
          : ListaNoticias( newsService.headLines )
    );
  }
  
  @override
  bool get wantKeepAlive => true;
}