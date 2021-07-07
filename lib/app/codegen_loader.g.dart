// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> nl = {
  "settings": "{} are written in the {} language",
  "home": "Easy localization are written in the {lang} language",
  "profile": "{} are written in the {lang} language"
};
static const Map<String,dynamic> en = {
  "rp_card_title": "Points near you",
  "rp_card_title_loading": "Loading points near you",
  "rp_card_title_empty": "No Points found near you",
  "rp_card_subtitle": "The following points are closest to you",
  "rp_card_subtitle_loading": "Please wait while we load the closest recyclepoints",
  "rp_card_subtitle_empty": "we were unable to identify recyclepoints"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"nl": nl, "en": en};
}
