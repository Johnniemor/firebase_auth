import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  ResetPasswordCubit() : super(ResetPasswordInitial());

  Future<void> sendOTP(String email) async {
    try {
      emit(ResetPasswordLoading());
      await _firebaseAuth.sendPasswordResetEmail(email: email);

      emit(OTPSentState());
    } catch (e) {
      emit(const PasswordResetFailure('Failed to send OTP. Please try again.'));
    }
  }

  Future<void> verifyOTP(String otp) async {
    try {
      emit(ResetPasswordLoading());
      await _firebaseAuth.verifyPasswordResetCode(otp);
      emit(OTPVerifiedState());
    } catch (e) {
      emit(const PasswordResetFailure('Invalid OTP. Please try again.'));
    }
  }

  Future<void> resetPassword(String email, String newPassword) async {
    try {
      emit(ResetPasswordLoading());
      await _firebaseAuth.confirmPasswordReset(
          code: email, newPassword: newPassword);
      emit(PasswordResetState());
    } catch (e) {
      emit(const PasswordResetFailure(
          'Failed to reset password. Please try again.'));
    }
  }
}
