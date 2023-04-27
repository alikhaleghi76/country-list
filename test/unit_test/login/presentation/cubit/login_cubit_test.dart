import 'package:country_list/feature/login/domain/model/user.dart';
import 'package:country_list/feature/login/domain/repository/local_repository.dart';
import 'package:country_list/feature/login/presentation/cubit/login/login_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';

class MockLocalRepository extends Mock implements LocalRepository {}

class MockUser extends Mock implements User {}

void main() {
  late MockLocalRepository mockLocalRepository;

  setUp(() {
    mockLocalRepository = MockLocalRepository();
  });

  group('LoginCubit', () {
    test('initial state is LoginStateInitial', () {
      final registerBloc = LoginCubit(mockLocalRepository);
      expect(registerBloc.state, const LoginStateInitial());
    });

    blocTest<LoginCubit, LoginState>(
        'should emits [loading, user not found]'
        'when the user email is not found',
        setUp: () {
          when(
            () => mockLocalRepository.findUserByEmail(
              'ali@gmail.com',
            ),
          ).thenAnswer((_) => Future<User?>.value(null));
        },
        build: () => LoginCubit(mockLocalRepository),
        act: (cubit) async {
          cubit.loginByEmail(email: "ali@gmail.com", password: "Abcd1234");
        },
        expect: () {
          return [const LoginStateLoading(), const LoginStateFailure(errorMessage: "User not found")];
        },
        verify: (bloc) {
          verify(() => mockLocalRepository.findUserByEmail('ali@gmail.com')).called(1);
        });
    blocTest<LoginCubit, LoginState>(
        'should emits [loading, disabled user]'
        'when the user email is valid but user is disabled',
        setUp: () {
          when(
            () => mockLocalRepository.findUserByEmail(
              'sara@gmail.com',
            ),
          ).thenAnswer((_) => Future<User?>.value(User(email: 'sara@gmail.com', username: 'sara', isEnabled: false)));
        },
        build: () => LoginCubit(mockLocalRepository),
        act: (cubit) async {
          cubit.loginByEmail(email: "sara@gmail.com", password: "Abcd1234");
        },
        expect: () {
          return [const LoginStateLoading(), const LoginStateFailure(errorMessage: "User is disabled")];
        },
        verify: (bloc) {
          verify(() => mockLocalRepository.findUserByEmail('sara@gmail.com')).called(1);
        });
    blocTest<LoginCubit, LoginState>(
        'should emits [loading, success]'
        'when the user email is valid and user is enabled',
        setUp: () {
          when(
            () => mockLocalRepository.findUserByEmail(
              'mina@gmail.com',
            ),
          ).thenAnswer((_) => Future<User?>.value(User(email: 'mina@gmail.com', username: 'mina', isEnabled: true)));
        },
        build: () => LoginCubit(mockLocalRepository),
        act: (cubit) async {
          cubit.loginByEmail(email: "mina@gmail.com", password: "Abcd1234");
        },
        expect: () {
          return [const LoginStateLoading(), const LoginStateSuccess()];
        },
        verify: (bloc) {
          verify(() => mockLocalRepository.findUserByEmail('mina@gmail.com')).called(1);
        });
  });
}
