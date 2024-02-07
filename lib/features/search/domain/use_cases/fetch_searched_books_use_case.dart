import '../../../../core/errors/faluer.dart';
import '../../../../core/use_cases/use_case.dart';
import '../../../home/domain/entities/book_entity.dart';
import '../repos/search_view_repo.dart';
import 'package:dartz/dartz.dart';

class FetchSearchedBooksUseCase
    extends UseCase<List<BookEntity>, Map<String, dynamic>> {
  final SearchViewRepo searchViewRepo;

  FetchSearchedBooksUseCase({required this.searchViewRepo});
  @override
  Future<Either<ServerFalure, List<BookEntity>>> call(
      [Map<String, dynamic>? paramsMap]) async {
    return await searchViewRepo.fetchSearchedBooks(
      paramsMap?['searchKey'],
      pageNumber: paramsMap?['pageNumber'],
    );
  }
}
