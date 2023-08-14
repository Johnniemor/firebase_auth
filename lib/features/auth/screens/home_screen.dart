import 'package:auth_app/constant/image_constant.dart';
import 'package:auth_app/features/auth/cubit/auth_cubit.dart';
import 'package:auth_app/features/auth/screens/login_screen.dart';
import 'package:auth_app/features/user_profile/screen.dart/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          return Scaffold(
              appBar: PreferredSize(
                preferredSize: const Size.fromHeight(70.0),
                child: AppBar(
                  automaticallyImplyLeading: false,
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text("Welcome"),
                      const SizedBox(height: 5),
                      Text(
                        state.user!.email.toString(),
                        style: TextStyle(fontSize: 12, color: Colors.grey[300]),
                      ),
                    ],
                  ),
                  actions: [
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const ProfileScreen();
                          },
                        ),
                      ),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage:
                            NetworkImage(state.user?.photoURL ?? ""),
                      ),
                    )
                  ],
                ),
              ),
              body: Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(ImageConstant.backgroundImage),
                          fit: BoxFit.cover),
                    ),
                  ),
                ],
              ));
        } else {
          return const Scaffold(
            body: Padding(
              padding: EdgeInsets.all(10.0),
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }
      },
    );
  }
}
