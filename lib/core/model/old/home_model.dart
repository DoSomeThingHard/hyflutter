class Person {
  String? name;
  String? avatarURL;

  Person.fromMap(Map<String, dynamic> json) {
    name = json["name"];
    avatarURL = json["avatars"]["medium"];
  }
}

class Actor extends Person {
  Actor.fromMap(Map<String, dynamic> json): super.fromMap(json);
}

class Director extends Person {
  Director.fromMap(Map<String, dynamic> json): super.fromMap(json);
}

int counter = 1;

class MovieItem {
  int? rank;
  String? imageURL;
  String? title;
  String? playDate;
  double? rating;
  List<String>? genres;
  List<Actor>? casts;
  Director? director;
  String? originalTitle;

  MovieItem.fromMap(Map<String, dynamic> json) {
    rank = counter++;
    imageURL = json["images"]["medium"];
    title = json["title"];
    playDate = json["year"];
    rating = json["rating"]["average"];
    genres = json["genres"].cast<String>();
    casts = (json["casts"] as List<dynamic>).map((item) {
      return Actor.fromMap(item);
    }).toList();
    director = Director.fromMap(json["directors"][0]);
    originalTitle = json["original_title"];
  }

  // 快捷键是 Command+N
  @override
  String toString() {
    return 'MovieItem{rank: $rank, imageURL: $imageURL, title: $title, playDate: $playDate, rating: $rating, genres: $genres, casts: $casts, director: $director, originalTitle: $originalTitle}';
  }
}