import '../../../../core/utils/app_strings.dart';
import '../../../../core/utils/functions.dart';
import '../../../favorites/presentation/manager/add_delet_favorite_cubit/add_delete_favorite_cubit.dart';
import '../../../favorites/presentation/widgets/favorites_listItem.dart';
import '../../../home/domain/entities/book_entity.dart';
import '../manager/add_delete_my_books_cubit/add_delete_my_books_cubit.dart';
import 'my_books_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MyBooksListItemsGDetector extends StatelessWidget {
  const MyBooksListItemsGDetector({
    super.key,
    required this.book,
  });

  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // BlocProvider.of<AddDeleteFavoriteCubit>(context)
        //     .checkIsFavoriteBook(book: book);
        // GoRouter.of(context).push(AppStrings.kBookDetailsView, extra: book);
        launchURL(book.bookWebViewUrl ?? '');
      },
      child: Dismissible(
        onDismissed: (DismissDirection direction) {
          if (direction == DismissDirection.endToStart) {}
        },
        key: Key(book.bookId!),
        child: MyBooksListItem(
          book: book,
        ),
      ),
    );
  }
}
