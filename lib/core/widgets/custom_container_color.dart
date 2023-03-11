
import 'package:book_app/core/cubit/app_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContainerColor extends StatelessWidget {
  ContainerColor({
  super.key,
  required this.index,
  required this.color,
  });

  final int index;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  const EdgeInsets.symmetric(horizontal: 8.0),
      child: InkWell(
        onTap: () {
          AppCubit.get(context).changePrimaryColorIndex(index, color);
        },
        child: Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: index == AppCubit.get(context).primaryColorIndex
              ? const Icon(Icons.done, color: Colors.white, size: 15)
              : null,
        ),
      ),
    );
  }
}
