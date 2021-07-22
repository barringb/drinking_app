import 'package:flutter/material.dart';
import 'package:drinking_app/utilities/constants.dart';

class DrinkDetailScreen extends StatelessWidget {
  const DrinkDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Drink Finder'),
      ),
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/drink_background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: AspectRatio(
                  aspectRatio: 1.5,
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black87,
                          offset: Offset.fromDirection(1.57, 5.0),
                          blurRadius: 5.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(25.0),
                      image: DecorationImage(
                        image: AssetImage('images/bar_background.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 12.0),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black87,
                          offset: Offset.fromDirection(1.57, 5.0),
                          blurRadius: 5.0,
                        ),
                      ],
                      borderRadius: BorderRadius.circular(25.0),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Chicago Fizz',
                              style: kDrinkTextStyle,
                            ),
                          ),
                        ),
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              'Served in: Highball glass',
                              style: kSubTextStyle,
                            ),
                          ),
                        ),
                      ],
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
