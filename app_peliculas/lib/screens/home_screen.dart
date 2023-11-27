
import 'package:app_peliculas/providers/movies_provider.dart';
import 'package:app_peliculas/search/search_delegate.dart';
import 'package:flutter/material.dart';
import 'package:app_peliculas/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    //Buscan en el arbol de Widgets la primera instancia que encuentre de MoviesProvider
    //Si no la encunetra crea una
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Peliculas en cines'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.search_outlined),
            onPressed: () => showSearch(context: context, delegate: MovieSearchDelegate()),
            )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
        children: [

          //Tarjetas principales
          CardSwiper( movies: moviesProvider.onDisplayMovies ),

          //Slider de peliculas
          MovieSlider(
            movies: moviesProvider.popularMovies, 
            titleSection: "Populares",
            onNextPage: () => moviesProvider.getPopularMovies(),
          ),

          MovieSlider(
            movies: moviesProvider.upComingMovies, 
            titleSection: "Proximamente",
            onNextPage: () => moviesProvider.getUpComingMovies(),
          ),

          ],
        ),
      )
    );
  }
}