part of 'upload_user_image_cubit.dart';

sealed class UploadUserImageState extends Equatable {
  const UploadUserImageState();

  @override
  List<Object> get props => [];
}

final class UploadUserImageInitial extends UploadUserImageState {}

final class UploadUserImageLoading extends UploadUserImageState {}

final class UploadUserImageSuccess extends UploadUserImageState {
  final User? user;

  const UploadUserImageSuccess(this.user);
}

final class UploadUserImageFailure extends UploadUserImageState {
  final String message;

  const UploadUserImageFailure(this.message);
}
