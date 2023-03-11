
import 'package:book_app/core/cubit/app_cubit.dart';
import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  CustomDivider({super.key,});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 100),
      child: Container(
        width: 200,
        height: 3.0,
        decoration: BoxDecoration(
            color: AppCubit.get(context).primaryColor,
            borderRadius: BorderRadius.circular(15)
        ),
      ),
    );  }
}
