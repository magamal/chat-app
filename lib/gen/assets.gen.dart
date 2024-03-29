/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class Assets {
  Assets._();

  static const AssetGenImage alert = AssetGenImage('assets/Alert.png');
  static const AssetGenImage eGFlag = AssetGenImage('assets/EG_flag.png');
  static const AssetGenImage orangeLogo =
      AssetGenImage('assets/Orange_logo.png');
  static const AssetGenImage transfer = AssetGenImage('assets/Transfer.png');
  static const AssetGenImage addFilled = AssetGenImage('assets/add_filled.png');
  static const AssetGenImage atomPrimaryiconArrowleftOutlinedPng =
      AssetGenImage('assets/atom_primaryicon_arrowleft_outlined.png');
  static const String atomPrimaryiconArrowleftOutlinedSvg =
      'assets/atom_primaryicon_arrowleft_outlined.svg';
  static const AssetGenImage deleteFilled =
      AssetGenImage('assets/delete_filled.png');
  static const AssetGenImage icMicrophone =
      AssetGenImage('assets/ic_Microphone.png');
  static const AssetGenImage iconPhone = AssetGenImage('assets/icon_phone.png');
  static const AssetGenImage moroccoFlag =
      AssetGenImage('assets/morocco_flag.png');
  static const AssetGenImage pauseFilled =
      AssetGenImage('assets/pause_filled.png');
  static const AssetGenImage person = AssetGenImage('assets/person.png');
  static const AssetGenImage playcircleFilled =
      AssetGenImage('assets/playcircle_filled.png');
  static const AssetGenImage recordTrack =
      AssetGenImage('assets/record_track.png');
  static const AssetGenImage rightOutlined =
      AssetGenImage('assets/right_outlined.png');
  static const AssetGenImage searchOutlined =
      AssetGenImage('assets/search_outlined.png');
  static const AssetGenImage sendFilled =
      AssetGenImage('assets/send_filled.png');
  static const AssetGenImage settingOutlined =
      AssetGenImage('assets/setting_outlined.png');
  static const AssetGenImage startChat =
      AssetGenImage('assets/start_chat.jpeg');
  static const AssetGenImage welcome = AssetGenImage('assets/welcome.png');

  /// List of all assets
  static List<dynamic> get values => [
        alert,
        eGFlag,
        orangeLogo,
        transfer,
        addFilled,
        atomPrimaryiconArrowleftOutlinedPng,
        atomPrimaryiconArrowleftOutlinedSvg,
        deleteFilled,
        icMicrophone,
        iconPhone,
        moroccoFlag,
        pauseFilled,
        person,
        playcircleFilled,
        recordTrack,
        rightOutlined,
        searchOutlined,
        sendFilled,
        settingOutlined,
        startChat,
        welcome
      ];
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
