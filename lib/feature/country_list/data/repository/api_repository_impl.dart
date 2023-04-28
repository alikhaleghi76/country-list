import 'package:country_list/core/util/resource/data_state.dart';
import 'package:country_list/feature/country_list/data/datasource/remote/country_api_service.dart';
import 'package:country_list/feature/country_list/data/repository/base/base_api_repository.dart';
import 'package:country_list/feature/country_list/domain/repository/api_repository.dart';

class ApiRepositoryImpl extends BaseApiRepository implements ApiRepository {
  final CountryApiService _countryApiService;

  ApiRepositoryImpl(this._countryApiService);

  @override
  Future<DataState<String>> getCountryList() {
    return getStateOf<String>(
      request: () => _countryApiService.getCountryList(),
    );
  }
}
