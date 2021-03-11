import 'package:BeerApp/components/contstants.dart';
import 'package:BeerApp/components/food_pair_list.dart';
import 'package:flutter/material.dart';

//Return screen with desirialized json data
class DetailBeer extends StatelessWidget {
  final String name;
  final String imageUrl;
  final String description;
  final String tagline;
  final String firstBrewed;
  final String brewersTips;
  final String contributedBy;
  final List<String> foodParing;

  DetailBeer(
      {this.name,
      this.imageUrl,
      this.description,
      this.brewersTips,
      this.contributedBy,
      this.firstBrewed,
      this.foodParing,
      this.tagline});

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
                  imageUrl,
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
                  "The beer is called : " + name,
                  style: kTitleStyle,
                ),
                Divider(
                  color: Colors.yellow,
                  thickness: 2,
                ),
                Text(
                  tagline,
                  style: kSubtitleStyle,
                ),
                Divider(
                  color: Colors.yellow,
                  thickness: 2,
                ),
                Text(
                  firstBrewed,
                  style: kSubtitleStyle,
                ),
                Divider(
                  color: Colors.yellow,
                  thickness: 2,
                ),
                Text(
                  "Description:",
                  style: kTitleStyle,
                ),
                Text(
                  description,
                  style: kSubtitleStyle,
                ),
                Divider(
                  color: Colors.yellow,
                  thickness: 2,
                ),
                Text(
                  "Combined with :",
                  style: kTitleStyle,
                  textAlign: TextAlign.left,
                ),
                FoodPair(
                  foodPairList: foodParing,
                ),
                Divider(
                  color: Colors.yellow,
                  thickness: 2,
                ),
                Text(
                  " Brewers Tips : ",
                  style: kTitleStyle,
                ),
                Text(
                  brewersTips,
                  style: kSubtitleStyle,
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
                  style: kTitleStyle,
                ),
                Text(
                  contributedBy,
                  style: kSubtitleStyle,
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
