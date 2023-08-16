import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'upload_user_image_state.dart';

class UploadUserImageCubit extends Cubit<UploadUserImageState> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  UploadUserImageCubit() : super(UploadUserImageInitial());

  Future<void> updateProfilePicture(File imageFile) async {
    try {
      emit(UploadUserImageLoading());
      final user = _firebaseAuth.currentUser;
      final storageRef =
          FirebaseStorage.instance.ref().child('user_profile/${user?.uid}');
      final uploadTask = storageRef.putFile(imageFile);

      final taskSnapshot = await uploadTask.whenComplete(() => {});
      final imageUrl = await taskSnapshot.ref.getDownloadURL();

      user?.updatePhotoURL(imageUrl);
      emit(UploadUserImageSuccess(user));
    } catch (e) {
      emit(UploadUserImageFailure(e.toString()));
    }
  }
}
