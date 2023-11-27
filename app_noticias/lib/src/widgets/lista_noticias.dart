import 'package:app_noticias/src/models/news_models.dart';
import 'package:app_noticias/src/theme/tema.dart';
import 'package:flutter/material.dart';

class ListaNoticias extends StatelessWidget {

  final List<Article> noticias;

  const ListaNoticias( this.noticias );

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: noticias.length,
      itemBuilder: (context, index) {
        return _Noticia(noticia: this.noticias[index], index: index);
      },
    );
  }
}

class _Noticia extends StatelessWidget {
  
  final Article noticia;
  final int index;

  const _Noticia({ required this.noticia, required this.index });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        _TarjetaTopBar( noticia: noticia, index: index,),

        _TarjetaTitulo( noticia: noticia, ),

        _TarjetaImagen( noticia: noticia),

        _TarjetaBody( noticia: noticia ),

        _TarjetaBotones(),

        SizedBox( height: 10 ),
        Divider(),

      ],
    );
  }
}

class _TarjetaTopBar extends StatelessWidget {

  final Article noticia;
  final int index;

  const _TarjetaTopBar({ required this.noticia, required this.index });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text('${ index + 1}. ', style: TextStyle( color: miTema.accentColor )),
          Text('${ noticia.source.name }. ', style: TextStyle( color: miTema.accentColor ))
        ],
      ),
    );
  }
}

class _TarjetaTitulo extends StatelessWidget {
  
  final Article noticia;

  const _TarjetaTitulo({ required this.noticia });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text( noticia.title, style: TextStyle( fontSize: 20, fontWeight: FontWeight.w700),),
    );
  }
}

class _TarjetaImagen extends StatelessWidget {
  
  final Article noticia;

  const _TarjetaImagen({ required this.noticia });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric( vertical: 10 ),
      child: ClipRRect(
        borderRadius: const BorderRadius.only( topLeft: Radius.circular(50), bottomRight: Radius.circular(50) ),
        child: Container(
          child: ( noticia.urlToImage != null )
              ? FadeInImage(
                 placeholder: const AssetImage( 'assets/giphy.gif' ),
                 image: NetworkImage( (noticia.urlToImage != null) ? noticia.urlToImage! : '' )
                )
              : const Image(image: AssetImage( 'assets/no-image.png' ))
        ),
      ),
    );
  }
}

class _TarjetaBody extends StatelessWidget {
  
  final Article noticia;

  const _TarjetaBody({ required this.noticia });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric( horizontal: 20 ),
      // ignore: unnecessary_null_comparison
      child: Text( (noticia.description != null) ? noticia.description! : '' ),
    );
  }
}

class _TarjetaBotones extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          RawMaterialButton(
            onPressed: () {},
            fillColor: miTema.accentColor,
            shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20) ),
            child: Icon( Icons.star_border ),
            ),

            SizedBox( width: 10 ),

            RawMaterialButton(
            onPressed: () {},
            fillColor: Colors.blue,
            shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(20) ),
            child: Icon( Icons.more ),
            ),

        ],
      ),
    );
  }
}