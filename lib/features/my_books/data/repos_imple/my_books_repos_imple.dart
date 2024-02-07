import '../../../../core/errors/faluer.dart';
import '../../../home/domain/entities/book_entity.dart';
import '../data_sources/my_books_remote_data_source.dart';
import '../../domain/repos/my_books_repos.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class MyBooksReposImple extends MyBooksRepos {
  final MyBooksRemoteDataSourceImple myBooksRemoteDataSourceImple;

  MyBooksReposImple({required this.myBooksRemoteDataSourceImple});
  @override
  Future<Either<ServerFalure, void>> addToMyBooks(
      {required String bookId}) async {
    try {
      await myBooksRemoteDataSourceImple.addToMyBooks(bookId: bookId);
      return right(null);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFalure.fromDioError(e));
      }
      return left(ServerFalure(massege: e.toString()));
    }
  }

  @override
  Future<Either<ServerFalure, void>> deleteFromMyBooks(
      {required String bookId}) async {
    try {
      await myBooksRemoteDataSourceImple.deleteFromMyBooks(bookId: bookId);
      return right(null);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFalure.fromDioError(e));
      }
      return left(ServerFalure(massege: e.toString()));
    }
  }

  @override
  Future<Either<ServerFalure, List<BookEntity>>> getMyBooks(
      {required int pageNumber}) async {
    try {
      var books =
          await myBooksRemoteDataSourceImple.getMyBooks(pageNumber: pageNumber);
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFalure.fromDioError(e));
      }
      return left(ServerFalure(massege: e.toString()));
    }
  }
}
