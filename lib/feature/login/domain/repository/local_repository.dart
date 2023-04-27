import 'package:country_list/feature/login/domain/model/user.dart';

abstract class LocalRepository {

  Future<User?> findUserByEmail(String email);

}
