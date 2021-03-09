import 'package:BeerApp/components/food_pair_list.dart';
import 'package:flutter/material.dart';

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
        title: Text("Detail of Beer"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
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
                Text(name),
                Divider(
                  color: Colors.yellow,
                  thickness: 2,
                ),
                Text(tagline),
                Divider(
                  color: Colors.yellow,
                  thickness: 2,
                ),
                Text(firstBrewed),
                Divider(
                  color: Colors.yellow,
                  thickness: 2,
                ),
                Text(description),
                Divider(
                  color: Colors.yellow,
                  thickness: 2,
                ),
                Text("Food Pairing"),
                FoodPair(
                  foodPairList: foodParing,
                ),
                Divider(
                  color: Colors.yellow,
                  thickness: 2,
                ),
                Text(brewersTips),
                Divider(
                  color: Colors.yellow,
                  thickness: 2,
                ),
                SizedBox(
                  height: 5.0,
                ),
                Text(contributedBy),
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
