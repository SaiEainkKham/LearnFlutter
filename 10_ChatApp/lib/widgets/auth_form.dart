import 'package:flutter/material.dart';

class AuthForm extends StatefulWidget {
  const AuthForm({required this.submitFn, required this.isLoading, super.key});

  final void Function(
    String email,
    String username,
    String password,
    bool isLogin,
    BuildContext ctx,
  ) submitFn;
  final bool isLoading;

  @override
  State<AuthForm> createState() => _AuthFormState();
}

class _AuthFormState extends State<AuthForm> {
  final _formKey = GlobalKey<FormState>();
  var _isLogin = false;

  var _userEmail = '';
  var _userName = '';
  var _userPassword = '';

  void _trySubmit() {
    final isValid = _formKey.currentState!.validate();
    FocusScope.of(context).unfocus();

    if (isValid) {
      _formKey.currentState!.save();
      widget.submitFn(
        _userEmail.trim(),
        _userName.trim(),
        _userPassword.trim(),
        _isLogin,
        context,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        margin: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    key: const ValueKey('email'),
                    validator: (value) {
                      if (value == null || !value.contains('@')) {
                        return 'Please enter a valid email address.';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration:
                        const InputDecoration(label: Text('Email address')),
                    onSaved: (value) {
                      _userEmail = value as String;
                    },
                  ),
                  if (!_isLogin)
                    TextFormField(
                      key: const ValueKey('username'),
                      validator: (value) {
                        if (value == null) {
                          return 'Please enter a valid username.';
                        }
                        if (value.length < 4) {
                          return 'Please enter at least 4 characters long.';
                        }
                        return null;
                      },
                      decoration:
                          const InputDecoration(label: Text('Username')),
                      onSaved: (value) {
                        _userName = value as String;
                      },
                    ),
                  TextFormField(
                    key: const ValueKey('password'),
                    validator: (value) {
                      if (value == null) {
                        return 'Please provide the password.';
                      }
                      if (value.length < 6) {
                        return 'Please enter at least 6 characters long.';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(label: Text('Password')),
                    obscureText: true,
                    onSaved: (value) {
                      _userPassword = value as String;
                    },
                  ),
                  const SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: _trySubmit,
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text(_isLogin ? 'Log in' : 'Sign up'),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        _isLogin = !_isLogin;
                      });
                    },
                    child: Text(_isLogin
                        ? 'Create a new account'
                        : 'Already have an account'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
