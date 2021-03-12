import 'package:dio/dio.dart';

class HandleError {
  void handleError(e) {
    if (e is DioError) {
      switch (e.response.statusCode) {
        case 400:
          throw Exception(e.response.statusMessage);
          break;
        case 401:
          throw Exception(e.response.statusMessage);
          break;
        case 403:
          throw Exception(e.response.statusMessage);
          break;
        case 404:
          throw Exception(e.response.statusMessage);
          break;
        case 409:
          throw Exception(e.response.statusMessage);
          break;
        case 408:
          throw Exception(e.response.statusMessage);
          break;
        case 500:
          throw Exception("Server error : \n Try another request");
          break;
        case 503:
          throw Exception(e.response.statusMessage);
          break;
      }
    } else
      throw Exception(e);
  }
}
