import 'package:country_list/core/di/locator.dart';
import 'package:country_list/feature/country_list/presentation/screen/country_list_screen.dart';
import 'package:country_list/feature/login/domain/repository/local_repository.dart';
import 'package:country_list/feature/login/presentation/cubit/login/login_cubit.dart';
import 'package:country_list/feature/login/presentation/screen/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Routes{

  static const login = "/";
  static const countryList = "/countryList";

  Widget getScreen(String route) {
    switch (route) {
      case Routes.login:
        return BlocProvider(
            create: (_) => LoginCubit(locator<LocalRepository>()),
            child: const LoginScreen());
      case Routes.countryList:
        return const CountryListScreen();
      default:
        return Container();
    }
  }

}
