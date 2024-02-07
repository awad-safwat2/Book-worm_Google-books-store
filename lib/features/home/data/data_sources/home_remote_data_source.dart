import '../../../../core/utils/api_service.dart';
import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/functions.dart';
import '../../domain/entities/book_entity.dart';

abstract class HomeRemoteDataSource {
  Future<List<BookEntity>> fetchFeatueredBooks();
  Future<List<BookEntity>> fetchNewestBooks();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiService apiService;

  HomeRemoteDataSourceImpl({required this.apiService});
  @override
  Future<List<BookEntity>> fetchFeatueredBooks({int pageNumber = 0}) async {
    var response = await apiService.get(
        endPoint:
            'volumes?q=programming&orderBy=relevance&startIndex=${pageNumber * 10}');

    List<BookEntity> extractedBooksList = extractingMapDataToList(response);

    saveBooksLocaly<BookEntity>(
      extractedBooksList: extractedBooksList.toSet(),
      boxName: AppStrings.kFeatueredBox,
    );

    return extractedBooksList;
  }

  @override
  Future<List<BookEntity>> fetchNewestBooks({int pageNumber = 0}) async {
    var response = await apiService.get(
        endPoint:
            'volumes?q=Success النجاح&orderBy=relevance&startIndex=${pageNumber * 10}');

    List<BookEntity> extractedBooksList = extractingMapDataToList(response);

    saveBooksLocaly(
      extractedBooksList: extractedBooksList.toSet(),
      boxName: AppStrings.kNewestBox,
    );
    return extractedBooksList;
  }
}
