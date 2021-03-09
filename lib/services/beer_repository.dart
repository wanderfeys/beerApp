import 'package:BeerApp/services/api_data.dart';

class BeerRepository {
  BeerApiServices _apiServices = BeerApiServices();
  getBeers() => _apiServices.getBeerFromApi();
  //getBeersName(String beerName) => _apiServices.getBeersNameFromApi(beerName);
}
