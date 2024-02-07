import '../../../../core/errors/faluer.dart';
import '../../../../core/use_cases/use_case.dart';
import '../favorites_repos/favorites_repos.dart';
import 'package:dartz/dartz.dart';

class AddToFavoritesUseCase extends UseCase<void, String> {
  final FavoritesRepos favoritesReposImple;

  AddToFavoritesUseCase({required this.favoritesReposImple});

  @override
  Future<Either<ServerFalure, void>> call([String? bookId]) async {
    return favoritesReposImple.addToFavoritesBooks(bookId: bookId!);
  }
}
