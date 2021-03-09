import 'package:BeerApp/model/beer.dart';
import 'package:dio/dio.dart';

final _api = 'https://api.punkapi.com/v2/beers';

// fetch data from api and return list of beer
class BeerApiServices {
  Future<Iterable<Beer>> getBeerFromApi() async {
    Dio dio = Dio();
    final response = await dio.get(_api);
    List<Beer> beerList = [];
    if (response.statusCode == 200) {
      final beers = response.data;
      print('beers');
      for (var beerJson in beers) {
        var beer = Beer.fromJson(beerJson);
        beerList.add(beer);
      }
      return beerList;
    } else {
      throw Exception(response.statusCode);
    }
  }
}
/* Future<List<Beer>> getBeersNameFromApi(String beerName) async {
    Dio dio = Dio();
    final response =
        await dio.get("https://api.punkapi.com/v2/beers?beer_name=$beerName");
    // ignore: deprecated_member_use
    List<Beer> beerNameList = new List();
    if (response.statusCode == 200) {
      final beers = response.data;
      for (var beerNameJson in beers) {
        var beer = Beer.fromJson(beerNameJson);
        beerNameList.add(beer);
      }
      return beerNameList;
    } else {
      throw Exception(response.statusCode);
    }
  }
}*/
