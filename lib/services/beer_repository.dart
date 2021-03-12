import 'package:BeerApp/model/beer.dart';
import 'package:BeerApp/services/api_data.dart';

//Return function for api call
class BeerRepository {
  BeerApiServices _apiServices = BeerApiServices();
  Future<Iterable<Beer>> getBeersFromRepository([String beerName]) =>
      _apiServices.getBeersFromApi(beerName);
}
