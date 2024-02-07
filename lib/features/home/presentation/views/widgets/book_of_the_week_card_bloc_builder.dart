import '../../manager/featured_book_cubit/featured_books_cubit.dart';
import '../../manager/newest_books_cubit/newest_books_cubit.dart';
import 'book_of_week_card.dart';
import 'carousel_slider.dart';
import 'shimmer_loading/shimmer_book_of_week_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_content_placeholder/flutter_content_placeholder.dart';

class BookOfTheWeekCardBlocBuilder extends StatelessWidget {
  const BookOfTheWeekCardBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.sizeOf(context);
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksFalure) {
          return Center(
            child: Text(state.massage),
          );
        } else if (state is NewestBooksSucsess) {
          return CarouselSliderList(books: state.books, size: screenSize);
        } else {
          return const ShimmerBookOfTheWeekCard();
        }
      },
    );
  }
}
