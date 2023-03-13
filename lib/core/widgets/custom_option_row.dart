
import 'package:book_app/core/cubit/app_cubit.dart';
import 'package:book_app/core/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomOptionRow extends StatelessWidget {
  CustomOptionRow({
  super.key,
  required this.title,
  required this.icon,
  required this.isActive,
  required this.onChange
  });

  final IconData icon;
  final String title;
  bool isActive;
  Function(bool) onChange;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0,horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                  icon,
                  color:
                  AppCubit.get(context).themeMode == false
                      ? Colors.grey
                      : Colors.white
              ),
              const SizedBox(width: 25,),
              Text(
                  title,
                  style: Styles.textStyle16
              ),
            ],
          ),
          Transform.scale(
              scale: 0.7,
              child: CupertinoSwitch(
                activeColor:AppCubit.get(context).primaryColor,
                value: isActive,
                onChanged:onChange ,
              ))
        ],
      ),
    );
  }
}
