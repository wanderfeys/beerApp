import 'package:BeerApp/model/beer.dart';
import 'package:BeerApp/services/api_data.dart';

//Return function for api call
class BeerRepository {
  BeerApiServices _apiServices = BeerApiServices();
  Future<Iterable<Beer>> getBeers() => _apiServices.getBeersFromApi();
  Future<Iterable<Beer>> getNameOfBeer(String beerName) =>
      _apiServices.getBeersNameFromApi(beerName);
}
