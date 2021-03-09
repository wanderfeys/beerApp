import 'package:flutter/material.dart';

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
          children: [
            Text(foodPairList[index]),
          ],
        );
      },
    );
  }
}
