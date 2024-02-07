import '../../../../core/utils/assets/assets.dart';
import '../../../../core/utils/app_colors.dart';
import 'widgets/home_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: HomeViewBody(),
    );
  }
}
