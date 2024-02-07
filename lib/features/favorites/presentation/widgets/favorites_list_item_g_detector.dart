import '../../../../core/utils/app_strings.dart';
import '../manager/add_delet_favorite_cubit/add_delete_favorite_cubit.dart';
import 'favorites_listItem.dart';
import '../../../home/domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class FavoritesListItemsGDetector extends StatelessWidget {
  const FavoritesListItemsGDetector({
    super.key,
    required this.book,
  });

  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<AddDeleteFavoriteCubit>(context)
            .checkIsFavoriteBook(book: book);
        GoRouter.of(context).push(AppStrings.kBookDetailsView, extra: book);
      },
      child: Dismissible(
        onDismissed: (DismissDirection direction) {
          if (direction == DismissDirection.startToEnd) {
            BlocProvider.of<AddDeleteFavoriteCubit>(context)
                .deleteFromFavorites(bookId: book.bookId!);
          }
        },
        key: Key(book.bookId!),
        child: FavoritesListItem(
          book: book,
        ),
      ),
    );
  }
}
