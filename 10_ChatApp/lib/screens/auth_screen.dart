import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:chat_app/widgets/auth_form.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _auth = FirebaseAuth.instance;
  var _isLoading = false;

  void _submitAuthForm(
    String email,
    String username,
    String password,
    bool isLogin,
    BuildContext ctx,
  ) async {
    UserCredential authResult;
    try {
      setState(() {
        _isLoading = true;
      });

      if (isLogin) {
        authResult = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        print('success login');
      } else {
        authResult = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

        // Store username to firestore
        await FirebaseFirestore.instance
            .collection('users')
            .doc(authResult.user!.uid)
            .set({
          'username': username,
          'email': email,
          'password': password,
        });
      }
    } on FirebaseAuthException catch (error) {
      var message = 'An error occured, please check your credential';
      if (error.message != null) {
        message = error.message as String;
        print(message);
      }
      ScaffoldMessenger.of(ctx).showSnackBar(SnackBar(
        content: Text(message),
        backgroundColor: Theme.of(ctx).colorScheme.error,
      ));

      setState(() {
        _isLoading = false;
      });
    } catch (error) {
      // Do error handling
      print(error);

      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: AuthForm(
        submitFn: _submitAuthForm,
        isLoading: _isLoading,
      ),
    );
  }
}
