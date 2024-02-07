import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/app_strings.dart';
import '../../../../../core/utils/font_styels.dart';
import '../../../../../core/utils/functions.dart';
import '../../../domain/entities/book_entity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LearnMoreButton extends StatelessWidget {
  const LearnMoreButton({
    super.key,
    required this.book,
  });
  final dynamic book;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 30,
      color: Colors.transparent,
      elevation: 0,
      onPressed: () {
        GoRouter.of(context).push(AppStrings.kBookDetailsView, extra: book);
      },
      child: const Text(
        'Learn More',
        style: Styels.textStyle10,
      ),
    );
  }
}
