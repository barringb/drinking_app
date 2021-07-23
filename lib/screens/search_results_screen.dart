import 'package:flutter/material.dart';
import 'package:drinking_app/utilities/constants.dart';
import 'package:drinking_app/services/bar_tender.dart';
import 'package:drinking_app/screens/drink_detail_screen.dart';

class SearchResultsScreen extends StatefulWidget {
  const SearchResultsScreen({Key? key, this.cocktailIngredientData, this.cocktailByNameData})
      : super(key: key);
  final dynamic cocktailIngredientData;
  final dynamic cocktailByNameData;

  @override
  State<SearchResultsScreen> createState() => _SearchResultsScreenState();
}

class _SearchResultsScreenState extends State<SearchResultsScreen> {
  List<DrinkData> drinksList = [];

  @override
  void initState() {
    updateUI(widget.cocktailIngredientData, widget.cocktailByNameData);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void updateUI(dynamic ingredientData, dynamic byNameData) {
    print(byNameData);

    if (ingredientData != null && ingredientData != '') {
      bool b = false;
      int i = 0;

      while (b == false) {
        try {
          String name = ingredientData['drinks'][i]['strDrink'];
          String imageURL = ingredientData['drinks'][i]['strDrinkThumb'];
          String drinkID = ingredientData['drinks'][i]['idDrink'];
          drinksList.add(DrinkData(name, imageURL, drinkID));
          i++;
        } catch (e) {
          b = true;
        }
      }
    }

    if (byNameData != null && byNameData != '') {
      bool b = false;
      int i = 0;

      while (b == false) {
        try {
          String name = byNameData['drinks'][i]['strDrink'];
          String imageURL = byNameData['drinks'][i]['strDrinkThumb'];
          String drinkID = byNameData['drinks'][i]['idDrink'];
          drinksList.add(DrinkData(name, imageURL, drinkID));
          i++;

        } catch (e) {
          b = true;
          print('b = true;');
        }
      }
    }
  }

  void drinkDetail(String drinkID) async {
    BarTender barTender = BarTender();
    var cocktailData = await barTender.getCocktailDetail(drinkID);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return DrinkDetailScreen(
            cocktailData: cocktailData,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drink Finder'),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/drink_background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: ListView.builder(
            itemCount: drinksList.length,
            itemBuilder: (context, index) {
              return DrinkCard(
                drinkData: drinksList[index],
                callback: () => drinkDetail(drinksList[index].drinkID!),
              );
            },
          ),
        ),
      ),
    );
  }
}

class DrinkData {
  DrinkData(this.name, this.imageURL, this.drinkID);
  String? name;
  String? imageURL;
  String? drinkID;
}

class DrinkCard extends StatelessWidget {
  DrinkCard({Key? key, this.drinkData, this.callback}) : super(key: key);
  DrinkData? drinkData;
  VoidCallback? callback;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 12.0,
      ),
      child: GestureDetector(
        onTap: callback,
        child: AspectRatio(
          aspectRatio: 1.75,
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black87,
                      offset: Offset.fromDirection(1.57, 5.0),
                      blurRadius: 5.0,
                    ),
                  ],
                  borderRadius: BorderRadius.all(
                    Radius.circular(20.0),
                  ),
                  image: DecorationImage(
                    image: NetworkImage(
                        drinkData?.imageURL ?? kSampleNetworkImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  gradient: LinearGradient(
                      begin: Alignment.center,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.black.withAlpha(0),
                        Colors.black12,
                        Colors.black54,
                      ]),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        drinkData?.name ?? 'no name given',
                        style: kDrinkTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
