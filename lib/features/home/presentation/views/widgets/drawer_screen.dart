import 'package:book_app/constants.dart';
import 'package:book_app/features/home/presentation/views/widgets/Menu_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import '../home_view.dart';

class DrawerView extends StatefulWidget {
  const DrawerView({Key? key}) : super(key: key);

  @override
  _DrawerViewState createState() => _DrawerViewState();
}

class _DrawerViewState extends State<DrawerView> {

  final zoomDrawerController = ZoomDrawerController();

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: zoomDrawerController,
      menuScreen: const MenuScreen(), // s
      mainScreen: const HomeView(), // et slideWidth
      style: DrawerStyle.defaultStyle,
      moveMenuScreen: false,
      showShadow: true,
      angle: 0,
      drawerShadowsBackgroundColor: Colors.grey.shade300,
      shadowLayer1Color:
      Theme.of(context).brightness == Brightness.dark ? kShadowOneColorDark
          : kShadowOneColorLight,
      shadowLayer2Color:
      Theme.of(context).brightness == Brightness.dark ? kShadowTwoColorDark
          : kShadowTwoColorLight,
      menuBackgroundColor:
      Theme.of(context).brightness == Brightness.dark ? kMenuBackgroundColorDark
          : kMenuBackgroundColorLight,
      slideWidth: MediaQuery.of(context).size.width * 0.8,
    );
  }
}
