import 'package:bankee/pages/authentication/otp_page.dart';
import 'package:bankee/pages/details/budget_details_page.dart';
import 'package:bankee/pages/details/details_page.dart';
import 'package:bankee/pages/passcode/confirm_pass_code.dart';
import 'package:bankee/pages/passcode/passcode_page.dart';

import 'package:bankee/pages/authentication/sign_in.dart';
import 'package:bankee/pages/splash/splash.dart';
import 'package:bankee/pages/summary/money_summary_page.dart';
import 'package:bankee/pages/verified/touch_id.dart';
import 'package:bankee/pages/verified/verified_page.dart';
import 'package:get/get.dart';

import '../pages/authentication/mobile_authentication.dart';
import '../pages/authentication/sign_up.dart';

class RouteHelpers {
  static const String initial = "/";
  static const String mobileAuth = "/mobile-auth";
  static const String touchId = "/touch-id";


  static const String otpPage = "/verify-otp";

  static const String signIn = "/sign-in";

  static const String detailsPage = "/details-page";

  static const String summaryPage = "/summary-page";

  static const String budgetDetailsPage = "/budget-details-page";

  static const String passCode = "/pass-code";
  static const String confirmPassCode = "/confirm-pass-code";
  static const String signUp = "/sign-up";
  static const String verified = "/verified";
  // static const String resetPassword = "/reset-password";

  static String getInitial() => '$initial';
  static String getOtpPage() => '$otpPage';
  static String getBudgetDetailsPage() => '$budgetDetailsPage';
  static String getDetailsPage() => '$detailsPage';
  static String getSummaryPage() => '$summaryPage';
  static String getVerifiedPage() => '$verified';

  static String getMobileAuth() => '$mobileAuth';

  static String getPassCode() => '$passCode';
  // static String getResetPassword() => '$resetPassword';
  static String getTouchId() => '$touchId';
  static String getConfirmPassCode() => '$confirmPassCode';

  static String getSignIn() => '$signIn';
  static String getSignUp() => '$signUp';

  static List<GetPage> routes = [
    GetPage(
      name: initial,
      page: () => Splash(),
      transition: Transition.cupertinoDialog,
    ),
    GetPage(
      name: signUp,
      page: () => SignUp(),
      transition: Transition.cupertinoDialog,
    ),
    GetPage(
      name: summaryPage,
      page: () => MoneySummaryPage(),
      transition: Transition.cupertinoDialog,
    ),
    GetPage(
      name: detailsPage,
      page: () => DetailsPage(),
      transition: Transition.cupertinoDialog,
    ),
    GetPage(
      name: budgetDetailsPage,
      page: () => BudgetDetailsPage(),
      transition: Transition.cupertinoDialog,
    ),
    GetPage(
      name: passCode,
      page: () => PasscodePage(),
      transition: Transition.cupertinoDialog,
    ),
    GetPage(
      name: confirmPassCode,
      page: () => ConfirmPassCode(),
      transition: Transition.cupertinoDialog,
    ),
    // GetPage(
    //   name: resetPassword,
    //   page: () => PasswordReset(),
    //   transition: Transition.cupertinoDialog,
    // ),
    GetPage(
      name: mobileAuth,
      page: () => MobileAuthentication(),
      transition: Transition.cupertinoDialog,
    ),
    GetPage(
      name: signIn,
      page: () => SignIn(),
      transition: Transition.cupertinoDialog,
    ),
    GetPage(
      name: touchId,
      page: () => TouchId(),
      transition: Transition.cupertinoDialog,
    ),
    GetPage(
      name: verified,
      page: () => VerifiedPage(),
      transition: Transition.cupertinoDialog,
    ),
    GetPage(
      name: otpPage,
      page: () => OtpPage(),
      transition: Transition.cupertinoDialog,
    ),
  ];
}
