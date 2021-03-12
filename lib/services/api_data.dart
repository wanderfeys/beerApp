import 'package:BeerApp/model/beer.dart';
import 'package:BeerApp/services/errorHandle/network_exceptions.dart';
import 'package:dio/dio.dart';
import 'package:BeerApp/constants/keys.dart';

// fetch data from api and return list of beer
class BeerApiServices with HandleError {
  Future<Iterable<Beer>> getBeersFromApi([String beerName]) async {
    Dio dio = Dio();
    Response _response;
    try {
      if (beerName == null) {
        _response = await dio.get(
          Key.endPoint,
        );
      } else if (beerName != null)
        _response = await dio.get(
          Key.endPoint,
          queryParameters: {"beer_name": beerName},
        );
    } catch (e) {
      handleError(e);
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
      throw Exception(_response..statusCode);
    }
  }
}
