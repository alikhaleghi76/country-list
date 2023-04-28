import 'package:country_list/core/util/resource/data_state.dart';
import 'package:country_list/feature/country_list/data/repository/api_repository_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dio/dio.dart';

class MockApiRepository extends Mock implements ApiRepositoryImpl {}

void main() {
  group('ApiRepository', () {
    final ApiRepositoryImpl mockApiRepository = MockApiRepository();
    setUp(() {
      TestWidgetsFlutterBinding.ensureInitialized();
    });

    test('returns a valid DataState<String> object when called with no input', () async {
      when(
        () => mockApiRepository.getCountryList(),
      ).thenAnswer((_) => Future<DataSuccess<String>>(() => const DataSuccess<String>(
          '[{"alpha2Code":"AF","alpha3Code":"AFG","altSpellings":["AF","Af\u0121\u0101nist\u0101n"],"area":652230,"borders":["IRN","PAK","TKM","UZB","TJK","CHN"],"callingCodes":["93"],"capital":"Kabul","currencies":[{"code":"AFN","name":"Afghan afghani","symbol":"\u060b"}],"demonym":"Afghan","flag":"https://raw.githubusercontent.com/esmaeil-ahmadipour/restcountries/main/svg/afg.svg","gini":27.8,"languages":[{"iso639_1":"ps","iso639_2":"pus","name":"Pashto","nativeName":"\u067e\u069a\u062a\u0648"},{"iso639_1":"uz","iso639_2":"uzb","name":"Uzbek","nativeName":"O\u02bbzbek"},{"iso639_1":"tk","iso639_2":"tuk","name":"Turkmen","nativeName":"T\u00fcrkmen"}],"latlng":[33,65],"name":"Afghanistan","nativeName":"\u0627\u0641\u063a\u0627\u0646\u0633\u062a\u0627\u0646","numericCode":"004","population":38928341,"region":"Asia","regionalBlocs":[{"acronym":"SAARC","name":"South Asian Association for Regional Cooperation"}],"subregion":"Southern Asia","timezones":["UTC+04:30"],"topLevelDomain":[".af"],"translations":{"br":"Afeganist\u00e3o","de":"Afghanistan","es":"Afganist\u00e1n","fa":"\u0627\u0641\u063a\u0627\u0646\u0633\u062a\u0627\u0646","fr":"Afghanistan","hr":"Afganistan","it":"Afghanistan","ja":"\u30a2\u30d5\u30ac\u30cb\u30b9\u30bf\u30f3","nl":"Afghanistan","pt":"Afeganist\u00e3o","ru":"\u0410\u0444\u0433\u0430\u043d\u0438\u0441\u0442\u0430\u043d","pl":"Afganistan","cs":"Afg\u00e1nist\u00e1n","zh":"\u963f\u5bcc\u6c57\u4f0a\u65af\u5170\u5171\u548c\u56fd","hu":"Afganiszt\u00e1n","se":"Afghanistan"},"cioc":"AFG"}]')));

      final result = await mockApiRepository.getCountryList();

      expect(result, isA<DataSuccess<String>>());
      expect((result).data?.isNotEmpty, true);
    });

    test('returns a valid DataState<String> object when called with no input', () async {
      when(
        () => mockApiRepository.getCountryList(),
      ).thenAnswer((_) => Future<DataFailed<String>>(() => DataFailed<String>(DioError.badResponse(
          statusCode: 403,
          requestOptions: RequestOptions(),
          response: Response<String>(requestOptions: RequestOptions(), data: "ERROR")))));

      final result = await mockApiRepository.getCountryList();

      expect(result, isA<DataFailed<String>>());
    });
  });
}
