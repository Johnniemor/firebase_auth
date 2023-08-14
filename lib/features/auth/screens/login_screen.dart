import 'package:auth_app/constant/image_constant.dart';
import 'package:auth_app/features/auth/cubit/auth_cubit.dart';
import 'package:auth_app/features/auth/screens/home_screen.dart';
import 'package:auth_app/features/auth/screens/register_screen.dart';
import 'package:auth_app/features/auth/widgets/custom_password_textField.dart';
import 'package:auth_app/features/reset_password/screens/reset_password_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  bool hintText = true;

  void _onHintText() {
    setState(() {
      hintText = !hintText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ),
          );
        } else if (state is AuthFailure) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Warning"),
                content: const Text("Invalid email or password"),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("Try again"),
                  ),
                ],
              );
            },
          );
        }
      },
      builder: (context, state) {
        if (state is AuthLoading) {
          return const Scaffold(
            body: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        } else {
          return Scaffold(
            body: Stack(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(ImageConstant.backgroundImage),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Center(
                      child: SingleChildScrollView(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Image(
                                image: AssetImage(ImageConstant.instagramIcon),
                                height: 100,
                              ),
                              const SizedBox(height: 30),
                              TextFormField(
                                controller: _emailController,
                                keyboardType: TextInputType.emailAddress,
                                style: const TextStyle(color: Colors.black),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  errorBorder: const OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.red),
                                  ),
                                  hintText: 'Email address',
                                ),
                                validator: _validateEmail,
                              ),
                              const SizedBox(height: 10),
                              CustomPasswordFormField(
                                  controller: _passwordController,
                                  keyboardType: TextInputType.text,
                                  hintText: 'Password',
                                  obscureText: hintText,
                                  iconButton: IconButton(
                                    onPressed: _onHintText,
                                    icon: Icon(
                                      hintText
                                          ? Icons.visibility
                                          : Icons.visibility_off,
                                    ),
                                  ),
                                  validator: _validatePassword),
                              const SizedBox(height: 20),
                              TextButton(
                                onPressed: () {
                                  // ToDo: Forget password Future.
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          ResetPasswordScreen(),
                                    ),
                                  );
                                },
                                child: const Text(
                                  "Forget your password?",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              const SizedBox(height: 25),
                              SizedBox(
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                    ),
                                  ),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      final email =
                                          _emailController.text.trim();
                                      final password =
                                          _passwordController.text.trim();

                                      context
                                          .read<AuthCubit>()
                                          .login(email, password);
                                    }
                                  },
                                  child: const Text(
                                    "Log In",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 30),
                              const Text(
                                "OR",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 10),
                              TextButton(
                                onPressed: () {
                                  // ToDo: Login with facebook future.
                                  BlocProvider.of<AuthCubit>(context)
                                      .signInWithGoogle();
                                },
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image(
                                      image:
                                          AssetImage(ImageConstant.googleIcon),
                                      height: 20,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      "Continue as Google",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 20),
                              const Divider(
                                height: 10,
                                color: Colors.grey,
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    "Don't have an account?",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  TextButton(
                                    child: const Text(
                                      "Sign Up",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () {
                                      // ToDo: Sign Up Navigation
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              RegisterScreen(),
                                        ),
                                      );
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your email or password.";
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Please enter your email or password.";
    } else if (value.length < 6) {
      return "Password must be at least 6 characters long.";
    }
    return null;
  }
}
