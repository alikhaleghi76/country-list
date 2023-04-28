part of 'country_cubit.dart';

@immutable
abstract class CountryState extends Equatable {
  const CountryState();

  @override
  List<Object> get props => [];
}

class CountryStateInitial extends CountryState {
  const CountryStateInitial();
}

class CountryStateLoading extends CountryState {
  const CountryStateLoading();
}

class CountryStateSuccess extends CountryState {
  final List<CountryResponse> countryList;
  const CountryStateSuccess({required this.countryList});

  @override
  List<Object> get props => [countryList];

  @override
  String toString() {
    return 'CountryStateSuccess{countryList: $countryList}';
  }
}

class CountryStateFailure extends CountryState {

  final String errorMessage;

  const CountryStateFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];

  @override
  String toString() {
    return 'CountryStateFailure{errorMessage: $errorMessage}';
  }
}
