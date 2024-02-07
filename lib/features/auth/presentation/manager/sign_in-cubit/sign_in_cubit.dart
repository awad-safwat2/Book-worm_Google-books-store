import 'package:bloc/bloc.dart';
import '../../../../../core/errors/faluer.dart';

import '../../../../../core/utils/functions.dart';
import '../../../data/repo_imple/auth_repo_imple.dart';
import '../../../domain/entities/user_entity/user_entity.dart';
import '../../../domain/use_case/sign_in_google_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:meta/meta.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  final SignInGoogleUseCase signInGoogleUseCase;
  final AuthRepoImpel repoImpel;
  SignInCubit({required this.repoImpel, required this.signInGoogleUseCase})
      : super(SignInInitial());

  Future<void> signInGoogle() async {
    emit(SignInLoading());
    Either<ServerFalure, UserEntity> userData =
        await signInGoogleUseCase.call();

    userData.fold((faluer) {
      print(faluer.massege);
      showToast('Cannot Sign in !');
      emit(SignInFaluer(massage: faluer.massege));
    }, (userData) {
      showToast('Signed in Success');
      emit(SignInSuccess(userData: userData));
    });
  }

  Future<bool> canAccessToke() async {
    bool canAccessToken = await repoImpel.canAccessToken();
    return canAccessToken;
  }

  Future<void> signOut() async {
    Either<ServerFalure, void> signOut = await repoImpel.signOut();

    signOut.fold((faluer) {
      showToast('Cannot Sign Out !');
    }, (signedOut) {
      showToast('Signed Out !');
    });
  }
}
