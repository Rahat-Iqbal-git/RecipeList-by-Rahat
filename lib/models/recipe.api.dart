import 'dart:convert';
import 'package:the_recipe/models/recipe.dart';
import 'package:http/http.dart' as http;

class RECIPE_API{
//   var req = unirest("GET", "https://yummly2.p.rapidapi.com/feeds/list");

// req.query({
// 	"limit": "18",
// 	"start": "0",
// 	"tag": "list.recipe.popular"
// });

// req.headers({
	// "x-rapidapi-host": "yummly2.p.rapidapi.com",
	// "x-rapidapi-key": "1dd7623ac2msh69215cd9dc6999ep13dcb0jsne88508771c49",
	// "useQueryString": true
// });

static Future<List<RECIPE>> getRecipe() async {
    var uri = Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
        {"limit": "18", "start": "0", "tag": "list.recipe.popular"});

    final resopnse = await http.get(uri, headers: {
      	"x-rapidapi-host": "yummly2.p.rapidapi.com",
        "x-rapidapi-key": "1dd7623ac2msh69215cd9dc6999ep13dcb0jsne88508771c49",
        "useQueryString": "true"

    });

    Map data = jsonDecode(resopnse.body);
    
    List temp = [];

    for(var i in data['feed']){
      temp.add(i['content']['details']);
    }
 return RECIPE.recipesFromSnapshot(temp);
}
}