import 'package:bloc/bloc.dart';
import '../../../../../core/errors/faluer.dart';
import '../../../../../core/utils/functions.dart';
import '../../../../home/domain/entities/book_entity.dart';
import '../../../domain/use_cases/fetch_searched_books_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit(this.fetchSearchedBooksUseCase) : super(SearchInitial());

  final FetchSearchedBooksUseCase fetchSearchedBooksUseCase;
  int pageNumber = 1;
  List<BookEntity> fullBooks = [];
  ScrollController scrollController = ScrollController();
  TextEditingController textEditingController = TextEditingController();
  bool isLoading = false;

  fetchSearchedBooks(String? searchKey, {int pageNumber = 0}) async {
    if (pageNumber == 0) {
      emit(SearchLoading());
    } else {
      isLoading = true;
      emit(SearchPaginationLoading());
    }
    Either<ServerFalure, List<BookEntity>> books =
        await fetchSearchedBooksUseCase
            .call({'searchKey': searchKey, 'pageNumber': pageNumber});
    books.fold((faluer) {
      if (pageNumber == 0) {
        emit(SearchFaluer(massage: faluer.massege));
      } else {
        emit(SearchPaginationFaluer(massage: faluer.massege));
      }
    }, (booksList) {
      fullBooks.addAll(booksList);
      isLoading = false;
      emit(SearchSucces(books: booksList));
    });
  }

  searchScrollControllerSetUp(
    BuildContext context,
  ) {
    setupScrollController(context, scrollController, () {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          if (!isLoading) {
            fetchSearchedBooks(textEditingController.value.text.toString(),
                pageNumber: pageNumber);
          }
        }
      }
    });
  }
}
