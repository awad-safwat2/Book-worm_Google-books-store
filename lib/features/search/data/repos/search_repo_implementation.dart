import '../../../../core/errors/faluer.dart';
import '../../../home/domain/entities/book_entity.dart';
import '../data_sources/search_local_data_source.dart';
import '../data_sources/search_remote_data_source.dart';
import '../../domain/repos/search_view_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class SearchRepoImplementation extends SearchViewRepo {
  final SearchRemoteDataSource searchRemoteDataSource;
  final SearchLocalDataSource searchLocalDataSource;
  // final String searchKey;

  SearchRepoImplementation(
      {required this.searchLocalDataSource,
      required this.searchRemoteDataSource});

  @override
  Future<Either<ServerFalure, List<BookEntity>>>
      fetchHistorySearchedBooks() async {
    List<BookEntity> books;
    try {
      books = searchLocalDataSource.fetchHistoryData();

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFalure.fromDioError(e));
      }
      return left(ServerFalure(massege: e.toString()));
    }
  }

  @override
  Future<Either<ServerFalure, List<BookEntity>>> fetchSearchedBooks(
      String? searchKey,
      {int pageNumber = 0}) async {
    List<BookEntity> books;
    try {
      books = await searchRemoteDataSource.fetchSearchedBooks(searchKey ?? '',
          pageNumber: pageNumber);
      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFalure.fromDioError(e));
      }
      return left(ServerFalure(massege: e.toString()));
    }
  }
}
