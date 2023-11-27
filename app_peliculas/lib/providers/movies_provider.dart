import 'dart:async';
import 'dart:convert';

import 'package:app_peliculas/helpers/debouncer.dart';
import 'package:app_peliculas/models/models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; 

class MoviesProvider extends ChangeNotifier{

  String _baseUrl  = 'api.themoviedb.org';
  String _apiKey   = 'e66664b301da3d98fb85eda3fb67fc1e';
  String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];
  List<Movie> upComingMovies = [];

  Map<int, List<Cast?>?> moviesCast = {};

  int _popularPage = 0;
  int _upComingPage = 0;

  final debouncer = Debouncer(
    duration: Duration(milliseconds: 500), 
    );

  final StreamController<List<Movie>> _suggestionStreamController = new StreamController.broadcast();
  Stream<List<Movie>> get suggestionStream => this._suggestionStreamController.stream;

  MoviesProvider(){
    //print('Movies provider inicializado');

    getOnDisplayMovies();
    getPopularMovies();
    getUpComingMovies();
  }

  Future<String> _getJsonData(String endPoint, [int page = 1]) async {
    final url = Uri.https(_baseUrl, endPoint, {
    'api_key': _apiKey,
    'language': _language,
    'page': '$page'
    });
     
    //Se realiza la peticion HTTP
    final response = await http.get(url);
    return response.body;
  }

  getOnDisplayMovies() async {

    final jsonData = await this._getJsonData('3/movie/now_playing');
    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);

    //final Map<String, dynamic> decodedData = json.decode(response.body);

    //print(nowPlayingResponse.results[0].title);
    onDisplayMovies = nowPlayingResponse.results;

    //Notifica a los Widgets que estén escuchando que hubo un cambio y se redibujan solo los necesarios.
    notifyListeners();
  }

  getPopularMovies() async{
    
    _popularPage++;

    final jsonData = await this._getJsonData('3/movie/popular', _popularPage);
    final popularResponse = PopularResponse.fromJson(jsonData);

    //final Map<String, dynamic> decodedData = json.decode(response.body);

    //print(nowPlayingResponse.results[0].title);
    popularMovies = [...popularMovies, ...popularResponse.results ];
    //Notifica a los Widgets que estén escuchando que hubo un cambio y se redibujan solo los necesarios.
    notifyListeners();
  }

  Future<List<Cast?>?> getMovieCast(int movieId) async {

    if(moviesCast.containsKey(movieId)) return moviesCast[movieId];

    final jsonData = await this._getJsonData('3/movie/$movieId/credits');
    final creditsResponse = CreditsResponse.fromJson(jsonData);

    moviesCast[movieId] = creditsResponse.cast;

    return creditsResponse.cast;
  }

  Future<List<Movie>> searchMovies(String query) async {

    final url = Uri.https(_baseUrl, '3/search/movie', {
    'api_key': _apiKey,
    'language': _language,
    'query': query
    });

    final response = await http.get(url);
    final searchResponse = SearchResponse.fromJson(response.body);

    return searchResponse.results;
  }

  void getSuggestionsByQuery(String searchTerm){

    debouncer.value = '';
    debouncer.onValue = (value) async {
      
      //print('Tenemos valor a buscar: $value');
      final results = await this.searchMovies(value);
      this._suggestionStreamController.add(results);
    };

    final timer = Timer.periodic(Duration(milliseconds: 300), (_) {
      debouncer.value = searchTerm;
    });

    Future.delayed(Duration(milliseconds: 301)).then((_) => timer.cancel());
  }

  getUpComingMovies() async{

    _upComingPage++;

    final jsonData = await this._getJsonData('3/movie/upcoming', _upComingPage);
    final upComingResponse = UpComingResponse.fromJson(jsonData);

    //final Map<String, dynamic> decodedData = json.decode(response.body);

    //print(nowPlayingResponse.results[0].title);
    upComingMovies = [...upComingMovies, ...upComingResponse.results ];
    //Notifica a los Widgets que estén escuchando que hubo un cambio y se redibujan solo los necesarios.
    notifyListeners();
  }

  
}