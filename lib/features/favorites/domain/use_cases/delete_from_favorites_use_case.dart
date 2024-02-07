import '../../../../core/errors/faluer.dart';
import '../../../../core/use_cases/use_case.dart';
import '../favorites_repos/favorites_repos.dart';
import 'package:dartz/dartz.dart';

class DeleteFromFavoritesUseCase extends UseCase<void, String> {
  final FavoritesRepos favoritesReposImple;

  DeleteFromFavoritesUseCase({required this.favoritesReposImple});

  @override
  Future<Either<ServerFalure, void>> call([String? bookId]) {
    return favoritesReposImple.deleteFromFavoritesBooks(bookId: bookId!);
  }
}
