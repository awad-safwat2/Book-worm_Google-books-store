import 'about_the_book_section.dart';
import 'price_button_section.dart';
import 'may_like_section.dart';
import 'selected_with_author_section.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.book});
  final dynamic book;
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BookWithAuthorSection(screenSize: screenSize, book: book),
          SizedBox(
            height: screenSize.height * 0.10,
          ),
          Expanded(
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: EdgeInsets.zero,
              child: Column(
                children: [
                  AbouTheBookSection(
                    screenSize: screenSize,
                    book: book,
                  ),
                  PriceButtonSection(
                    screenSize: screenSize,
                    book: book,
                  ),
                  MayAlsoLikeSection(
                    screenSize: screenSize,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
