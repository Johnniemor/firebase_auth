import 'package:auth_app/constant/image_constant.dart';
import 'package:auth_app/features/auth/cubit/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomUserImageProfile extends StatelessWidget {
  const CustomUserImageProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is AuthSuccess) {
          return Positioned(
            top: 100,
            child: SizedBox(
              height: 150.0,
              width: 150.0,
              child: CircleAvatar(
                backgroundImage:
                    const AssetImage(ImageConstant.backgroundImage),
                child: GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          child: Container(
                            decoration: const BoxDecoration(),
                            child: Image.network(
                              state.user?.photoURL ?? "",
                              fit: BoxFit.contain,
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: SizedBox(
                    height: 140.0,
                    width: 140.0,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      backgroundImage: NetworkImage(state.user?.photoURL ?? ""),
                    ),
                  ),
                ),
              ),
            ),
          );
        } else {
          return const Positioned(
            top: 100,
            child: SizedBox(
              height: 150.0,
              width: 150.0,
              child: CircleAvatar(
                backgroundImage: AssetImage(ImageConstant.backgroundImage),
                child: SizedBox(
                  height: 140.0,
                  width: 140.0,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                  ),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
