import 'package:flutter/material.dart';

import 'app_pallete.dart';

@immutable
class CustomColors extends ThemeExtension<CustomColors> {
  final Color success;
  final Color error;
  final Color lightTextColor;
  final Color thinTextColor;
  final Color backBtnBgColor;
  final Color textOnPrimary;
  final Color textOnScaffold;
  final Color scaffoldShadow;
  final Color containerShadow;
  final Color text100;
  final Color text200;
  final Color text300;
  final Color text400;
  final Color border;
  final Color primaryShadow;
  final Color testCardBgColor;
  final Color reportsCardBgColor;
  final Color machineCardBgColor;
  final Color categoryCardBgColor;
  final Color settingsCardBgColor;
  final Color userManagementCardBgColor;
  final Color masterFileCardBgColor;
  final Color cardTextColor;
  final Color primaryTextColor;
  final Color tableBorderColor;
  final Color inputLabelColor;
  final Color tableHeaderBackground;
  final Color calibrationsCardBgColor;
  final Color parameterCard;
  final Color parameterLine;
  final Color auditLogsCardColor;
  final Color onboardingCardColor;
  final Color testPreviewCardColor;
  final Color tableBodyColor;
  final Color screenBackground;

  const CustomColors({
    required this.success,
    required this.error,
    required this.lightTextColor,
    required this.thinTextColor,
    required this.backBtnBgColor,
    required this.textOnPrimary,
    required this.scaffoldShadow,
    required this.containerShadow,
    required this.text100,
    required this.text200,
    required this.text300,
    required this.text400,
    required this.border,
    required this.primaryShadow,
    required this.textOnScaffold,
    required this.testCardBgColor,
    required this.reportsCardBgColor,
    required this.machineCardBgColor,
    required this.settingsCardBgColor,
    required this.categoryCardBgColor,
    required this.masterFileCardBgColor,
    required this.cardTextColor,
    required this.primaryTextColor,
    required this.inputLabelColor,
    required this.tableBorderColor,
    required this.tableHeaderBackground,
    required this.userManagementCardBgColor,
    required this.calibrationsCardBgColor,
    required this.parameterCard,
    required this.parameterLine,
    required this.auditLogsCardColor,
    required this.onboardingCardColor,
    required this.testPreviewCardColor,
    required this.tableBodyColor,
    required this.screenBackground
  });

  // Light theme factory
  factory CustomColors.light() => const CustomColors(
        success: AppPalette.success,
        error: AppPalette.textRed,
        lightTextColor: AppPalette.lightTextColor,
        thinTextColor: AppPalette.thinTextColor,
        backBtnBgColor: AppPalette.primary,
        textOnPrimary: AppPalette.white,
        scaffoldShadow: AppPalette.secondaryShadow,
        containerShadow: AppPalette.primaryShadow,
        text100: AppPalette.primary,
        text200: AppPalette.primary,
        text300: AppPalette.warmGrey300,
        text400: AppPalette.warmGrey400,
        border: AppPalette.warmGrey200,
        primaryShadow: AppPalette.primaryShadow,
        textOnScaffold: AppPalette.darkGrey,
        testCardBgColor: AppPalette.indigoCard,
        reportsCardBgColor: AppPalette.blueCard,
        machineCardBgColor: AppPalette.purpleCard,
        settingsCardBgColor: AppPalette.greenCard,
        categoryCardBgColor: AppPalette.yellowCard,
      masterFileCardBgColor: AppPalette.masterCard,
      inputLabelColor: AppPalette.textColorGrey2,
      cardTextColor: Colors.black,
      primaryTextColor: AppPalette.primary,
      tableBorderColor: AppPalette.borderColor,
      tableHeaderBackground: AppPalette.tableHeaderBackground,
      userManagementCardBgColor: AppPalette.userManagementCard,
      calibrationsCardBgColor: AppPalette.calibrationCard,
      parameterCard: Colors.yellow,
      parameterLine: AppPalette.textRed,
      auditLogsCardColor: AppPalette.auditLogsCard,
      onboardingCardColor: AppPalette.onboardingCard,
      testPreviewCardColor: AppPalette.testPreviewCard,
      tableBodyColor: AppPalette.white,
      screenBackground: AppPalette.lightPurple
      );

