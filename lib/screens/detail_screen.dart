import 'package:BeerApp/components/food_pair_list.dart';
import 'package:BeerApp/model/beer.dart';
import 'package:flutter/material.dart';
import 'package:BeerApp/constants/styles.dart';
import 'package:BeerApp/constants/strings.dart';

//Return screen with desirialized json data
class DetailBeer extends StatelessWidget {
  final Beer beerModel;

  DetailBeer({this.beerModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Beer information"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(15.0),
            child: Column(
              children: [
                Image.network(
                  beerModel.imageUrl ?? String.beerImage,
                  width: 300.0,
                  height: 300.0,
                ),
                SizedBox(
                  height: 5.0,
                ),
                Container(
                  height: 5.0,
                  width: 450,
                  decoration: BoxDecoration(
                      color: Color(0xFFe67e22),
                      borderRadius: BorderRadius.circular(35.0)),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  "The beer is called : " + beerModel.name ?? String.name,
                  style: Styles.kTitleStyle,
                ),
                Divider(
                  color: Colors.yellow,
                  thickness: 2,
                ),
                Text(
                  beerModel.tagline ?? String.tagline,
                  style: Styles.kSubtitleStyle,
                ),
                Divider(
                  color: Colors.yellow,
                  thickness: 2,
                ),
                Text(
                  beerModel.firstBrewed ?? String.firstBrewed,
                  style: Styles.kSubtitleStyle,
                ),
                Divider(
                  color: Colors.yellow,
                  thickness: 2,
                ),
                Text(
                  "Description:",
                  style: Styles.kTitleStyle,
                ),
                Text(
                  beerModel.description ?? String.description,
                  style: Styles.kSubtitleStyle,
                ),
                Divider(
                  color: Colors.yellow,
                  thickness: 2,
                ),
                Text(
                  "Combined with :",
                  style: Styles.kTitleStyle,
                  textAlign: TextAlign.left,
                ),
                FoodPair(
                  foodPairList: beerModel.foodPairing,
                ),
                Divider(
                  color: Colors.yellow,
                  thickness: 2,
                ),
                Text(
                  " Brewers Tips : ",
                  style: Styles.kTitleStyle,
                ),
                Text(
                  beerModel.brewersTips ?? String.brewersTips,
                  style: Styles.kSubtitleStyle,
                ),
                Divider(
                  color: Colors.yellow,
                  thickness: 2,
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(
                  "Countributed by : ",
                  style: Styles.kTitleStyle,
                ),
                Text(
                  beerModel.contributedBy ?? String.contributedBy,
                  style: Styles.kSubtitleStyle,
                ),
                Divider(
                  color: Colors.yellow,
                  thickness: 2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
