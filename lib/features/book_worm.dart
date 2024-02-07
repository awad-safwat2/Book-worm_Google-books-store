import '../core/utils/app_router.dart';
import '../core/utils/setup_get_it_services.dart';
import 'auth/data/repo_imple/auth_repo_imple.dart';
import 'auth/domain/use_case/sign_in_google_use_case.dart';
import 'auth/presentation/manager/sign_in-cubit/sign_in_cubit.dart';
import 'favorites/data/favorites_repos_imple/favorites_repos_imple.dart';
import 'favorites/domain/use_cases/add_favorites_use_case.dart';
import 'favorites/domain/use_cases/delete_from_favorites_use_case.dart';
import 'favorites/domain/use_cases/get_favorites_use_case.dart';
import 'favorites/presentation/manager/add_delet_favorite_cubit/add_delete_favorite_cubit.dart';
import 'favorites/presentation/manager/favorites_cubit/favorites_cubit.dart';
import 'home/data/repos/home_repo_implementation.dart';
import 'home/domain/use_cases/fetch_featchered_books_usecase.dart';
import 'home/domain/use_cases/fetch_newest_books_usecase.dart';
import 'home/presentation/manager/featured_book_cubit/featured_books_cubit.dart';
import 'home/presentation/manager/newest_books_cubit/newest_books_cubit.dart';
import 'my_books/data/repos_imple/my_books_repos_imple.dart';
import 'my_books/domain/my_books_use_cases/add_to_my_books_use_case.dart';
import 'my_books/domain/my_books_use_cases/delete_from_my_books_use_case.dart';
import 'my_books/presentation/manager/add_delete_my_books_cubit/add_delete_my_books_cubit.dart';
import 'user_profile/presentation/manager/cubit/user_profile_cubit.dart';
import 'user_profile/presentation/view/user_profile_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookWorm extends StatelessWidget {
  const BookWorm({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(
            FetchFeatueredBooksUseCase(
              homeRepo: getIt.get<HomeViewRepoImple>(),
            ),
          )..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) => SignInCubit(
              repoImpel: getIt.get<AuthRepoImpel>(),
              signInGoogleUseCase: SignInGoogleUseCase(
                authRepoImpel: getIt.get<AuthRepoImpel>(),
              )),
        ),
        BlocProvider(
          create: (context) => FavoritesCubit(
            getFavoritesUseCase: GetFavoritesUseCase(
              favoritesReposImple: getIt.get<FavoritesReposImple>(),
            ),
          ),
        ),
        BlocProvider(
            create: (context) => AddDeleteFavoriteCubit(
                  addToFavoritesUseCase: AddToFavoritesUseCase(
                    favoritesReposImple: getIt.get<FavoritesReposImple>(),
                  ),
                  deleteFromFavoritesUseCase: DeleteFromFavoritesUseCase(
                    favoritesReposImple: getIt.get<FavoritesReposImple>(),
                  ),
                )),
        BlocProvider(
            create: (context) => AddDeleteMyBooksCubit(
                  addToMyBooksUseCase: AddToMyBooksUseCase(
                    myBooksReposImple: getIt.get<MyBooksReposImple>(),
                  ),
                  deleteFromMyBooksUseCase: DeleteFromMyBooksUseCase(
                    myBooksReposImple: getIt.get<MyBooksReposImple>(),
                  ),
                )),
        BlocProvider(
          create: (context) => NewestBooksCubit(
            FetchNewestBooksUseCase(
              homeRepo: getIt.get<HomeViewRepoImple>(),
            ),
          )..fetchNewestBooks(),
        ),
        BlocProvider(create: (context) => UserProfileCubit()),
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'HKGrotesk',
          appBarTheme: const AppBarTheme(
            backgroundColor: Colors.transparent,
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontFamily: 'HKGrotesk',
            ),
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
          ),
          colorScheme: ThemeData().colorScheme.copyWith(
                primary: Colors.black,
              ),
        ),
        darkTheme: ThemeData.dark().copyWith(
          textTheme: Typography().white.apply(fontFamily: 'HKGrotesk'),
          appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(
              fontFamily: 'HKGrotesk',
            ),
          ),
          colorScheme: ThemeData().colorScheme.copyWith(
                primary: Colors.white,
                background: Colors.transparent,
              ),
        ),
        themeMode: ThemeMode.system,
      ),
    );
  }
}
