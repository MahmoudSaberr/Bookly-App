import 'package:book_app/constants.dart';
import 'package:book_app/core/cubit/app_cubit.dart';
import 'package:book_app/core/widgets/custom_radio_list_tile.dart';
import 'package:flutter/material.dart';

class CustomLanguageColumn extends StatelessWidget {
  CustomLanguageColumn({super.key,});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CustomRadioListItem(
          radioValue: kEnglish,
          groupValue: AppCubit.get(context).appLanguage,
          onChangedFun: (newVal) {
            AppCubit.get(context).changeLanguage(newVal!);
          },
          titleText: 'English',
        ),
        CustomRadioListItem(
          radioValue: kArabic,
          groupValue: AppCubit.get(context).appLanguage,
          onChangedFun: (newVal) {
            AppCubit.get(context).changeLanguage(newVal!);
          },
          titleText: 'arabic',
        ),
      ],
    );
  }
}
