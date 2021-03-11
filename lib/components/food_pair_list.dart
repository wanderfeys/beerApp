import 'package:BeerApp/contstants.dart';
import 'package:flutter/material.dart';

//Return list with json data key food_pairs
class FoodPair extends StatelessWidget {
  final List<String> foodPairList;
  FoodPair({this.foodPairList});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: foodPairList.length,
      itemBuilder: (context, index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              foodPairList[index],
              style: kSubtitleStyle,
            ),
          ],
        );
      },
    );
  }
}
