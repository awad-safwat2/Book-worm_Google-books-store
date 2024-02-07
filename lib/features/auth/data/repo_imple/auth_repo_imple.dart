import '../../../../core/errors/faluer.dart';
import '../../../../core/utils/app_controllers.dart';
import '../../../../core/utils/functions.dart';
import '../../domain/entities/user_entity/user_entity.dart';
import '../../domain/repos/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepoImpel extends AuthRepo {
  @override
  Future<Either<ServerFalure, void>> signOut() async {
    try {
      await AppControllers.googleSignInController.signOut();
      return right('');
    } catch (e) {
      return left(ServerFalure(massege: e.toString()));
    }
  }

  @override
  Future<Either<ServerFalure, UserEntity>> singInWithGoogle(
      int isFirstTime) async {
    try {
      GoogleSignInAccount? account =
          await AppControllers.googleSignInController.signIn().catchError((er) {
        print(er.toString());
        return left(ServerFalure(massege: er.toString()));
      });
      GoogleSignInAuthentication? accountAuth =
          await account?.authentication.catchError((er) {
        print(er.toString());

        return left(ServerFalure(massege: er.toString()));
      });

      UserEntity userData = UserEntity(
        userName: account!.displayName!,
        email: account.email,
        userImageUrl: account.photoUrl!,
        userAccessToken: accountAuth!.accessToken!,
      );
      saveUserDataLocaly(userData: userData);
      return right(userData);
    } catch (error) {
      return left(
        ServerFalure(
          massege: error.toString(),
        ),
      );
    }
  }

  @override
  Future<bool> canAccessToken() async {
    String? accessToken = getAccessToken();

    var canAccess = await AppControllers.googleSignInController.canAccessScopes(
        ["https://www.googleapis.com/auth/books"],
        accessToken: accessToken);

    return canAccess;
  }
}
