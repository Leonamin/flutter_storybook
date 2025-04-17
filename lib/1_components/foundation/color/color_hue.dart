
import 'package:flutter/material.dart';

class ColorHue {
  // --- 색상 선언

  static const transparent = Colors.transparent;

  // Base Colors
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);

// Orange Shades
  static const Color orange50 = Color(0xFFFEEFEB);
  static const Color orange100 = Color(0xFFFCCEBF);
  static const Color orange200 = Color(0xFFFAB6A1);
  static const Color orange300 = Color(0xFFF89476);
  static const Color orange400 = Color(0xFFF6805B);
  static const Color orange500 = Color(0xFFF46032);
  static const Color orange600 = Color(0xFFDE572E);
  static const Color orange700 = Color(0xFFAD4424);
  static const Color orange800 = Color(0xFF86351C);
  static const Color orange900 = Color(0xFF662815);

// Lime Shades
  static const Color lime50 = Color(0xFFF4FEE7);
  static const Color lime100 = Color(0xFFDEFBB4);
  static const Color lime200 = Color(0xFFCDF98F);
  static const Color lime300 = Color(0xFFB7F65C);
  static const Color lime400 = Color(0xFFA9F53D);
  static const Color lime500 = Color(0xFF93F20C);
  static const Color lime600 = Color(0xFF86DC0B);
  static const Color lime700 = Color(0xFF68AC09);
  static const Color lime800 = Color(0xFF518507);
  static const Color lime900 = Color(0xFF3E6605);

// Gray Shades
  static const Color gray50 = Color(0xFFF9FAFB);
  static const Color gray100 = Color(0xFFF3F4F6);
  static const Color gray200 = Color(0xFFE5E7EB);
  static const Color gray300 = Color(0xFFD1D5DB);
  static const Color gray400 = Color(0xFF9CA3AF);
  static const Color gray500 = Color(0xFF6B7280);
  static const Color gray600 = Color(0xFF4B5563);
  static const Color gray700 = Color(0xFF374151);
  static const Color gray800 = Color(0xFF1F2937);
  static const Color gray900 = Color(0xFF111827);

// Red Shades
  static const Color red50 = Color(0xFFFEF2F2);
  static const Color red100 = Color(0xFFFEE2E2);
  static const Color red200 = Color(0xFFFECACA);
  static const Color red300 = Color(0xFFFCA5A5);
  static const Color red400 = Color(0xFFF87171);
  static const Color red500 = Color(0xFFEF4444);
  static const Color red600 = Color(0xFFDC2626);
  static const Color red700 = Color(0xFFB91C1C);
  static const Color red800 = Color(0xFF991B1B);
  static const Color red900 = Color(0xFF7F1D1D);

// Yellow Shades
  static const Color yellow50 = Color(0xFFFFFCE8);
  static const Color yellow100 = Color(0xFFFEF9C3);
  static const Color yellow200 = Color(0xFFFEF08A);
  static const Color yellow300 = Color(0xFFFDE047);
  static const Color yellow400 = Color(0xFFFACC15);
  static const Color yellow500 = Color(0xFFEAB308);
  static const Color yellow600 = Color(0xFFCA8A04);
  static const Color yellow700 = Color(0xFFA16207);
  static const Color yellow800 = Color(0xFF854D0E);
  static const Color yellow900 = Color(0xFF713F12);

// Blue Shades
  static const Color blue50 = Color(0xFFEFF6FF);
  static const Color blue100 = Color(0xFFDBEAFE);
  static const Color blue200 = Color(0xFFBFDBFE);
  static const Color blue300 = Color(0xFF93C5FD);
  static const Color blue400 = Color(0xFF60A5FA);
  static const Color blue500 = Color(0xFF3B82F6);
  static const Color blue600 = Color(0xFF2563EB);
  static const Color blue700 = Color(0xFF1D4ED8);
  static const Color blue800 = Color(0xFF1E40AF);
  static const Color blue900 = Color(0xFF1E3A8A);

  // LEGACY

  static const greyscale1 = Color(0xFFFAFAFA);
  static const greyscale2 = Color(0xFFF5F5F5);
  static const greyscale3 = Color(0xFFDEDEDE);
  static const greyscale4 = Color(0xFFBFBFBF);
  static const greyscale5 = Color(0xFFA0A0A0);
  static const greyscale6 = Color(0xFF777777);
  static const greyscale7 = Color(0xFF444444);
  static const greyscale8 = Color(0xFF222222);
  static const greyscale9 = Color(0xFF1C1C1C);

  static const primary1 = Color(0xFFE6F8F1);
  static const primary2 = Color(0xFF6BD8AC);
  static const primary3 = Color(0xFF2BC788);
  static const primary4 = Color(0xFF00BC70);
  static const primary5 = Color(0xFF00844E);

  static const secondary1 = Color(0xFFEDF1FF);
  static const secondary2 = Color(0xFF98AEFF);
  static const secondary3 = Color(0xFF6B8BFF);
  static const secondary4 = Color(0xFF4D73FF);
  static const secondary5 = Color(0xFF3651B3);

  static const error1 = Color(0xFFFEECEB);
  static const error2 = Color(0xFFF6938C);
  static const error3 = Color(0xFFF3645A);
  static const error4 = Color(0xFFF04438);
  static const error5 = Color(0xFFA83027);

  static const warning1 = Color(0xFFFFF5E9);
  static const warning2 = Color(0xFFFCC77D);
  static const warning3 = Color(0xFFFBAE44);
  static const warning4 = Color(0xFFFA9E1E);
  static const warning5 = Color(0xFFAF6F15);

  static const purple1 = Color(0xFFF3ECFD);
  static const purple2 = Color(0xFFBC90F4);
  static const purple3 = Color(0xFF9F60EF);
  static const purple4 = Color(0xFF8B40EC);
  static const purple5 = Color(0xFF612DA5);

  static const navy1 = Color(0xFFE9EAEC);
  static const navy2 = Color(0xFF7E8392);
  static const navy3 = Color(0xFF474E63);
  static const navy4 = Color(0xFF212A43);
  static const navy5 = Color(0xFF171D2F);

  // --- 텍스트 색상

  // --- 이름이 있는 색상
  static const lightBackground = white;
  static const darkBackground = black;

  static const bgPrimary = primary4;
  static const bgPrimaryLight = primary1;
  static const bgPrimaryHover = primary5;

  static const bgInfo = secondary4;
  static const bgInfoLight = secondary1;
  static const bgInfoHover = secondary5;

  static const bgDanger = error4;
  static const bgDangerLight = error1;
  static const bgDangerHover = error5;

  static const bgGrey = greyscale4;
  static const bgGreyLight = greyscale1;
  static const bgGreyHover = greyscale5;

  static const bgBlack = greyscale8;
  static const bgBlackLight = greyscale2;
  static const bgBlackHover = greyscale9;

  static const bgSuccessLight = secondary1;

  static const bgWarningLight = warning1;
}
