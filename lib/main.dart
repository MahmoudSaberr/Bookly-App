import 'package:book_app/core/cubit/app_cubit.dart';
import 'package:book_app/core/helper/cashe_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'core/cubit/app_state.dart';
import 'core/theme/custom_theme.dart';
import 'core/utils/app_local.dart';
import 'core/utils/app_router.dart';
import 'core/utils/service_locator.dart';
import 'features/home/data/repos/home_repo_impl.dart';
import 'features/home/presentation/view_model/featured_books_cubit/featured_books_cubit.dart';
import 'features/home/presentation/view_model/newest_books_cubit/newset_books_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  bool firstMode = CacheHelper.getData(key: "isLight")??false;
  setupServiceLocator();

  runApp(MyApp(firstMode: firstMode,),
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
          create: (context) => AppCubit()..getFirstMode(firstMode)..getSavedLanguage(),
        )
      ],
      child: BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          if (state is ChangeLocalState) {
            return MaterialApp.router (
              locale: state.locale,
              supportedLocales: const [
                Locale('en', ""),
                Locale("ar", ""),
              ],
              localizationsDelegates: const [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              localeResolutionCallback: (currentLocal, supportedLocales) {
                for (var locale in supportedLocales) {
                  if (currentLocal != null &&
                      currentLocal.languageCode == locale.languageCode) {
                    return currentLocal;
                  }
                }
                return supportedLocales.first;
              },
              routerConfig: AppRouter.router,
              debugShowCheckedModeBanner: false,
              themeMode: AppCubit.get(context).themeMode
                  ? ThemeMode.dark
                  : ThemeMode.light,
              theme: CustomTheme.lightTheme(context),
              darkTheme: CustomTheme.darkTheme(context),
            );
          }

/*
          return MaterialApp.router(
            supportedLocales: const [
              Locale('en', ""),
              Locale("ar", ""),
            ],
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            localeResolutionCallback: (currentLocal, supportedLocales) {
              for (var locale in supportedLocales) {
                if (currentLocal != null &&
                    currentLocal.languageCode == locale.languageCode) {
                  return currentLocal;
                }
              }
              return supportedLocales.first;
            },
            routerConfig: AppRouter.router,
            debugShowCheckedModeBanner: false,
            themeMode: AppCubit.get(context).themeMode
                ? ThemeMode.dark
                : ThemeMode.light,
            theme: CustomTheme.lightTheme(context),
            darkTheme: CustomTheme.darkTheme(context),
          );
*/
          //Lag in Drawer
          return const SizedBox();
        },
      ),
    );
  }
}
