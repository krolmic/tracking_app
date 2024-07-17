/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/adaptive_icon_background.png
  AssetGenImage get adaptiveIconBackground =>
      const AssetGenImage('assets/images/adaptive_icon_background.png');

  /// File path: assets/images/adaptive_icon_foreground.png
  AssetGenImage get adaptiveIconForeground =>
      const AssetGenImage('assets/images/adaptive_icon_foreground.png');

  /// File path: assets/images/icon.png
  AssetGenImage get icon => const AssetGenImage('assets/images/icon.png');

  /// File path: assets/images/onboarding_breathe.png
  AssetGenImage get onboardingBreathe =>
      const AssetGenImage('assets/images/onboarding_breathe.png');

  /// File path: assets/images/onboarding_inhale_exhale.png
  AssetGenImage get onboardingInhaleExhale =>
      const AssetGenImage('assets/images/onboarding_inhale_exhale.png');

  /// File path: assets/images/onboarding_namaste.png
  AssetGenImage get onboardingNamaste =>
      const AssetGenImage('assets/images/onboarding_namaste.png');

  /// File path: assets/images/onboarding_present_moment.png
  AssetGenImage get onboardingPresentMoment =>
      const AssetGenImage('assets/images/onboarding_present_moment.png');

  /// List of all assets
  List<AssetGenImage> get values => [
        adaptiveIconBackground,
        adaptiveIconForeground,
        icon,
        onboardingBreathe,
        onboardingInhaleExhale,
        onboardingNamaste,
        onboardingPresentMoment
      ];
}

class Assets {
  Assets._();

  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size = null});

  final String _assetName;

  final Size? size;

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
