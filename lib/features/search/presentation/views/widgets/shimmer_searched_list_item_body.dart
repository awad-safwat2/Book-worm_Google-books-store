import '../../../../../core/utils/app_router.dart';
import '../../../../../core/utils/font_styels.dart';
import '../../../../home/domain/entities/book_entity.dart';
import '../../../../home/presentation/views/widgets/book_image.dart';
import '../../../../home/presentation/views/widgets/read_now_button.dart';
import '../../../../home/presentation/views/widgets/learn_more_button.dart';
import '../../../../home/presentation/views/widgets/shimmer_loading/shimmer_button.dart';
import '../../../../home/presentation/views/widgets/shimmer_loading/shimmer_image.dart';
import '../../../../home/presentation/views/widgets/shimmer_loading/shimmer_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ShimmerSearchedListItemBody extends StatelessWidget {
  const ShimmerSearchedListItemBody({
    super.key,
    required this.screenSize,
  });

  final Size screenSize;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          child: ShimmerImage(
            screenSize: screenSize,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShimmerText(screenSize: screenSize),
            const SizedBox(
              height: 3,
            ),
            ShimmerText(screenSize: screenSize),
            const SizedBox(
              height: 5,
            ),
            ShimmerText(screenSize: screenSize),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(
            left: 40,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShimmerButton(screenSize: screenSize),
              ShimmerButton(screenSize: screenSize),
            ],
          ),
        ),
      ],
    );
  }
}
