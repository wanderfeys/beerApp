import 'package:BeerApp/components/contstants.dart';
import 'package:BeerApp/model/beer.dart';
import 'package:dio/dio.dart';

// fetch data from api and return list of beer
class BeerApiServices {
  Future<Iterable<Beer>> getBeersFromApi() async {
    Dio dio = Dio();
    Response _response;
    try {
      _response = await dio.get(endPoint);
    } on DioError catch (e) {
      return throw Exception("Try restart app ${e.message}");
    }

    var beerList = <Beer>[];
    if (_response.statusCode == 200) {
      final beers = _response.data;
      for (var beerJson in beers) {
        var beer = Beer.fromJson(beerJson);
        beerList.add(beer);
      }
      return beerList;
    } else {
      throw Exception(_response.statusCode);
    }
  }

// fetch data from api and return list of beer for search by name
  Future<List<Beer>> getBeersNameFromApi(String beerName) async {
    Dio dio = Dio();
    Response _response;
    try {
      _response = await dio.get("$endPoint?beer_name=$beerName");
    } on DioError catch (e) {
      return throw Exception(
          "Error with network call: ${e.error} \n Try searching again but with: \n A more accurate name for beer, \n Without symbols, \n Or by similar names ");
    }

    var beerNameList = <Beer>[];
    if (_response.statusCode == 200) {
      final beers = _response.data;
      for (var beerNameJson in beers) {
        var beer = Beer.fromJson(beerNameJson);
        beerNameList.add(beer);
      }
      return beerNameList;
    } else {
      throw Exception(_response.statusCode);
    }
  }
}
