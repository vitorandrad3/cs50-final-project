import 'package:despesas_pessoais/home_page/components/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: FlexThemeData.light(
        scheme: FlexScheme.amber,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 9,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 10,
          blendOnColors: false,
          inputDecoratorRadius: 25.0,
          inputDecoratorFocusedBorderWidth: 2.5,
          elevatedButtonSecondarySchemeColor: SchemeColor.primary,
          elevatedButtonSchemeColor: SchemeColor.onPrimary,
          textButtonSchemeColor: SchemeColor.primary,
          appBarBackgroundSchemeColor: SchemeColor.primary,
          bottomNavigationBarSelectedLabelSchemeColor: SchemeColor.onPrimary,
          bottomNavigationBarUnselectedLabelSchemeColor: SchemeColor.onPrimary,
          bottomNavigationBarSelectedIconSchemeColor: SchemeColor.onPrimary,
          bottomNavigationBarUnselectedIconSchemeColor: SchemeColor.onPrimary,
          bottomNavigationBarBackgroundSchemeColor: SchemeColor.primary,
          navigationBarBackgroundSchemeColor: SchemeColor.tertiaryContainer,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        swapLegacyOnMaterial3: true,
      ),
      darkTheme: FlexThemeData.dark(
        scheme: FlexScheme.amber,
        surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
        blendLevel: 15,
        subThemesData: const FlexSubThemesData(
          blendOnLevel: 20,
          textButtonSchemeColor: SchemeColor.onPrimary,
          bottomNavigationBarSelectedLabelSchemeColor: SchemeColor.onPrimary,
          bottomNavigationBarUnselectedLabelSchemeColor: SchemeColor.onPrimary,
          bottomNavigationBarSelectedIconSchemeColor: SchemeColor.onPrimary,
          bottomNavigationBarUnselectedIconSchemeColor: SchemeColor.onPrimary,
          bottomNavigationBarBackgroundSchemeColor: SchemeColor.primary,
          navigationBarBackgroundSchemeColor: SchemeColor.tertiaryContainer,
        ),
        visualDensity: FlexColorScheme.comfortablePlatformDensity,
        useMaterial3: true,
        swapLegacyOnMaterial3: true,
      ),
    );
  }
}
