import '../../../../core/errors/faluer.dart';
import '../../../../core/use_cases/use_case.dart';
import '../../data/repo_imple/auth_repo_imple.dart';
import '../entities/user_entity/user_entity.dart';
import 'package:dartz/dartz.dart';

class SignInGoogleUseCase extends UseCase<UserEntity, NoParam> {
  final AuthRepoImpel authRepoImpel;

  SignInGoogleUseCase({required this.authRepoImpel});

  @override
  Future<Either<ServerFalure, UserEntity>> call([NoParam? param]) async {
    return await authRepoImpel.singInWithGoogle(0);
  }
}
