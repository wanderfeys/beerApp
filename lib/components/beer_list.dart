import 'package:BeerApp/model/beer.dart';
import 'package:BeerApp/screens/detail_screen.dart';
import 'package:flutter/material.dart';

class BeerList extends StatelessWidget {
  final List<Beer> beerListFromApi;
  BeerList({@required this.beerListFromApi});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: beerListFromApi.length,
      itemBuilder: (context, index) {
        if (beerListFromApi.isNotEmpty) {
          return GestureDetector(
            onTap: () {
              Route route = MaterialPageRoute(
                builder: (context) => DetailBeer(
                  description: beerListFromApi[index].description,
                  imageUrl: beerListFromApi[index].imageUrl,
                  tagline: beerListFromApi[index].tagline,
                  name: beerListFromApi[index].name,
                  foodParing: beerListFromApi[index].foodPairing,
                  firstBrewed: beerListFromApi[index].firstBrewed,
                  brewersTips: beerListFromApi[index].brewersTips,
                  contributedBy: beerListFromApi[index].contributedBy,
                ),
              );
              Navigator.push(context, route);
            },
            child: ListTile(
              isThreeLine: true,
              title: Text(beerListFromApi[index].name),
              subtitle: Text(beerListFromApi[index].tagline +
                  "\n" +
                  beerListFromApi[index].firstBrewed),
              trailing: Image.network(
                beerListFromApi[index].imageUrl,
                fit: BoxFit.scaleDown,
                height: 100.0,
                width: 100.0,
              ),
            ),
          );
        } else
          return CircularProgressIndicator();
      },
    );
  }
}
