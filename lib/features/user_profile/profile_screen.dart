import 'package:auth_app/features/user_profile/user_account/user_account_screen.dart';
import 'package:auth_app/features/user_profile/widgets/custom_menu_button.dart';

import '../../constant/image_constant.dart';
import '../auth/cubit/auth_cubit.dart';
import 'widgets/custom_confirm_dialog.dart';
import 'widgets/custom_user_profile_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Container(
                width: size.width,
                height: size.height,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      bottom: 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 18),
                        height: size.height * 0.8,
                        width: size.width,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(ImageConstant.backgroundImage),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                      ),
                    ),
                    const CustomUserImageProfile(),
                    Positioned(
                      top: 270,
                      child: state.user?.displayName == ""
                          ? Text(
                              state.user?.displayName ?? "",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            )
                          : const Text(
                              "User name",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                    ),
                    Positioned(
                      top: 300,
                      child: Text(
                        state.user?.email ?? "",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey[300],
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CustomMenuButton(
                          title: 'My account',
                          onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => UserAccountScreen(),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: GestureDetector(
                            onTap: () => customConfirmDialog(context),
                            child: Container(
                              width: size.width,
                              height: 50,
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: const Offset(0, 3),
                                    )
                                  ],
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(15.0),
                                  ),
                                  color: Colors.red),
                              child: const Center(
                                child: Text(
                                  "Log Out",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}
