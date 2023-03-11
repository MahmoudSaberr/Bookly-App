import 'package:book_app/core/cubit/app_cubit.dart';
import 'package:book_app/core/cubit/app_state.dart';
import 'package:book_app/core/utils/assets.dart';
import 'package:book_app/core/widgets/build_row_item.dart';
import 'package:book_app/core/widgets/custom_divider.dart';
import 'package:book_app/core/widgets/custom_option_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_language_column.dart';
import '../../../../../core/widgets/custom_theme_column.dart';

class MenuScreen extends StatelessWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
  builder: (context, state) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height:  MediaQuery.of(context).size.height * 0.04,
            ),
            Center(
              child: Image.asset(
                AssetsData.logo,
                height: 40,
                color: AppCubit
                    .get(context)
                    .primaryColor,
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: InkWell(
                splashColor: AppCubit.get(context).textColor.withOpacity(0.0),
                highlightColor: AppCubit.get(context).textColor.withOpacity(0.0),
                onTap: () => AppCubit.get(context).changeLanguageContainerStatus(),
                child: CustomRowItem(
                  iconData: Icons.language,
                  text: 'Language',
                  arrowStatus: AppCubit.get(context).isLanguageContainerOpen,
                ),
              ),
            ),
            if (AppCubit.get(context).isLanguageContainerOpen) ...[
              const SizedBox(height: 10),
              CustomDivider(),
              const SizedBox(height: 5),
              CustomLanguageColumn(),
            ],
            Divider(color: AppCubit.get(context).primaryColor,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14.0),
              child: InkWell(
                splashColor:  AppCubit.get(context).textColor.withOpacity(0.0),
                highlightColor: AppCubit.get(context).textColor.withOpacity(0.0),
                onTap: () =>
                    AppCubit
                    .get(context)
                    .changeThemeContainerStatus(),
                child: CustomRowItem(
                 iconData: Icons.brightness_4,
                  text: 'Theme',
                  arrowStatus: AppCubit.get(context).isThemeContainerOpen,
                ),
              ),
            ),
            if (AppCubit.get(context).isThemeContainerOpen) ...[
              const SizedBox(height: 20),
              CustomDivider(),
              const SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 5
                ),
                child: CustomOptionRow(
                  title: Theme.of(context).brightness == Brightness.dark
                      ? "Light Mode"
                      : "Dark Mode",
                  icon: Icons.dark_mode,
                  isActive: AppCubit.get(context).themeMode,
                  onChange: (value) {
                  AppCubit.get(context).changeTheme();
                }),
              ),
              const SizedBox(height: 15),
              CustomThemeOptionColumn(),
            ],
          ],
        ),
      ),
    );
  },
    );
  }
}
