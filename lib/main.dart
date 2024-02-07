import 'core/utils/app_router.dart';
import 'core/utils/app_strings.dart';
import 'core/utils/bloc_observer/app_bloc_observer.dart';
import 'core/utils/app_colors.dart';
import 'core/utils/setup_get_it_services.dart';
import 'features/auth/domain/entities/user_entity/user_entity.dart';
import 'features/book_worm.dart';
import 'features/home/domain/entities/book_entity.dart';
import 'features/search/domain/entities/searched_book_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final bool showHome = prefs.getBool('showHome') ?? false;
  AppRouter.showHome = showHome;
  settingUpGetItServices();
  Bloc.observer = AppBlocObserver();
  await Hive.initFlutter();
  Hive.registerAdapter(BookEntityAdapter());
  Hive.registerAdapter(UserEntityAdapter());
  await Hive.openBox<BookEntity>(AppStrings.kFeatueredBox);
  await Hive.openBox<BookEntity>(AppStrings.kNewestBox);
  await Hive.openBox<BookEntity>(AppStrings.kHistoryBox);
  await Hive.openBox<UserEntity>(AppStrings.kHiUserDataBox);
  await Hive.openBox<bool>(AppStrings.kHiIsLogedBeforeBox);
  await Hive.openBox<String>(AppStrings.kHiFavoritesBox);

  runApp(const BookWorm());
}
