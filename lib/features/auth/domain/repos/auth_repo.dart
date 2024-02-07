import '../../../../core/errors/faluer.dart';
import '../entities/user_entity/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<ServerFalure, UserEntity>> singInWithGoogle(int isFirstTime);
  Future<Either<ServerFalure, void>> signOut();
  Future<bool> canAccessToken();
}
