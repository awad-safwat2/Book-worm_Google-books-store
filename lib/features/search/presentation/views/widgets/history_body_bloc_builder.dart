import '../../../../../core/utils/font_styels.dart';
import '../../manager/history_cubit/history_cubit.dart';
import 'search_result_list_section.dart';
import 'shimmer_searched_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HistoryBodyBlocBuilder extends StatelessWidget {
  const HistoryBodyBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HistoryCubit, HistoryState>(
      builder: (context, state) {
        if (state is HistorySucsess) {
          return SearchResultListSection(books: state.books);
        } else if (state is HistoryLoading) {
          return Expanded(
            child: ListView.builder(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              itemCount: 10,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => const ShimmerSearchedListItem(),
            ),
          );
        } else {
          return const Center(
            child: Text(
              'No History',
              style: Styels.textStyle18,
            ),
          );
        }
      },
    );
  }
}
