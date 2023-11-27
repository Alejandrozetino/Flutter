import 'package:app_noticias/src/models/category_model.dart';
import 'package:app_noticias/src/models/news_models.dart';
import 'package:flutter/foundation.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

final _URLNews = 'https://newsapi.org/v2';
final _APIKEY = 'f377a7c516294821bfca6464cc2099d4';

class NewsService with ChangeNotifier{

  List<Article> headLines = [];
  String _selectedCategory = 'business';

  List<Categories> categories = [
    Categories( FontAwesomeIcons.building, 'business' ),
    Categories( FontAwesomeIcons.tv, 'entertainment' ),
    Categories( FontAwesomeIcons.addressCard, 'general' ),
    Categories( FontAwesomeIcons.headSideVirus, 'health' ),
    Categories( FontAwesomeIcons.vials, 'science' ),
    Categories( FontAwesomeIcons.volleyball, 'sports' ),
    Categories( FontAwesomeIcons.memory, 'technology' ),
  ];

  Map<String, List<Article>> categoryArticles = {}; 

  NewsService(){
    this.getTopheadLines();

    categories.forEach((element) { 
      this.categoryArticles[element.name] = [];
    });

  }

  String get selectedCategory => this._selectedCategory;

  set selectedCategory( String valor ){
    this._selectedCategory = valor;
    this.getArticlesByCategory( valor );
    notifyListeners();
  }

  List<Article>? get getArticulosCatSeleccionada => this.categoryArticles[ this.selectedCategory ];

  getTopheadLines() async {
    final url = '$_URLNews/top-headlines?apiKey=$_APIKEY&country=us';
    final resp = await http.get(Uri.parse(url));

    final newsResponse = NewResponse.fromJson( resp.body );

    this.headLines.addAll( newsResponse.articles );
    notifyListeners();
    
  }

  getArticlesByCategory( String category ) async {

    if( this.categoryArticles[category]!.length > 0 ){
      return this.categoryArticles[category];
    }

    final url = '$_URLNews/top-headlines?apiKey=$_APIKEY&country=us&category=$category';
    final resp = await http.get(Uri.parse(url));

    final newsResponse = NewResponse.fromJson( resp.body );

    this.categoryArticles[category]!.addAll( newsResponse.articles );

    notifyListeners();
  }
  
}