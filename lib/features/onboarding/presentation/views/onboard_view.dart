import 'onboarding_cubit/on_boarding_cubit.dart';
import 'widgets/onboard_page_bottomsheet_body.dart';
import 'widgets/onboard_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardView extends StatelessWidget {
  const OnBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnBoardingCubit(),
      child: const Scaffold(
        body: OnBoardViewBody(),
        bottomSheet: OnBoardPageBottomSheet(),
      ),
    );
  }
}
