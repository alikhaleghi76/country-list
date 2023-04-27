import 'package:country_list/core/di/locator.dart';
import 'package:country_list/feature/login/domain/model/user.dart';
import 'package:country_list/feature/login/domain/repository/local_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('User Repository Tests', () {
    LocalRepository? localRepository;

    setUp(() {
      TestWidgetsFlutterBinding.ensureInitialized();
      initializeDependencies();
      localRepository = locator<LocalRepository>();
    });

    test('Find User By Email Test', () async {
      // Define the expected user data.
      final expectedUser = User(
        username: "sara",
        email: "sara@gmail.com",
        isEnabled: false
      );

      // Call the findUserByEmail method on the user repository.
      final user = await localRepository?.findUserByEmail('sara@gmail.com');

      // Ensure that the returned user matches the expected user.
      expect(user!.username, equals(expectedUser.username));
      expect(user.email, equals(expectedUser.email));
      expect(user.isEnabled, equals(expectedUser.isEnabled));
    });
  });
}