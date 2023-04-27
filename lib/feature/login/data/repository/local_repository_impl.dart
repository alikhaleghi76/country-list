import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:country_list/feature/login/domain/model/user.dart';
import 'package:country_list/feature/login/domain/repository/local_repository.dart';
import 'package:flutter/services.dart';

class LocalRepositoryImpl extends LocalRepository {
  @override
  Future<User?> findUserByEmail(String email) async {
    await Future.delayed(const Duration(seconds: 3), () async {});

    final String usersString = await rootBundle.loadString('assets/json/users.json');

    List<User> users = (jsonDecode(usersString) as List).map((json) => User.fromJson(json)).toList();

    User? user = users.firstWhereOrNull((element) => element.email == email);

    return user;
  }
}
