
import 'package:book_app/core/cubit/app_cubit.dart';
import 'package:book_app/core/utils/styles.dart';
import 'package:flutter/material.dart';

class CustomRadioListItem extends StatelessWidget {
  CustomRadioListItem({
  super.key,
  required  this.radioValue,
  required this.groupValue,
  required this.onChangedFun,
  required this.titleText,
  });

  final String radioValue, groupValue,titleText;
  Function(dynamic)? onChangedFun;

  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 2.0),
      value: radioValue,
      groupValue: groupValue,
      onChanged: onChangedFun,
      activeColor: AppCubit.get(context).primaryColor,
      title: Text(
        titleText,
        style: Styles.textStyle14,
      ),
    );
  }
}
