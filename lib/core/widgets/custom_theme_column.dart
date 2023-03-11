
import 'package:book_app/core/cubit/app_cubit.dart';
import 'package:book_app/core/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'custom_container_color.dart';

class CustomThemeOptionColumn extends StatelessWidget {
  CustomThemeOptionColumn({super.key,});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Accent Color',
          style: Styles.textStyle14,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 15.0),
        SizedBox(
          height: 25,
          child: ListView.builder(
              itemCount:AppCubit.get(context).defaultColors.length ,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context,index){
                return ContainerColor(
                    index: index,
                    color:AppCubit.get(context).defaultColors[index]
                );
              }),
        ),
      ],
    );
  }
}
