import 'package:awesome_dio_interceptor/awesome_dio_interceptor.dart';
import 'package:country_list/feature/country_list/data/datasource/remote/country_api_service.dart';
import 'package:country_list/feature/country_list/data/repository/api_repository_impl.dart';
import 'package:country_list/feature/country_list/domain/repository/api_repository.dart';
import 'package:country_list/feature/login/data/repository/local_repository_impl.dart';
import 'package:country_list/feature/login/domain/repository/local_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';

final locator = GetIt.instance;

Future<void> initializeDependencies() async {

  locator.registerSingleton<LocalRepository>(
    LocalRepositoryImpl(),
  );

  final dio = Dio();
  dio.interceptors.add(AwesomeDioInterceptor());
  locator.registerSingleton<Dio>(dio);

  locator.registerSingleton<CountryApiService>(
    CountryApiService(locator<Dio>()),
  );

  locator.registerSingleton<ApiRepository>(
    ApiRepositoryImpl(locator<CountryApiService>()),
  );


}
