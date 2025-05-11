import 'package:flutter/material.dart';

class AppThemeExtension extends ThemeExtension<AppThemeExtension> {
  final LinearGradient scaffoldGradient;

  AppThemeExtension({required this.scaffoldGradient});

  @override
  ThemeExtension<AppThemeExtension> copyWith({
    LinearGradient? scaffoldGradient,
  }) {
    return AppThemeExtension(
      scaffoldGradient: scaffoldGradient ?? this.scaffoldGradient,
    );
  }

  @override
  ThemeExtension<AppThemeExtension> lerp(
    ThemeExtension<AppThemeExtension>? other,
    double t,
  ) {
    if (other is! AppThemeExtension) {
      return this;
    }
    return AppThemeExtension(
      scaffoldGradient:
          LinearGradient.lerp(scaffoldGradient, other.scaffoldGradient, t)!,
    );
  }
}
