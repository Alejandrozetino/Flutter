import 'package:app_peliculas/models/models.dart';
import 'package:app_peliculas/widgets/casting_cards.dart';
import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {

  const DetailsScreen({super.key});


  @override
  Widget build(BuildContext context) {

    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;

    return Scaffold(
      body: CustomScrollView(
        slivers: [

          _CustomAppBar(
            movieTitle: movie.title, 
            backdropPath: movie.fullBackdropPath
            ),

          SliverList(
            delegate: SliverChildListDelegate(
                 [
                  _PosterAndTitle(
                    heroId: movie.heroId!,
                    posterImage: movie.fullPosterImg, 
                    title: movie.title, 
                    originTitle: movie.originalTitle, 
                    voteAverage: movie.voteAverage
                  ),

                  _Overview(
                    Description: movie.overview,
                  ), 

                  SizedBox(height: 10),

                  CastingCards( movieId: movie.id ),
                 ]
              )
            )

        ],
      )
    );
  }
}


class _CustomAppBar extends StatelessWidget {

  final String movieTitle;
  final String backdropPath;

  const _CustomAppBar({
    super.key, 
    required this.movieTitle, 
    required this.backdropPath
    });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.indigo,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.only(bottom: 10, left: 10, right: 10),
          color: Colors.black12,
          child: Text(
            movieTitle,
            style: TextStyle(fontSize: 16),
            textAlign: TextAlign.center,
          )
        ),
        background: FadeInImage(
          placeholder: AssetImage('assets/loading.gif'),
          image: NetworkImage(backdropPath),
          fit: BoxFit.cover,
        ),
      ),

    );
  }
}

class _PosterAndTitle extends StatelessWidget {

  final String heroId;
  final String posterImage;
  final String title;
  final String originTitle;
  final double voteAverage;

  const _PosterAndTitle({super.key, 
  required this.posterImage, 
  required this.title, 
  required this.originTitle, 
  required this.voteAverage, 
  required this.heroId
  });

  @override
  Widget build(BuildContext context) {

    final TextTheme textTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Hero(
            tag: heroId,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: AssetImage('assets/no-image.jpg'), 
                image: NetworkImage(posterImage),
                height: 150,
                ),
            ),
          ),

          SizedBox(width: 20),

          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: size.width - 190),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: textTheme.headline5, overflow: TextOverflow.ellipsis, maxLines: 2,),
                Text(originTitle, style: textTheme.subtitle1, overflow: TextOverflow.ellipsis, maxLines: 2,),
          
                Row(
                  children: [
                    Icon(Icons.star_outlined, size: 15, color: Colors.yellow),
                    SizedBox(width: 5),
                    Text(voteAverage.toString(), style: textTheme .caption)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _Overview extends StatelessWidget {

  final String Description;

  const _Overview({
    super.key, 
    required this.Description
    });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(
        Description,
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,
        ),
    );
  }
}