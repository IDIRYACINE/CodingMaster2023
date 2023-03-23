import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';
import 'app_localizations_fr.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
    Locale('fr')
  ];

  /// No description provided for @userName.
  ///
  /// In en, this message translates to:
  /// **'userName'**
  String get userName;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'password'**
  String get password;

  /// No description provided for @identifaction.
  ///
  /// In en, this message translates to:
  /// **'identifaction'**
  String get identifaction;

  /// No description provided for @admin.
  ///
  /// In en, this message translates to:
  /// **'admin'**
  String get admin;

  /// No description provided for @user.
  ///
  /// In en, this message translates to:
  /// **'user'**
  String get user;

  /// No description provided for @agent.
  ///
  /// In en, this message translates to:
  /// **'agent'**
  String get agent;

  /// No description provided for @login.
  ///
  /// In en, this message translates to:
  /// **'login'**
  String get login;

  /// No description provided for @logout.
  ///
  /// In en, this message translates to:
  /// **'logout'**
  String get logout;

  /// No description provided for @addUser.
  ///
  /// In en, this message translates to:
  /// **'addUser'**
  String get addUser;

  /// No description provided for @importUsersFromExcel.
  ///
  /// In en, this message translates to:
  /// **'importUsersFromExcel'**
  String get importUsersFromExcel;

  /// No description provided for @changeLanguage.
  ///
  /// In en, this message translates to:
  /// **'change language'**
  String get changeLanguage;

  /// No description provided for @arabic.
  ///
  /// In en, this message translates to:
  /// **'arabic'**
  String get arabic;

  /// No description provided for @english.
  ///
  /// In en, this message translates to:
  /// **'english'**
  String get english;

  /// No description provided for @french.
  ///
  /// In en, this message translates to:
  /// **'french'**
  String get french;

  /// No description provided for @userType.
  ///
  /// In en, this message translates to:
  /// **'userType'**
  String get userType;

  /// No description provided for @validityStartDate.
  ///
  /// In en, this message translates to:
  /// **'validity start date'**
  String get validityStartDate;

  /// No description provided for @validityEndDate.
  ///
  /// In en, this message translates to:
  /// **'validity end date'**
  String get validityEndDate;

  /// No description provided for @loginWithQr.
  ///
  /// In en, this message translates to:
  /// **'login with qr'**
  String get loginWithQr;

  /// No description provided for @loginWithCredentials.
  ///
  /// In en, this message translates to:
  /// **'login with credentials'**
  String get loginWithCredentials;

  /// No description provided for @continueProcess.
  ///
  /// In en, this message translates to:
  /// **'continue process'**
  String get continueProcess;

  /// No description provided for @registerVehicule.
  ///
  /// In en, this message translates to:
  /// **'register vehicule'**
  String get registerVehicule;

  /// No description provided for @acessGranted.
  ///
  /// In en, this message translates to:
  /// **'acess granted'**
  String get acessGranted;

  /// No description provided for @acessDenied.
  ///
  /// In en, this message translates to:
  /// **'acess denied'**
  String get acessDenied;

  /// No description provided for @unkown.
  ///
  /// In en, this message translates to:
  /// **'unkown'**
  String get unkown;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ar', 'en', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar': return AppLocalizationsAr();
    case 'en': return AppLocalizationsEn();
    case 'fr': return AppLocalizationsFr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
