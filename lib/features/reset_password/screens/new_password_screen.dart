import 'package:auth_app/features/reset_password/widgets/custom_new_password_textField.dart';
import 'package:flutter/material.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text('New Password'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 80.0),
            const Padding(
              padding: EdgeInsets.only(
                left: 20.0,
                right: 20.0,
                bottom: 10.0,
              ),
              child: Text(
                "Confirm New Password",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const CustomNewPasswordTextField(),
            const Padding(
              padding: EdgeInsets.only(
                left: 20.0,
                right: 20.0,
                bottom: 10.0,
              ),
              child: Text(
                "Confirm Password",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            const CustomNewPasswordTextField(),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  onPressed: () {
                    // TO Do: Add your own logic here.
                  },
                  child: const Text("Confirm"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
