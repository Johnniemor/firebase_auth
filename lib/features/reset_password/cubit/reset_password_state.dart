part of 'reset_password_cubit.dart';

sealed class ResetPasswordState extends Equatable {
  const ResetPasswordState();

  @override
  List<Object> get props => [];
}

final class ResetPasswordInitial extends ResetPasswordState {}

final class ResetPasswordLoading extends ResetPasswordState {}

final class OTPSentState extends ResetPasswordState {}

final class OTPVerifiedState extends ResetPasswordState {}

final class PasswordResetState extends ResetPasswordState {}

final class PasswordResetFailure extends ResetPasswordState {
  final String errorMessage;

  const PasswordResetFailure(this.errorMessage);
}
