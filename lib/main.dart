import 'package:book_app/constants.dart';
import 'package:book_app/core/cubit/app_cubit.dart';
import 'package:book_app/core/helper/cashe_helper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/cubit/app_state.dart';
import 'core/theme/custom_theme.dart';
import 'core/utils/app_router.dart';
import 'core/utils/service_locator.dart';
import 'features/home/data/repos/home_repo_impl.dart';
import 'features/home/presentation/view_model/featured_books_cubit/featured_books_cubit.dart';
import 'features/home/presentation/view_model/newest_books_cubit/newset_books_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  bool firstMode = CacheHelper.getData(key: "isLight")??false;
  await EasyLocalization.ensureInitialized();
  setupServiceLocator();
  runApp(
      EasyLocalization(
        path: 'assets/translations',
        supportedLocales: const [
          Locale(kEnglish,kUnitedState),
          Locale(kArabic,kEgypt)
        ],
        saveLocale: true,
        fallbackLocale: const Locale(kEnglish,kUnitedState),

        child: MyApp(
          firstMode: firstMode,
        ),
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, this.firstMode}) : super(key: key);

  final firstMode;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(
            getIt.get<HomeRepoImpl>(),
          )..fetchFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) => NewestBooksCubit(
            getIt.get<HomeRepoImpl>(),
          )..fetchNewestBooks(),
        ),
        BlocProvider(
          create: (context) => AppCubit()..getFirstMode(firstMode),
        )
      ],
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          return MaterialApp.router(
            supportedLocales: context.supportedLocales,
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              EasyLocalization.of(context)!.delegate,
            ],
            locale: context.locale,
            routerConfig: AppRouter.router,
            debugShowCheckedModeBanner: false,
            themeMode: AppCubit.get(context).themeMode
                ? ThemeMode.dark
                : ThemeMode.light,
            theme: CustomTheme.lightTheme(context),
            darkTheme: CustomTheme.darkTheme(context),
          );
          },
      ),
    );
  }
}
