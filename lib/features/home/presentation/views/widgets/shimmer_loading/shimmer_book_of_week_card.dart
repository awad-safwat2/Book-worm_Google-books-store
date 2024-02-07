import '../../../../../../core/utils/app_colors.dart';
import 'shimmer_book_of_week_card_body.dart';
import 'package:flutter/material.dart';

class ShimmerBookOfTheWeekCard extends StatelessWidget {
  const ShimmerBookOfTheWeekCard({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
          right: screenSize.width * 0.06,
          left: screenSize.width * 0.06,
          bottom: 10),
      child: Container(
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
                blurRadius: 10,
              )
            ]),
        child: ShimmerBookOfWeekCardBody(screenSize: screenSize),
      ),
    );
  }
}
