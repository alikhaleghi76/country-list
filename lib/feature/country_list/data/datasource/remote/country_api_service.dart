import 'package:country_list/core/config/strings.dart';
import 'package:country_list/feature/country_list/domain/model/response/country_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'country_api_service.g.dart';

@RestApi(baseUrl: baseUrl)
abstract class CountryApiService {
  factory CountryApiService(Dio dio, {String baseUrl}) = _CountryApiService;

  @GET('/esmaeil-ahmadipour/restcountries/main/json/countriesV2.json')
  Future<HttpResponse<String>> getCountryList();
}
