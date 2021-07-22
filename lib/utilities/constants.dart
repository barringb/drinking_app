import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//  https://www.thecocktaildb.com/api.php
const kApiKey = '1';
const kCocktailByNameURL = 'www.thecocktaildb.com/api/json/v1/1/search.php?s=margarita';
const kRandomCocktailURL = 'www.thecocktaildb.com/api/json/v1/1/random.php';
const kCocktailByIdURL = 'www.thecocktaildb.com/api/json/v1/1/lookup.php?i=11007';
const kCocktailByIngredientURL = 'www.thecocktaildb.com/api/json/v1/1/filter.php?i=Vodka';

const kDrinkTextStyle = TextStyle(
  fontSize: 28.0,
  fontWeight: FontWeight.bold,
);

const kSubTextStyle = TextStyle(
  fontSize: 18.0,
  fontWeight: FontWeight.bold,
  color: Colors.grey,
);

const kTitleTextStyle = TextStyle(
  fontSize: 22.0,
  fontWeight: FontWeight.bold,
);

const kIngredientTextStyle = TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.normal,
  color: Colors.grey,
);