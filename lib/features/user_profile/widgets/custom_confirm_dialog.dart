import 'package:auth_app/features/auth/cubit/auth_cubit.dart';
import 'package:auth_app/features/auth/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> customConfirmDialog(BuildContext context) async {
  Widget cancelButton = TextButton(
    child: const Text("Cancel"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  Widget continueButton = TextButton(
    child: const Text("Continue"),
    onPressed: () {
      BlocProvider.of<AuthCubit>(context).signOut();
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      );
    },
  );
  AlertDialog alert = AlertDialog(
    title: const Text("Warning"),
    content: const Text(
      "Would you like to log out from this account?",
    ),
    actions: [
      cancelButton,
      continueButton,
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
