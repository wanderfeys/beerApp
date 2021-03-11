import 'package:BeerApp/model/beer.dart';
import 'package:BeerApp/screens/detail_screen.dart';
import 'package:flutter/material.dart';

import 'contstants.dart';

//Return list with desirialized json data
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
                    description:
                        beerListFromApi[index].description ?? description,
                    imageUrl: beerListFromApi[index].imageUrl ?? beerImage,
                    tagline: beerListFromApi[index].tagline ?? tagline,
                    name: beerListFromApi[index].name ?? name,
                    foodParing: beerListFromApi[index].foodPairing,
                    firstBrewed:
                        beerListFromApi[index].firstBrewed ?? firstBrewed,
                    brewersTips:
                        beerListFromApi[index].brewersTips ?? brewersTips,
                    contributedBy:
                        beerListFromApi[index].contributedBy ?? contributedBy,
                  ),
                );
                Navigator.push(context, route);
              },
              child: ListTile(
                isThreeLine: true,
                title: Text(
                  beerListFromApi[index].name ?? name,
                ),
                subtitle: Text(
                  beerListFromApi[index].tagline ??
                      tagline + "\n" + beerListFromApi[index].firstBrewed ??
                      firstBrewed,
                ),
                trailing: Image.network(
                  beerListFromApi[index].imageUrl ?? beerImage,
                  fit: BoxFit.scaleDown,
                  height: 100.0,
                  width: 100.0,
                ),
              ),
            );
          }
          return CircularProgressIndicator();
        });
  }
}
