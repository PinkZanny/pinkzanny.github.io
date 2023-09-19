import 'package:flutter/material.dart';

class CTheme {
  static Color? primary;
  static Color? onPrimary;
  static Color? primaryContainer;
  static Color? onPrimaryContainer;
  static Color? secondary;
  static Color? onSecondary;
  static Color? secondaryContainer;
  static Color? onSecondaryContainer;
  static Color? tertiary;
  static Color? onTertiary;
  static Color? tertiaryContainer;
  static Color? onTertiaryContainer;
  static Color? error;
  static Color? errorContainer;
  static Color? onError;
  static Color? onErrorContainer;
  static Color? background;
  static Color? onBackground;
  static Color? surface;
  static Color? onSurface;
  static Color? surfaceVariant;
  static Color? onSurfaceVariant;
  static Color? outline;
  static Color? onInverseSurface;
  static Color? inverseSurface;
  static Color? inversePrimary;
  static Color? shadow;
  static Color? surfaceTint;
  static Color? outlineVariant;
  static Color? scrim;

  static void init(final BuildContext context) {
    primary = Theme.of(context).colorScheme.primary;
    onPrimary = Theme.of(context).colorScheme.onPrimary;
    primaryContainer = Theme.of(context).colorScheme.primaryContainer;
    onPrimaryContainer = Theme.of(context).colorScheme.onPrimaryContainer;
    secondary = Theme.of(context).colorScheme.secondary;
    onSecondary = Theme.of(context).colorScheme.onSecondary;
    secondaryContainer = Theme.of(context).colorScheme.secondaryContainer;
    onSecondaryContainer = Theme.of(context).colorScheme.onSecondaryContainer;
    tertiary = Theme.of(context).colorScheme.tertiary;
    onTertiary = Theme.of(context).colorScheme.onTertiary;
    tertiaryContainer = Theme.of(context).colorScheme.tertiaryContainer;
    onTertiaryContainer = Theme.of(context).colorScheme.onTertiaryContainer;
    error = Theme.of(context).colorScheme.error;
    errorContainer = Theme.of(context).colorScheme.errorContainer;
    onError = Theme.of(context).colorScheme.onError;
    onErrorContainer = Theme.of(context).colorScheme.onErrorContainer;
    background = Theme.of(context).colorScheme.background;
    onBackground = Theme.of(context).colorScheme.onBackground;
    surface = Theme.of(context).colorScheme.surface;
    onSurface = Theme.of(context).colorScheme.onSurface;
    surfaceVariant = Theme.of(context).colorScheme.surfaceVariant;
    onSurfaceVariant = Theme.of(context).colorScheme.onSurfaceVariant;
    outline = Theme.of(context).colorScheme.outline;
    onInverseSurface = Theme.of(context).colorScheme.onInverseSurface;
    inverseSurface = Theme.of(context).colorScheme.inverseSurface;
    inversePrimary = Theme.of(context).colorScheme.inversePrimary;
    shadow = Theme.of(context).colorScheme.shadow;
    surfaceTint = Theme.of(context).colorScheme.surfaceTint;
    outlineVariant = Theme.of(context).colorScheme.outlineVariant;
    scrim = Theme.of(context).colorScheme.scrim;
  }
}
