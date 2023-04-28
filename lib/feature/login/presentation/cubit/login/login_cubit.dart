import 'dart:async';
import 'package:country_list/feature/login/domain/model/user.dart';
import 'package:country_list/feature/login/domain/repository/local_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LocalRepository _localRepository;

  LoginCubit(this._localRepository) : super(const LoginStateInitial());

  loginByEmail({required String email, required String password}) async {
    emit(const LoginStateLoading());
    User? user = await _localRepository.findUserByEmail(email);

      if (user == null) {
        emit(const LoginStateFailure(errorMessage: "user_not_found"));
        return;
      }
      if (user.isEnabled) {
        emit(const LoginStateSuccess());
      } else {
        emit(const LoginStateFailure(errorMessage: "user_disabled"));
      }
  }

}
