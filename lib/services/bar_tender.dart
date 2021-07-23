import 'package:drinking_app/utilities/constants.dart';
import 'package:drinking_app/services/search_helper.dart';

class BarTender {

  Future<dynamic> getRandomCocktail() async {

    SearchHelper searchHelper = SearchHelper(url: kRandomCocktailURL);
    var cocktailData = await searchHelper.getData();

    return cocktailData;

  }

  Future<dynamic> getCocktailDetail(String? id) async {

    SearchHelper searchHelper = SearchHelper(url: '$kCocktailByIdURL$id');
    var cocktailData = await searchHelper.getData();

    return cocktailData;

  }

  Future<List<dynamic>> searchCocktails(String? searchTerm) async {

    SearchHelper searchHelper = SearchHelper(url: '$kCocktailByIngredientURL$searchTerm');
    var byIngredientData = await searchHelper.getData();

    SearchHelper searchHelper2 = SearchHelper(url: '$kCocktailByNameURL$searchTerm');
    var byNameData = await searchHelper2.getData();

    List<dynamic> dataList = [byIngredientData, byNameData];

    return dataList;

  }

}