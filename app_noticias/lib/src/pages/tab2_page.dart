import 'package:app_noticias/src/models/category_model.dart';
import 'package:app_noticias/src/models/news_models.dart';
import 'package:app_noticias/src/services/news_services.dart';
import 'package:app_noticias/src/theme/tema.dart';
import 'package:app_noticias/src/widgets/lista_noticias.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Tab2Page extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    final newsService = Provider.of<NewsService>(context);

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            
            _ListaCategorias(),
            Expanded(
              child: ListaNoticias( newsService.getArticulosCatSeleccionada! ),
            )

          ],
        )
      ),
    );
  }
}

class _ListaCategorias extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final categories = Provider.of<NewsService>(context).categories;

    return Container(
      width: double.infinity,
      height: 80,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
          
                _CategoryButton( categories[index] ),
                const SizedBox(height: 5),
                Text( categories[index].name ),
          
              ],
            ),
          );
        },
      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {

  final Categories categoria;

  const _CategoryButton( this.categoria );

  @override
  Widget build(BuildContext context) {

     final newsService = Provider.of<NewsService>(context);

    return GestureDetector(
      onTap: () {
        final newsService = Provider.of<NewsService>(context, listen: false);
        newsService.selectedCategory = categoria.name;
      },
      child: Container(
        width: 40,
        height: 40,
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white
        ),
        child: Icon(
          categoria.icon,
          color: (newsService.selectedCategory == this.categoria.name)
            ? miTema.accentColor
            : Colors.black54
        ),
      ),
    );
  }
}