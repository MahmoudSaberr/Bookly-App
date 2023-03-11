import 'package:bloc/bloc.dart';
import 'package:book_app/constants.dart';
import 'package:book_app/core/cubit/app_state.dart';
import 'package:book_app/core/helper/cashe_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitial()){
    int? pcIndex =
    CacheHelper.getData(key: 'primaryColor');
    bool firstMode = CacheHelper.getData(key: "isLight")??false;
    themeMode = firstMode ?? false;
    primaryColorIndex = pcIndex ?? 0;
    primaryColor = defaultColors[primaryColorIndex];
  }

  static AppCubit get(context) => BlocProvider.of(context);

  int primaryColorIndex = 0;


  List defaultColors = [
    kPrimaryBlack,
    kPrimaryWhite,
    Colors.cyan,
    Colors.deepOrange,
    Colors.blue,
    Colors.pink,
    Colors.deepPurple,
    Colors.amber,
    Colors.lime,
    Colors.indigo,
    Colors.orange,
    Colors.green,
    Colors.blueGrey,

  ];
  dynamic primaryColor = kPrimaryyColor;

  void changePrimaryColorIndex(int newIndex, dynamic color) async {
    primaryColorIndex = newIndex;
    primaryColor = color;
    emit(PrimaryColorIndexState());
    //////////////////
    await CacheHelper.saveIntData(
      key: 'primaryColor',
      value: primaryColorIndex,
    );
  }

  String appLanguage = 'ar'; // en --or-- ar
  int changingLanguage = 0;
  void changeAppLanguage(String newValue) {
    appLanguage = newValue;
    changingLanguage = 1;
    emit(ChangeAppLanguageState());
    ////////////////
    CacheHelper.saveStringData(
      key: 'appLanguage',
      value: appLanguage,
    ).then((value) async {

      changingLanguage = 0;
      emit(ChangeAppLanguageSuccessState());
    });
  }

  bool isThemeContainerOpen = false;

  void changeThemeContainerStatus() {
    isThemeContainerOpen = !isThemeContainerOpen;
    emit(ChangeThemeContainerStatusState());
  }

  bool isLanguageContainerOpen = false;

  void changeLanguageContainerStatus() {
    isLanguageContainerOpen = !isLanguageContainerOpen;
    emit(ChangeLanguageContainerStatusState());
  }

  bool themeMode = false;
  Color textColor = Colors.black;
  void changeTheme() {
    themeMode ? themeMode = false : themeMode = true;

    CacheHelper.saveBoolData(key: "isLight", value: themeMode);
    emit(ThemeChangedState());
  }

  getFirstMode(mode) {
    CacheHelper.saveBoolData(key: "isLight", value: mode);
    themeMode = CacheHelper.getData(key: "isLight");
    emit(GetFirstModeState());

  }

}
