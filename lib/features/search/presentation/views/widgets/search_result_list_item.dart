import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/functions.dart';
import '../../../../home/domain/entities/book_entity.dart';
import '../../../domain/entities/searched_book_entity.dart';
import 'search_result_list_item_body.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchResultListItem extends StatelessWidget {
  const SearchResultListItem({
    super.key,
    required this.book,
  });
  final BookEntity book;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: AppColors.gitBritness(context) == Brightness.dark
              ? AppColors.secondryColordark
              : AppColors.secondryColorLight,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.gitBritness(context) == Brightness.dark
                  ? AppColors.shadowColordark
                  : AppColors.shadowColorLight,
              blurRadius: 3,
            )
          ]),
      height: MediaQuery.of(context).size.height * .13,
      width: MediaQuery.of(context).size.width * .90,
      child: GestureDetector(
        onTap: () {
          saveBooksLocaly<BookEntity>(
              extractedBooksList: {book}, boxName: AppStrings.kHistoryBox);
          GoRouter.of(context)
              .push(AppStrings.kSearchedBookDetailsView, extra: book);
        },
        child: SearchResultListItemBody(book: book),
      ),
    );
  }
}
