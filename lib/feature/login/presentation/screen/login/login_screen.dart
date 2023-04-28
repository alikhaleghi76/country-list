import 'package:country_list/core/config/consts.dart';
import 'package:country_list/core/multi_lang/app_local.dart';
import 'package:country_list/core/router/routes.dart';
import 'package:country_list/core/util/validators.dart';
import 'package:country_list/feature/login/presentation/cubit/login/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isSubmitDisabled = true;
  String _errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(listener: (context, state) {
      if (state is LoginStateSuccess) {
        Navigator.of(context).pushReplacementNamed(Routes.countryList);
      }
      if (state is LoginStateFailure) {
        _showSnackBar(context, AppLocal.of(context).getTranslate(state.errorMessage));
      }
    }, builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: Text(AppLocal.of(context).getTranslate('login')),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      hintText: AppLocal.of(context).getTranslate('email'),
                    ),
                    enabled: state is! LoginStateLoading,
                    onChanged: (_) => _validateForm(context),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: AppLocal.of(context).getTranslate('password'),
                    ),
                    enabled: state is! LoginStateLoading,
                    onChanged: (_) => _validateForm(context),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: (_isSubmitDisabled || state is LoginStateLoading)
                        ? null
                        : () {
                            _login(context, _emailController.value.text, _passwordController.value.text);
                          },
                    child: state is LoginStateLoading
                        ? const SizedBox(
                            width: Consts.buttonLoadingSize,
                            height: Consts.buttonLoadingSize,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                            ))
                        : Text(AppLocal.of(context).getTranslate('login')),
                  ),
                  if (_errorMessage.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: Text(
                        _errorMessage,
                        style: const TextStyle(color: Colors.red),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  void _login(BuildContext context, String email, String password) {
    BlocProvider.of<LoginCubit>(context).loginByEmail(email: email, password: password);
  }

  void _validateForm(BuildContext context) {
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();

    if (isEmailValid(email) && isPasswordValid(password)) {
      setState(() {
        _isSubmitDisabled = false;
        _errorMessage = '';
      });
    } else {
      setState(() {
        _isSubmitDisabled = true;
        _errorMessage = AppLocal.of(context).getTranslate('invalid_data');
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _showSnackBar(BuildContext context, String message) {
    var snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
