import 'package:country_list/core/util/resource/data_state.dart';
import 'package:country_list/feature/country_list/domain/model/response/country_response.dart';
import 'package:country_list/feature/country_list/domain/repository/api_repository.dart';
import 'package:country_list/feature/country_list/presentation/cubit/country/country_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';

class MockApiRepository extends Mock implements ApiRepository {}

void main() {
  late MockApiRepository mockApiRepository;

  setUp(() {
    mockApiRepository = MockApiRepository();
  });

  group('CountryCubit', () {
    test('initial state is CountryStateInitial', () {
      final countryBloc = CountryCubit(mockApiRepository);
      expect(countryBloc.state, const CountryStateInitial());
    });

    blocTest<CountryCubit, CountryState>(
        'should emits [loading, success]'
        'when get country list called',
        setUp: () {
          when(
            () => mockApiRepository.getCountryList(),
          ).thenAnswer((_) => Future<DataSuccess<String>>.value(const DataSuccess(
              '[{"alpha2Code":"AF","alpha3Code":"AFG","altSpellings":["AF","Af\u0121\u0101nist\u0101n"],"area":652230,"borders":["IRN","PAK","TKM","UZB","TJK","CHN"],"callingCodes":["93"],"capital":"Kabul","currencies":[{"code":"AFN","name":"Afghan afghani","symbol":"\u060b"}],"demonym":"Afghan","flag":"https://raw.githubusercontent.com/esmaeil-ahmadipour/restcountries/main/svg/afg.svg","gini":27.8,"languages":[{"iso639_1":"ps","iso639_2":"pus","name":"Pashto","nativeName":"\u067e\u069a\u062a\u0648"},{"iso639_1":"uz","iso639_2":"uzb","name":"Uzbek","nativeName":"O\u02bbzbek"},{"iso639_1":"tk","iso639_2":"tuk","name":"Turkmen","nativeName":"T\u00fcrkmen"}],"latlng":[33,65],"name":"Afghanistan","nativeName":"\u0627\u0641\u063a\u0627\u0646\u0633\u062a\u0627\u0646","numericCode":"004","population":38928341,"region":"Asia","regionalBlocs":[{"acronym":"SAARC","name":"South Asian Association for Regional Cooperation"}],"subregion":"Southern Asia","timezones":["UTC+04:30"],"topLevelDomain":[".af"],"translations":{"br":"Afeganist\u00e3o","de":"Afghanistan","es":"Afganist\u00e1n","fa":"\u0627\u0641\u063a\u0627\u0646\u0633\u062a\u0627\u0646","fr":"Afghanistan","hr":"Afganistan","it":"Afghanistan","ja":"\u30a2\u30d5\u30ac\u30cb\u30b9\u30bf\u30f3","nl":"Afghanistan","pt":"Afeganist\u00e3o","ru":"\u0410\u0444\u0433\u0430\u043d\u0438\u0441\u0442\u0430\u043d","pl":"Afganistan","cs":"Afg\u00e1nist\u00e1n","zh":"\u963f\u5bcc\u6c57\u4f0a\u65af\u5170\u5171\u548c\u56fd","hu":"Afganiszt\u00e1n","se":"Afghanistan"},"cioc":"AFG"}]')));
        },
        build: () => CountryCubit(mockApiRepository),
        act: (cubit) async {
          cubit.loadCountries();
        },
        expect: () {
          return [
            const CountryStateLoading(),
            CountryStateSuccess(countryList: [
              CountryResponse(
                alpha2Code: "AF",
                alpha3Code: "AFG",
                altSpellings: ["AF", "Af\u0121\u0101nist\u0101n"],
                area: 652230,
                borders: ["IRN", "PAK", "TKM", "UZB", "TJK", "CHN"],
                callingCodes: ["93"],
                capital: "Kabul",
                currencies: [
                  Currency(
                    code: "AFN",
                    name: "Afghan afghani",
                    symbol: "\u060b",
                  ),
                ],
                demonym: "Afghan",
                flag: "https://raw.githubusercontent.com/esmaeil-ahmadipour/restcountries/main/svg/afg.svg",
                gini: 27.8,
                languages: [
                  Language(
                    iso6391: "ps",
                    iso6392: "pus",
                    name: "Pashto",
                    nativeName: "\u067e\u069a\u062a\u0648",
                  ),
                  Language(
                    iso6391: "uz",
                    iso6392: "uzb",
                    name: "Uzbek",
                    nativeName: "O\u02bbzbek",
                  ),
                  Language(
                    iso6391: "tk",
                    iso6392: "tuk",
                    name: "Turkmen",
                    nativeName: "T\u00fcrkmen",
                  ),
                ],
                latlng: [33, 65],
                name: "Afghanistan",
                nativeName: "\u0627\u0641\u063a\u0627\u0646\u0633\u062a\u0627\u0646",
                numericCode: "004",
                population: 38928341,
                region: Region.ASIA,
                regionalBlocs: [
                  RegionalBloc(
                    acronym: Acronym.SAARC,
                    name: Name.SOUTH_ASIAN_ASSOCIATION_FOR_REGIONAL_COOPERATION,
                  ),
                ],
                subregion: "Southern Asia",
                timezones: ["UTC+04:30"],
                topLevelDomain: [".af"],
                translations: Translations(
                  br: "Afeganist\u00e3o",
                  de: "Afghanistan",
                  es: "Afganist\u00e1n",
                  fa: "\u0627\u0641\u063a\u0627\u0646\u0633\u062a\u0627\u0646",
                  fr: "Afghanistan",
                  hr: "Afganistan",
                  it: "Afghanistan",
                  ja: "\u30a2\u30d5\u30ac\u30cb\u30b9\u30bf\u30f3",
                  nl: "Afghanistan",
                  pt: "Afeganist\u00e3o",
                  ru: "\u0410\u0444\u0433\u0430\u043d\u0438\u0441\u0442\u0430\u043d",
                  pl: "Afganistan",
                  cs: "Afg\u00e1nist\u00e1n",
                  zh: "\u963f\u5bcc\u6c57\u4f0a\u65af\u5170\u5171\u548c\u56fd",
                  hu: "Afganiszt\u00e1n",
                  se: "Afghanistan",
                ),
                cioc: "AFG",
              )
            ])
          ];
        },
        verify: (bloc) {
          verify(() => mockApiRepository.getCountryList()).called(1);
        });

    blocTest<CountryCubit, CountryState>(
        'should emits [loading, failure]'
        'when get country list called and has error',
        setUp: () {
          when(
            () => mockApiRepository.getCountryList(),
          ).thenAnswer((_) => Future<DataSuccess<String>>.value(const DataSuccess(
              '[{"alpha2Code":"AF","alpha3Code":"AFG","altSpellings":["AF","Af\u0121\u0101nist\u0101n"],"area":652230,"borders":["IRN","PAK","TKM","UZB","TJK","CHN"],"callingCodes":["93"],"capital":"Kabul","currencies":[{"code":"AFN","name":"Afghan afghani","symbol":"\u060b"}],"demonym":"Afghan","flag":"https://raw.githubusercontent.com/esmaeil-ahmadipour/restcountries/main/svg/afg.svg","gini":27.8,"languages":[{"iso639_1":"ps","iso639_2":"pus","name":"Pashto","nativeName":"\u067e\u069a\u062a\u0648"},{"iso639_1":"uz","iso639_2":"uzb","name":"Uzbek","nativeName":"O\u02bbzbek"},{"iso639_1":"tk","iso639_2":"tuk","name":"Turkmen","nativeName":"T\u00fcrkmen"}],"latlng":[33,65],"name":"Afghanistan","nativeName":"\u0627\u0641\u063a\u0627\u0646\u0633\u062a\u0627\u0646","numericCode":"004","population":38928341,"region":"Asia","regionalBlocs":[{"acronym":"SAARC","name":"South Asian Association for Regional Cooperation"}],"subregion":"Southern Asia","timezones":["UTC+04:30"],"topLevelDomain":[".af"],"translations":{"br":"Afeganist\u00e3o","de":"Afghanistan","es":"Afganist\u00e1n","fa":"\u0627\u0641\u063a\u0627\u0646\u0633\u062a\u0627\u0646","fr":"Afghanistan","hr":"Afganistan","it":"Afghanistan","ja":"\u30a2\u30d5\u30ac\u30cb\u30b9\u30bf\u30f3","nl":"Afghanistan","pt":"Afeganist\u00e3o","ru":"\u0410\u0444\u0433\u0430\u043d\u0438\u0441\u0442\u0430\u043d","pl":"Afganistan","cs":"Afg\u00e1nist\u00e1n","zh":"\u963f\u5bcc\u6c57\u4f0a\u65af\u5170\u5171\u548c\u56fd","hu":"Afganiszt\u00e1n","se":"Afghanistan"},"cioc":"AFG"}]')));
        },
        build: () => CountryCubit(mockApiRepository),
        act: (cubit) async {
          cubit.loadCountries();
        },
        expect: () {
          return [
            const CountryStateLoading(),
            CountryStateSuccess(countryList: [
              CountryResponse(
                alpha2Code: "AF",
                alpha3Code: "AFG",
                altSpellings: ["AF", "Af\u0121\u0101nist\u0101n"],
                area: 652230,
                borders: ["IRN", "PAK", "TKM", "UZB", "TJK", "CHN"],
                callingCodes: ["93"],
                capital: "Kabul",
                currencies: [
                  Currency(
                    code: "AFN",
                    name: "Afghan afghani",
                    symbol: "\u060b",
                  ),
                ],
                demonym: "Afghan",
                flag: "https://raw.githubusercontent.com/esmaeil-ahmadipour/restcountries/main/svg/afg.svg",
                gini: 27.8,
                languages: [
                  Language(
                    iso6391: "ps",
                    iso6392: "pus",
                    name: "Pashto",
                    nativeName: "\u067e\u069a\u062a\u0648",
                  ),
                  Language(
                    iso6391: "uz",
                    iso6392: "uzb",
                    name: "Uzbek",
                    nativeName: "O\u02bbzbek",
                  ),
                  Language(
                    iso6391: "tk",
                    iso6392: "tuk",
                    name: "Turkmen",
                    nativeName: "T\u00fcrkmen",
                  ),
                ],
                latlng: [33, 65],
                name: "Afghanistan",
                nativeName: "\u0627\u0641\u063a\u0627\u0646\u0633\u062a\u0627\u0646",
                numericCode: "004",
                population: 38928341,
                region: Region.ASIA,
                regionalBlocs: [
                  RegionalBloc(
                    acronym: Acronym.SAARC,
                    name: Name.SOUTH_ASIAN_ASSOCIATION_FOR_REGIONAL_COOPERATION,
                  ),
                ],
                subregion: "Southern Asia",
                timezones: ["UTC+04:30"],
                topLevelDomain: [".af"],
                translations: Translations(
                  br: "Afeganist\u00e3o",
                  de: "Afghanistan",
                  es: "Afganist\u00e1n",
                  fa: "\u0627\u0641\u063a\u0627\u0646\u0633\u062a\u0627\u0646",
                  fr: "Afghanistan",
                  hr: "Afganistan",
                  it: "Afghanistan",
                  ja: "\u30a2\u30d5\u30ac\u30cb\u30b9\u30bf\u30f3",
                  nl: "Afghanistan",
                  pt: "Afeganist\u00e3o",
                  ru: "\u0410\u0444\u0433\u0430\u043d\u0438\u0441\u0442\u0430\u043d",
                  pl: "Afganistan",
                  cs: "Afg\u00e1nist\u00e1n",
                  zh: "\u963f\u5bcc\u6c57\u4f0a\u65af\u5170\u5171\u548c\u56fd",
                  hu: "Afganiszt\u00e1n",
                  se: "Afghanistan",
                ),
                cioc: "AFG",
              )
            ])
          ];
        },
        verify: (bloc) {
          verify(() => mockApiRepository.getCountryList()).called(1);
        });
  });
}
