import 'package:auth_app/features/user_profile/widgets/custom_upload_image_profile.dart';

import '../../../constant/image_constant.dart';
import '../../auth/cubit/auth_cubit.dart';
import '../widgets/custom_confirm_dialog.dart';
import '../widgets/custom_user_profile_image.dart';
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
                      top: 210,
                      right: 140,
                      child: CircleAvatar(
                        child: IconButton(
                          onPressed: () => customUploadImageProfile(
                            context: context,
                            onSelectImage: (p0) {},
                          ),
                          icon: const Icon(Icons.camera_alt),
                        ),
                      ),
                    ),
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
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SizedBox(
                            width: size.width,
                            height: 50,
                            child: ElevatedButton(
                              style: const ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.red),
                              ),
                              onPressed: () => customConfirmDialog(context),
                              child: const Text("Log Out"),
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
