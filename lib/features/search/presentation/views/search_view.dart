import '../../../../core/errors/faluer.dart';
import '../../../../core/utils/setup_get_it_services.dart';
import '../../data/repos/search_repo_implementation.dart';
import '../../domain/use_cases/fetch_history_searchd_use_case.dart';
import '../../domain/use_cases/fetch_searched_books_use_case.dart';
import '../manager/history_cubit/history_cubit.dart';
import '../manager/search_cubit/search_cubit.dart';
import 'widgets/search_view_body.dart';
import 'widgets/search_view_body_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: MultiBlocProvider(providers: [
        BlocProvider(
          create: (context) => SearchCubit(
            FetchSearchedBooksUseCase(
              searchViewRepo: getIt.get<SearchRepoImplementation>(),
            ),
          )..fetchSearchedBooks(''),
        ),
        BlocProvider(
          create: (context) => HistoryCubit(
            FetchHistoryUseCase(
              searchViewRepo: getIt.get<SearchRepoImplementation>(),
            ),
          )..fecthHistory(),
        ),
      ], child: const SearchViewBody()),
    );
  }
}
