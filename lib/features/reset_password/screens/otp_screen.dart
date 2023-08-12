import 'package:auth_app/features/reset_password/screens/new_password_screen.dart';
import 'package:auth_app/features/reset_password/widgets/custom_otp_textFirld.dart';
import 'package:flutter/material.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.black,
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: const Text('Verification'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text("Enter Verification Code"),
                const SizedBox(height: 20.0),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomOtpTextField(),
                    CustomOtpTextField(),
                    CustomOtpTextField(),
                    CustomOtpTextField(),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("If you didn't receive a code."),
                    TextButton(
                      child: const Text(
                        "Resend",
                        style: TextStyle(color: Colors.orange),
                      ),
                      onPressed: () {
                        // TO Do: logic here Resend code.
                      },
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox(
                    height: 50,
                    width: MediaQuery.of(context).size.width,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      onPressed: () {
                        // To DO: logic here Button.
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NewPasswordScreen(),
                          ),
                        );
                      },
                      child: const Text("Send"),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
