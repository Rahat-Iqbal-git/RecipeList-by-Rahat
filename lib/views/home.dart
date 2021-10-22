// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:the_recipe/models/recipe.api.dart';
import 'package:the_recipe/models/recipe.dart';
import 'package:the_recipe/views/widgets/recipecard.dart';

class HOMEPAGE extends StatefulWidget {
  const HOMEPAGE({ Key key }) : super(key: key);

  @override
  HOMEPAGEState createState() => HOMEPAGEState();
}

class HOMEPAGEState extends State<HOMEPAGE> {

  List<RECIPE> _recipes;
  bool isloading = true;

  @override
  void initState(){
    super.initState();
    getrecipe();
  }

  Future<void> getrecipe()async{
     _recipes = await RECIPE_API.getRecipe(); 
     setState(() {
            isloading = false;
          });
          print(_recipes);
  } 

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size / 100;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.food_bank_rounded),
            SizedBox(
              width: size.width * 5,
            ),
            Text("Recipe List by Rahat"),
          ],
        ),
      ),
      body: isloading ? Center(child: CircularProgressIndicator(),) : 
      Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.red.shade300, Colors.blue.shade200
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [0,1],
          )
        ),
        
        child: ListView.builder(
          itemCount: _recipes.length,
          itemBuilder: (context, index){
            return RecipeCard(title: _recipes[index].name, cookTime: _recipes[index].time, rating: _recipes[index].ratings.toString(), thumbnailUrl: _recipes[index].images);
          },
        ),
      )
    );
  }
}
