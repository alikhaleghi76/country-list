import 'package:country_list/core/util/resource/data_state.dart';

abstract class ApiRepository {
  Future<DataState<String>> getCountryList();
}
