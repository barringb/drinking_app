import 'package:drinking_app/services/bar_tender.dart';
import 'package:flutter/material.dart';
import 'package:drinking_app/screens/drink_detail_screen.dart';
import 'package:drinking_app/screens/search_results_screen.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  BarTender barTender = BarTender();
  String? searchTerm;

  void searchDrinks() async {
    if (searchTerm != null) {
      List<dynamic> searchData = await barTender.searchCocktails(searchTerm);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return SearchResultsScreen(cocktailIngredientData: searchData[0], cocktailByNameData: searchData[1],);
          },
        ),
      );
    } else {
      print('null entry in search.');
    }
  }

  void randomDrink() async {
    var cocktailData = await barTender.getRandomCocktail();

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
        elevation: 10.0,
        title: const Text('Drink Finder'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/bar_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0,),
                child: AspectRatio(aspectRatio: 3,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(

                    image: DecorationImage(fit: BoxFit.fitWidth, image: AssetImage('images/drink_finder_logo.png')),
                  ),
                ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  style: const TextStyle(fontSize: 22.0, color: Colors.black87),
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                    icon: Icon(
                      Icons.local_drink_outlined,
                      color: Colors.white,
                    ),
                    hintText: 'Search by Drink/Ingredient',
                  ),
                  onChanged: (value) {
                    searchTerm = value;
                    print(searchTerm);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      searchDrinks();
                    },
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ))),
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Search Drinks',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      randomDrink();
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.redAccent),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ))),
                    child: const Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Text(
                        'Random Drink',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
