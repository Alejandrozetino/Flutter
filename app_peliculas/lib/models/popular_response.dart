// To parse this JSON data, do
//
//     final popularResponse = popularResponseFromMap(jsonString);

import 'dart:convert';

import 'package:app_peliculas/models/models.dart';

class PopularResponse {
    PopularResponse({
        required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults,
    });

    int page;
    List<Movie> results;
    int totalPages;
    int totalResults;

    factory PopularResponse.fromJson(String str) => PopularResponse.fromMap(json.decode(str));

    //String toJson() => json.encode(toMap());

    factory PopularResponse.fromMap(Map<String, dynamic> json) => PopularResponse(
        page: json["page"],
        results: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );

    //Map<String, dynamic> toMap() => {
    //    "page": page,
    //    "results": List<dynamic>.from(results.map((x) => x.toMap())),
    //    "total_pages": totalPages,
    //    "total_results": totalResults,
//    //};
//}
//
//class Result {
//    Result({
//        this.adult,
//        this.backdropPath,
//        this.genreIds,
//        this.id,
//        this.originalLanguage,
//        this.originalTitle,
//        this.overview,
//        this.popularity,
//        this.posterPath,
//        this.releaseDate,
//        this.title,
//        this.video,
//        this.voteAverage,
//        this.voteCount,
//    });
//
//    bool adult;
//    String backdropPath;
//    List<int> genreIds;
//    int id;
//    String originalLanguage;
//    String originalTitle;
//    String overview;
//    double popularity;
//    String posterPath;
//    DateTime releaseDate;
//    String title;
//    bool video;
//    double voteAverage;
//    int voteCount;
//
//    factory Result.fromJson(String str) => Result.fromMap(json.decode(str));
//
//    String toJson() => json.encode(toMap());
//
//    factory Result.fromMap(Map<String, dynamic> json) => Result(
//        adult: json["adult"],
//        backdropPath: json["backdrop_path"],
//        genreIds: List<int>.from(json["genre_ids"].map((x) => x)),
//        id: json["id"],
//        originalLanguage: json["original_language"],
//        originalTitle: json["original_title"],
//        overview: json["overview"],
//        popularity: json["popularity"].toDouble(),
//        posterPath: json["poster_path"],
//        releaseDate: DateTime.parse(json["release_date"]),
//        title: json["title"],
//        video: json["video"],
//        voteAverage: json["vote_average"].toDouble(),
//        voteCount: json["vote_count"],
//    );
//
//    Map<String, dynamic> toMap() => {
//        "adult": adult,
//        "backdrop_path": backdropPath,
//        "genre_ids": List<dynamic>.from(genreIds.map((x) => x)),
//        "id": id,
//        "original_language": originalLanguage,
//        "original_title": originalTitle,
//        "overview": overview,
//        "popularity": popularity,
//        "poster_path": posterPath,
//        "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
//        "title": title,
//        "video": video,
//        "vote_average": voteAverage,
//        "vote_count": voteCount,
//    };
}
