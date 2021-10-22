class RECIPE{
  final String name;
  final String images;
  final double ratings;
  final String time;

  RECIPE({this.name, this.images, this.ratings, this.time});

  factory RECIPE.fromJson(dynamic json){
    return RECIPE(
      name: json['name'] as String,
      images:json['images'][0]['hostedLargeUrl'] as String,
      ratings: json['rating'] as double,
      time: json['totalTime'] as String,
    );
  }

  static List<RECIPE> recipesFromSnapshot(List snapshot){
    return snapshot.map((data){
      return RECIPE.fromJson(data);
    }).toList();
  }

  @override
  String toString(){
    return  'Recipe {name: $name, image: $images, rating : $ratings, time : $time}';
  }
}