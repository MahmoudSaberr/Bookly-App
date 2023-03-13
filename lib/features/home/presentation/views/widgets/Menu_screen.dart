import 'package:book_app/core/cubit/app_cubit.dart';
import 'package:book_app/core/cubit/app_state.dart';
import 'package:book_app/core/utils/assets.dart';
import 'package:book_app/core/utils/extensions_methods.dart';
import 'package:book_app/core/widgets/build_row_item.dart';
import 'package:book_app/core/widgets/custom_divider.dart';
import 'package:book_app/core/widgets/custom_option_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants.dart';
import '../../../../../core/widgets/custom_theme_column.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        AppCubit cubit = AppCubit.get(context);

        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.04,
                ),
                Center(
                  child: Image.asset(
                    AssetsData.logo,
                    height: 40,
                    color: cubit.primaryColor,
                  ),
                ),
                const SizedBox(
                  height: 70,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: InkWell(
                    splashColor: cubit.textColor.withOpacity(0.0),
                    highlightColor: cubit.textColor.withOpacity(0.0),
                    onTap: () => cubit.changeLanguageContainerStatus(),
                    child: CustomRowItem(
                      iconData: Icons.language,
                      text: "language".translate(context: context),
                      arrowStatus: cubit.isLanguageContainerOpen,
                    ),
                  ),
                ),
                if (cubit.isLanguageContainerOpen) ...[
                  const SizedBox(height: 10),
                  const CustomDivider(),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: CustomOptionRow(
                        title: currentLocaleApp.languageCode == "en"
                            ? "arabicLanguage".translate(context: context)
                            : "englishLanguage".translate(context: context),
                        icon: Icons.translate_outlined,
                        isActive: currentLocaleApp.languageCode == "en"
                            ? false
                            : true,
                        onChange: (value) {
                          if (value == true) {
                            cubit.changeAppLanguage(locale: const Locale('ar'));
                          } else if (value == false) {
                            cubit.changeAppLanguage(locale: const Locale('en'));
                          }
                        }),
                  ),
                ],
                Divider(
                  color: cubit.primaryColor,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: InkWell(
                    splashColor: cubit.textColor.withOpacity(0.0),
                    highlightColor: cubit.textColor.withOpacity(0.0),
                    onTap: () => cubit.changeThemeContainerStatus(),
                    child: CustomRowItem(
                      iconData: Icons.brightness_4,
                      text: "theme".translate(context: context),
                      arrowStatus: cubit.isThemeContainerOpen,
                    ),
                  ),
                ),
                if (cubit.isThemeContainerOpen) ...[
                  const SizedBox(height: 20),
                  const CustomDivider(),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: CustomOptionRow(
                        title: Theme.of(context).brightness == Brightness.dark
                            ? "lightMode".translate(context: context)
                            : "darkMode".translate(context: context),
                        icon: Icons.dark_mode,
                        isActive: cubit.themeMode,
                        onChange: (value) {
                          cubit.changeTheme();
                        }),
                  ),
                  const SizedBox(height: 15),
                  const CustomThemeOptionColumn(),
                ],
              ],
            ),
          ),
        );
      },
    );
  }
}
