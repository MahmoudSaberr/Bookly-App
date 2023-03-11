import 'package:flutter/material.dart';

abstract class AppState {}

class AppInitial extends AppState {}

class ThemeChangedState extends AppState {}

class ChangeLanguageContainerStatusState extends AppState {}

class PrimaryColorIndexState extends AppState {}

class ChangeThemeContainerStatusState extends AppState {}

class ChangeAppLanguageState extends AppState {}

class ChangeAppLanguageSuccessState extends AppState {}

class GetFirstModeState extends AppState {}

class ChangeLocalState extends AppState {
  final Locale locale;
  ChangeLocalState({required this.locale});
}
