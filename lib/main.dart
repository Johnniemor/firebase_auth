import 'package:auth_app/features/auth/cubit/auth_cubit.dart';
import 'package:auth_app/features/auth/screens/login_screen.dart';
import 'package:auth_app/features/reset_password/cubit/reset_password_cubit.dart';
import 'package:auth_app/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<AuthCubit>(
            create: (context) => AuthCubit(),
          ),
          BlocProvider<ResetPasswordCubit>(
            create: (context) => ResetPasswordCubit(),
          ),
        ],
        child: const MaterialApp(
          home: LoginScreen(),
        ));
  }
}
