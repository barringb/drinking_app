import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//  https://www.thecocktaildb.com/api.php
const kApiKey = '1';
const kCocktailByNameURL = 'https://www.thecocktaildb.com/api/json/v1/1/search.php?s=';
const kRandomCocktailURL = 'https://www.thecocktaildb.com/api/json/v1/1/random.php';
const kCocktailByIdURL = 'https://www.thecocktaildb.com/api/json/v1/1/lookup.php?i=';
const kCocktailByIngredientURL = 'https://www.thecocktaildb.com/api/json/v1/1/filter.php?i=';
const kSampleNetworkImage = 'https://www.thecocktaildb.com/images/media/drink/yqvvqs1475667388.jpg';

const kDrinkTextStyle = TextStyle(
  fontSize: 28.0,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);

const kSubTextStyle = TextStyle(
  fontSize: 18.0,
  fontWeight: FontWeight.bold,
  color: Color(0xffcbcbcb),
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