import 'package:flutter/material.dart';

class CustomColors extends ThemeExtension<CustomColors> {
  // light mode colors
  final Color brown;
  final Color cream;
  final Color lightBrown;
  final Color green;
  final Color black;
  final Color white;
  final Color background;

  const CustomColors({
    required this.brown,
    required this.cream,
    required this.lightBrown,
    required this.green,
    required this.black,
    required this.white,
    required this.background
  });

  @override
  CustomColors copyWith({
    Color? brown,
    Color? cream,
    Color? lightBrown,
    Color? green,
    Color? black,
    Color? white,
    Color? background,
  }) {
    return CustomColors(
        brown: brown ?? this.brown,
        cream: cream ?? this.cream,
        lightBrown: lightBrown ?? this.lightBrown,
        green: green ?? this.green,
        black: black ?? this.black,
        white: white ?? this.white,
        background: white ?? this.background);
  }

  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
        brown: Color.lerp(brown, other.brown, t)!,
        cream: Color.lerp(cream, other.cream, t)!,
        lightBrown: Color.lerp(lightBrown, other.lightBrown, t)!,
        green: Color.lerp(green, other.green, t)!,
        black: Color.lerp(black, other.black, t)!,
        white: Color.lerp(white, other.white, t)!,
        background: Color.lerp(background, other.background, t)!);
  }
}
