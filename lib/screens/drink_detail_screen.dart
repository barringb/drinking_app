import 'package:flutter/material.dart';
import 'package:drinking_app/utilities/constants.dart';

class Ingredient {
  Ingredient(this.ingredient);
  String? ingredient;
  String? amount;
}

class DrinkDetailScreen extends StatefulWidget {
  const DrinkDetailScreen({Key? key, this.cocktailData}) : super(key: key);

  final cocktailData;

  @override
  State<DrinkDetailScreen> createState() => _DrinkDetailScreenState();
}

class _DrinkDetailScreenState extends State<DrinkDetailScreen> {
  String? imageURL;
  String? drinkName;
  String? servingCup;
  List<Ingredient> ingredients = [];
  String? instructions;

  @override
  void initState() {
    updateUI(widget.cocktailData);
    super.initState();
  }

  void updateUI (dynamic inputData) {
    setState(() {
      imageURL = inputData['drinks'][0]['strDrinkThumb'];
      drinkName = inputData['drinks'][0]['strDrink'];
      servingCup = inputData['drinks'][0]['strGlass'];
      instructions = inputData['drinks'][0]['strInstructions'];

      for (int i = 1; i < 16; i++) {
        String? tempIngredient = inputData['drinks'][0]['strIngredient$i'];
        String? tempAmount = inputData['drinks'][0]['strMeasure$i'];

        if (tempIngredient != null && tempIngredient != '' && tempIngredient != ' ') {
          Ingredient ingredient = Ingredient(tempIngredient);
          if (tempAmount != null && tempAmount != '' && tempAmount != ' ') {
            ingredient.amount = tempAmount;
          }
          ingredients.add(ingredient);
        }
      }

      print(ingredients);

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10.0,
        title: const Text('Drink Finder'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/drink_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: AspectRatio(
                  aspectRatio: 1.0,
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
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(6.0),
                          child: FadeInImage(
                            fadeInDuration: const Duration(milliseconds: 350),
                            fadeOutDuration: const Duration(milliseconds: 150),
                            image: NetworkImage(imageURL!),
                            placeholder: AssetImage('images/loading_image.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                    ),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.0),
                          gradient: LinearGradient(
                            begin: Alignment.center,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.black.withAlpha(0),
                              Colors.black12,
                              Colors.black54,
                            ]
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                drinkName ?? 'none given',
                                style: kDrinkTextStyle,
                              ),
                              Text(
                                'Served in: $servingCup',
                                style: kSubTextStyle,
                              ),
                            ],
                          ),
                        ),
                      ),
                  ]
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 12.0),
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black87,
                          offset: Offset.fromDirection(1.57, 5.0),
                          blurRadius: 5.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(6.0),
                      color: Colors.white,
                    ),
                    child: Scrollbar(
                      radius: Radius.circular(6.0),
                      thickness: 10.0,
                      isAlwaysShown: true,
                      child: SingleChildScrollView(
                        physics: ScrollPhysics(),
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0,),
                                child: Text(
                                  'Ingredients:',
                                  style: kTitleTextStyle,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: ingredients.length,
                                itemBuilder: (context, index) {
                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        ingredients[index].amount ?? '',
                                        style: kIngredientTextStyle,
                                      ),
                                      Text(
                                        ingredients[index].ingredient ?? '',
                                        style: kIngredientTextStyle,
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0,),
                                child: Text(
                                  'Instructions:',
                                  style: kTitleTextStyle,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0,),
                              child: Text(
                                instructions ?? 'none given.',
                                style: kIngredientTextStyle,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
