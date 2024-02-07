import '../../../../core/errors/faluer.dart';
import '../../../../core/use_cases/use_case.dart';
import '../entities/book_entity.dart';
import '../repos/home_view_repo.dart';
import 'package:dartz/dartz.dart';

class FetchFeatueredBooksUseCase extends UseCase<List<BookEntity>, int> {
  final HomeViewRepo homeRepo;

  FetchFeatueredBooksUseCase({required this.homeRepo});

  @override
  Future<Either<ServerFalure, List<BookEntity>>> call([int? pageNumber]) async {
    return await homeRepo.fetchFeaturedBooks(pageNumber ?? 0);
  }
}
