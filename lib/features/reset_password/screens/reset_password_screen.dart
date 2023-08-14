import 'package:auth_app/features/reset_password/widgets/custom_otp_textFirld.dart';

import '../../../constant/image_constant.dart';
import '../../auth/screens/login_screen.dart';
import '../../auth/screens/register_screen.dart';
import '../cubit/reset_password_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        if (state is OTPSentState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginScreen(),
            ),
          );
        } else if (state is PasswordResetFailure) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: const Text("Warning"),
                content: Text(state.errorMessage),
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
        if (state is ResetPasswordLoading) {
          return const Padding(
            padding: EdgeInsets.all(10.0),
            child: Scaffold(
              body: Center(
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
                        fit: BoxFit.cover),
                  ),
                ),
                SingleChildScrollView(
                  child: SafeArea(
                    child: Form(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Center(
                          child: Column(
                            children: [
                              const Text(
                                "Reset Password",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              const SizedBox(height: 30),
                              const Text(
                                "Enter your email address",
                                style: TextStyle(color: Colors.white),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: TextFormField(
                                  controller: _emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    errorBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.red),
                                    ),
                                    hintText: 'Enter your email',
                                  ),
                                  validator: (value) {
                                    // ToDo: Add your own validation logic here
                                    return 'Please enter your email';
                                  },
                                ),
                              ),
                              const SizedBox(height: 30),
                              const Text(
                                "Enter Verification Code",
                                style: TextStyle(color: Colors.white),
                              ),
                              const SizedBox(height: 20),
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CustomOtpTextField(),
                                  CustomOtpTextField(),
                                  CustomOtpTextField(),
                                  CustomOtpTextField(),
                                ],
                              ),
                              const SizedBox(height: 30),
                              TextButton(
                                child: Text(
                                  "Back to sign in",
                                  style: TextStyle(color: Colors.grey[400]),
                                ),
                                onPressed: () {
                                  // TO DO: Add your own logic here.
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LoginScreen(),
                                    ),
                                  );
                                },
                              ),
                              Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height: 50,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(30.0),
                                      ),
                                    ),
                                    onPressed: () {
                                      // TO Do: Add your own logic here.
                                      if (_formKey.currentState!.validate() ==
                                          false) {
                                        final email =
                                            _emailController.text.trim();
                                        context
                                            .read<ResetPasswordCubit>()
                                            .sendOTP(email);
                                      }
                                      return;
                                    },
                                    child: const Text("Send"),
                                  ),
                                ),
                              ),
                              const SizedBox(height: 30),
                              Divider(
                                height: 20,
                                color: Colors.grey[400],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Don't have an account?",
                                    style: TextStyle(color: Colors.grey[400]),
                                  ),
                                  TextButton(
                                    child: const Text(
                                      "Sign Up",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () {
                                      // To Do: Add your own logic here.
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              RegisterScreen(),
                                        ),
                                      );
                                    },
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        }
      },
    );
  }
}
