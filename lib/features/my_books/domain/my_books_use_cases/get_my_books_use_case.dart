import 'package:dartz/dartz.dart';

import '../../../../core/errors/faluer.dart';
import '../../../../core/use_cases/use_case.dart';
import '../../../home/domain/entities/book_entity.dart';
import '../../data/repos_imple/my_books_repos_imple.dart';

class GetMyBooksUseCase extends UseCase<List<BookEntity>, int> {
  final MyBooksReposImple myBooksReposImple;

  GetMyBooksUseCase({required this.myBooksReposImple});
  @override
  Future<Either<ServerFalure, List<BookEntity>>> call([int? pageNumber]) async {
    return await myBooksReposImple.getMyBooks(pageNumber: pageNumber ?? 0);
  }
}