  // Dark theme factory
  factory CustomColors.dark() => const CustomColors(
      success: AppPalette.greenCardDark,
      error: AppPalette.mutedRed,
      lightTextColor: Color(0xFFE0E0E0), // Light gray for dark theme
      thinTextColor: Color(0xFF9E9E9E), // Medium gray
      backBtnBgColor: AppPalette.lighterDarkGrey, // Dark gray background
      textOnPrimary: Color(0xFFE0E0E0),
      scaffoldShadow: Color(0x33000000), // Black shadow for dark theme
      containerShadow: Color(0x55000000), // Darker shadow
      text100: Color(0xFF1E1E1E), // Very dark for backgrounds
      text200: Color(0xFF2C2C2C), // Dark gray
      text300: AppPalette.mediumDarkGrey, // Medium dark gray
      text400: AppPalette.lighterDarkGrey, // Lighter dark gray
      border: Color(0xFF3A3A3A), // Dark border
      primaryShadow: Color(0x55000000),
      textOnScaffold: Color(0xFFE0E0E0), // Light text on dark scaffold
      // Card colors with opacity/transparency for dark theme
      testCardBgColor: Color(0xFFab67e2), // Semi-transparent indigo
      reportsCardBgColor: Color(0xFF1adeeb), // Semi-transparent blue
      machineCardBgColor: Color(0xFF80a8d8), // Semi-transparent purple
      settingsCardBgColor: Color(0xFFABBD94), // Semi-transparent green
      categoryCardBgColor: AppPalette.mediumDarkGrey, // Semi-transparent yellow
      masterFileCardBgColor: AppPalette.mediumDarkGrey, // Semi-transparent orange
      cardTextColor: AppPalette.white,
      primaryTextColor: AppPalette.white,
      tableBorderColor: Color(0xFF3A3A3A),
      tableHeaderBackground: Color(0xFF2C2C2C),
      userManagementCardBgColor: Color(0xFFbeaf8e), // Semi-transparent pink
      calibrationsCardBgColor: Color(0xFFe19e76), // Semi-transparent cyan
      parameterCard: Color(0x80FFEB3B), // Semi-transparent yellow
      parameterLine: AppPalette.textRed,
      auditLogsCardColor: Color(0xFFd200d4), // Semi-transparent deep purple
      onboardingCardColor: Color(0xFFa140ee), // Semi-transparent light blue
      testPreviewCardColor: Color(0xFFE0E0E0),
      tableBodyColor:AppPalette.mediumDarkGrey,
      screenBackground: AppPalette.mediumDarkGrey,
      inputLabelColor: AppPalette.textColorGrey2
  );


  @override
  CustomColors copyWith({
    Color? success,
    Color? error,
    Color? gradient,
    Color? scaffoldBg,
    Color? lightTextColor,
    Color? thinTextColor,
    Color? backBtnBgColor,
    Color? textOnPrimary,
    Color? containerShadow,
    Color? text100,
    Color? text200,
    Color? text300,
    Color? text400,
    Color? border,
    Color? primaryShadow,
    Color? darkGrey,
    Color? closeSheetIcon,
    Color? textOnScaffold,
    Color? testCardBgColor,
    Color? reportsCardBgColor,
    Color? machineCardBgColor,
    Color? settingsCardBgColor,
    Color? categoryCardBgColor,
    Color? masterFileCardBgColor,
    Color? cardTextColor,
    Color? primaryTextColor,
    Color? tableBorderColor,
    Color? tableHeaderBackground,
    Color? userManagementCardBgColor,
    Color? calibrationsCardBgColor,
    Color? scaffoldShadow,
    Color? parameterCard,
    Color? parameterLine,
    Color? auditLogsCardColor,
    Color? onboardingCardColor,
    Color? testPreviewCardColor,
    Color? tableBodyColor,
    Color? screenBackground,
    Color? inputLabelColor
  }) {
    return CustomColors(
      success: success ?? this.success,
      error: error ?? this.error,
      lightTextColor: lightTextColor ?? this.lightTextColor,
      thinTextColor: thinTextColor ?? this.thinTextColor,
      backBtnBgColor: backBtnBgColor ?? this.backBtnBgColor,
      textOnPrimary: textOnPrimary ?? this.textOnPrimary,
      scaffoldShadow: scaffoldShadow ?? this.scaffoldShadow,
      containerShadow: containerShadow ?? this.containerShadow,
      text100: text100 ?? this.text100,
      text200: text200 ?? this.text200,
      text300: text300 ?? this.text300,
      text400: text400 ?? this.text400,
      border: border ?? this.border,
      primaryShadow: primaryShadow ?? this.primaryShadow,
      textOnScaffold: textOnScaffold ?? this.textOnScaffold,
        testCardBgColor: testCardBgColor ?? this.testCardBgColor,
        reportsCardBgColor: reportsCardBgColor ??  this.reportsCardBgColor,
      machineCardBgColor: machineCardBgColor ?? this.testCardBgColor,
      settingsCardBgColor: settingsCardBgColor ?? this.settingsCardBgColor,
      categoryCardBgColor: categoryCardBgColor ?? this.categoryCardBgColor,
        masterFileCardBgColor: masterFileCardBgColor ?? this.masterFileCardBgColor,
        cardTextColor: cardTextColor ?? this.cardTextColor,
        primaryTextColor: primaryTextColor ?? this.primaryTextColor,
        tableBorderColor: tableBorderColor ??  this.tableBorderColor,
        tableHeaderBackground: tableHeaderBackground ?? this.tableHeaderBackground,
        userManagementCardBgColor: userManagementCardBgColor ?? this.userManagementCardBgColor,
        calibrationsCardBgColor: calibrationsCardBgColor ??  this.calibrationsCardBgColor,
        parameterCard: parameterCard ?? this.parameterCard,
        parameterLine: parameterLine ?? this.parameterLine,
        auditLogsCardColor: auditLogsCardColor ?? this.auditLogsCardColor,
        onboardingCardColor: onboardingCardColor ?? this.onboardingCardColor,
        testPreviewCardColor: testPreviewCardColor ?? this.testPreviewCardColor,
        tableBodyColor: tableBodyColor ?? this.tableBodyColor,
        screenBackground: screenBackground ?? this.screenBackground,
        inputLabelColor: inputLabelColor ??  this.inputLabelColor
    );
  }

