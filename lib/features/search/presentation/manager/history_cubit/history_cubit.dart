import 'package:bloc/bloc.dart';
import '../../../../../core/errors/faluer.dart';
import '../../../../home/domain/entities/book_entity.dart';
import '../../../domain/use_cases/fetch_history_searchd_use_case.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

part 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  HistoryCubit(this.fetchHistoryUseCase) : super(HistoryInitial());

  final FetchHistoryUseCase fetchHistoryUseCase;

  fecthHistory() async {
    emit(HistoryLoading());
    Either<ServerFalure, List<BookEntity>> books =
        await fetchHistoryUseCase.call();

    books.fold((Faluer) {
      emit(HistoryFalure());
    }, (books) {
      if (books.isEmpty) {
        emit(HistoryFalure());
      } else {
        emit(HistorySucsess(books: books));
      }
    });
  }
}
