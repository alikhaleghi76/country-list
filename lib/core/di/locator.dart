import 'package:country_list/feature/login/data/repository/local_repository_impl.dart';
import 'package:country_list/feature/login/domain/repository/local_repository.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

Future<void> initializeDependencies() async {

  locator.registerSingleton<LocalRepository>(
    LocalRepositoryImpl(),
  );

}
