import 'package:BeerApp/model/beer.dart';
import 'package:BeerApp/screens/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:BeerApp/constants/strings.dart';

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
          final item = beerListFromApi[index];
          if (beerListFromApi.isNotEmpty) {
            return GestureDetector(
              onTap: () {
                Route route = MaterialPageRoute(
                  builder: (context) => DetailBeer(
                    beerModel: item,
                  ),
                );
                Navigator.push(context, route);
              },
              child: ListTile(
                isThreeLine: true,
                title: Text(
                  item.name ?? String.name,
                ),
                subtitle: Text(
                  item.tagline ??
                      String.tagline + "\n" + item.firstBrewed ??
                      String.firstBrewed,
                ),
                trailing: Image.network(
                  item.imageUrl ?? String.beerImage,
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
