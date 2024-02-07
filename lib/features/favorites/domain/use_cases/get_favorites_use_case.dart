import '../../../../core/errors/faluer.dart';
import '../../../../core/use_cases/use_case.dart';
import '../../data/favorites_repos_imple/favorites_repos_imple.dart';
import '../favorites_repos/favorites_repos.dart';
import '../../../home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';

class GetFavoritesUseCase extends UseCase<List<BookEntity>, int> {
  final FavoritesReposImple favoritesReposImple;

  GetFavoritesUseCase({required this.favoritesReposImple});
  @override
  Future<Either<ServerFalure, List<BookEntity>>> call([int? pageNumber]) async {
    // TODO: implement call
    return favoritesReposImple.getFavoritesBooks(pageNumber: pageNumber ?? 0);
  }
}
