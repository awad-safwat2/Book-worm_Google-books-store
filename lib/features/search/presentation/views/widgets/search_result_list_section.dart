import '../../../../home/domain/entities/book_entity.dart';
import '../../manager/search_cubit/search_cubit.dart';
import 'search_result_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultListSection extends StatelessWidget {
  const SearchResultListSection({
    super.key,
    required this.books,
  });

  final List<BookEntity> books;

  @override
  Widget build(BuildContext context) {
    var searchCubit = BlocProvider.of<SearchCubit>(context);

    return Expanded(
      child: CustomScrollView(
        controller: searchCubit.scrollController,
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: books.length,
              (context, index) => Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                child: SearchResultListItem(book: books[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