  @override
  CustomColors lerp(ThemeExtension<CustomColors>? other, double t) {
    if (other is! CustomColors) return this;
    return CustomColors(
      success: Color.lerp(success, other.success, t)!,
      error: Color.lerp(error, other.error, t)!,
      lightTextColor: Color.lerp(lightTextColor, other.lightTextColor, t)!,
      thinTextColor: Color.lerp(thinTextColor, other.thinTextColor, t)!,
      backBtnBgColor: Color.lerp(backBtnBgColor, other.backBtnBgColor, t)!,
      textOnPrimary: Color.lerp(textOnPrimary, other.textOnPrimary, t)!,
      scaffoldShadow: Color.lerp(scaffoldShadow, other.scaffoldShadow, t)!,
      containerShadow: Color.lerp(containerShadow, other.containerShadow, t)!,
      text100: Color.lerp(text100, other.text100, t)!,
      text200: Color.lerp(text200, other.text200, t)!,
      text300: Color.lerp(text300, other.text300, t)!,
      text400: Color.lerp(text400, other.text400, t)!,
      border: Color.lerp(border, other.border, t)!,
      primaryShadow: Color.lerp(primaryShadow, other.primaryShadow, t)!,
      textOnScaffold: Color.lerp(textOnScaffold, other.textOnScaffold, t)!,
        reportsCardBgColor: Color.lerp(reportsCardBgColor, other.reportsCardBgColor, t)!,
      machineCardBgColor: Color.lerp(machineCardBgColor, other.machineCardBgColor, t)!,
      settingsCardBgColor: Color.lerp(settingsCardBgColor, other.settingsCardBgColor, t)!,
      categoryCardBgColor: Color.lerp(categoryCardBgColor, other.categoryCardBgColor, t)!,
        testCardBgColor: Color.lerp(testCardBgColor, other.testCardBgColor, t)!,
        masterFileCardBgColor: Color.lerp(masterFileCardBgColor, other.masterFileCardBgColor, t)!,
        cardTextColor: Color.lerp(cardTextColor, other.cardTextColor, t)!,
        primaryTextColor: Color.lerp(primaryTextColor, other.primaryTextColor, t)!,
      tableBorderColor: Color.lerp(tableBorderColor, other.tableBorderColor, t)!,
      tableHeaderBackground: Color.lerp(tableHeaderBackground, other.tableHeaderBackground, t)!,
      userManagementCardBgColor: Color.lerp(userManagementCardBgColor, other.userManagementCardBgColor, t)!,
      calibrationsCardBgColor: Color.lerp(calibrationsCardBgColor, other.calibrationsCardBgColor, t)!,
      parameterCard: Color.lerp(parameterCard, other.parameterCard, t)!,
      parameterLine: Color.lerp(parameterLine, other.parameterLine, t)!,
      auditLogsCardColor: Color.lerp(auditLogsCardColor, other.auditLogsCardColor, t)!,
      onboardingCardColor: Color.lerp(onboardingCardColor, other.onboardingCardColor, t)!,
      testPreviewCardColor: Color.lerp(testPreviewCardColor, other.testPreviewCardColor, t)!,
      tableBodyColor: Color.lerp(tableBodyColor, other.tableBodyColor, t)!,
      screenBackground: Color.lerp(screenBackground, other.screenBackground, t)!,
        inputLabelColor: Color.lerp(inputLabelColor, other.inputLabelColor, t)!
    );
  }
}
