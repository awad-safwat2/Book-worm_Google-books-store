import '../../../../core/errors/faluer.dart';
import '../../../../core/utils/functions.dart';
import '../data_sources/favorites_remote_data_source.dart';
import '../../domain/favorites_repos/favorites_repos.dart';
import '../../../home/domain/entities/book_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesReposImple extends FavoritesRepos {
  final FavoritesRometeDataSourceImple favoritesRemDSourceImple;

  FavoritesReposImple({required this.favoritesRemDSourceImple});
  @override
  Future<Either<ServerFalure, void>> addToFavoritesBooks(
      {required String bookId}) async {
    try {
      await favoritesRemDSourceImple.addToFavoritesBooks(bookId: bookId);
      return right(null);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFalure.fromDioError(e));
      }
      return left(ServerFalure(massege: e.toString()));
    }
  }

  @override
  Future<Either<ServerFalure, void>> deleteFromFavoritesBooks(
      {required String bookId}) async {
    try {
      await favoritesRemDSourceImple.deleteFromFavoritesBooks(bookId: bookId);
      return right(null);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFalure.fromDioError(e));
      }
      return left(ServerFalure(massege: e.toString()));
    }
  }

  @override
  Future<Either<ServerFalure, List<BookEntity>>> getFavoritesBooks(
      {required int pageNumber}) async {
    try {
      var books = await favoritesRemDSourceImple.getFavoritesBooks(
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
