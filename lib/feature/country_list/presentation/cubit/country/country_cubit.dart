import 'package:country_list/core/util/resource/data_state.dart';
import 'package:country_list/feature/country_list/domain/model/response/country_response.dart';
import 'package:country_list/feature/country_list/domain/repository/api_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'country_state.dart';

class CountryCubit extends Cubit<CountryState> {
  final ApiRepository _apiRepository;

  CountryCubit(this._apiRepository) : super(const CountryStateInitial());

  loadCountries() async {
    emit(const CountryStateLoading());
    DataState<String> response = await _apiRepository.getCountryList();

      if (response is DataSuccess) {
        List<CountryResponse> countryList = countryResponseFromJson(response.data ?? "[]");
        emit(CountryStateSuccess(countryList: countryList ?? []));
      } else if (response is DataFailed){
        emit(CountryStateFailure(errorMessage: (response.error?.message ?? 'Error, Try again.')));
      }
  }

}
