import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';
import 'app_localizations_fr.dart';

// ignore_for_file: type=lint

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
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
    Locale('fr'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Dorsaf Boughdiri - Mobile Developer'**
  String get appTitle;

  /// No description provided for @heroTitle.
  ///
  /// In en, this message translates to:
  /// **'Mobile Developer'**
  String get heroTitle;

  /// No description provided for @heroSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Flutter • iOS • Android • Full-Stack'**
  String get heroSubtitle;

  /// No description provided for @aboutMeTitle.
  ///
  /// In en, this message translates to:
  /// **'About Me'**
  String get aboutMeTitle;

  /// No description provided for @aboutMeText1.
  ///
  /// In en, this message translates to:
  /// **'I am a passionate and experienced Mobile Developer with a proven track record of building high-quality VoIP and Chat applications that are published on both Google Play Store and Apple App Store.'**
  String get aboutMeText1;

  /// No description provided for @aboutMeText2.
  ///
  /// In en, this message translates to:
  /// **'With expertise in Flutter, Dart, Kotlin, Swift, and NodeJS, I specialize in creating seamless cross-platform experiences that deliver exceptional user engagement and performance.'**
  String get aboutMeText2;

  /// No description provided for @featuredProjectsTitle.
  ///
  /// In en, this message translates to:
  /// **'Featured Projects'**
  String get featuredProjectsTitle;

  /// No description provided for @comunikPhoneTitle.
  ///
  /// In en, this message translates to:
  /// **'Comunik Phone'**
  String get comunikPhoneTitle;

  /// No description provided for @comunikPhoneDescription.
  ///
  /// In en, this message translates to:
  /// **'A sophisticated chat and communication platform with encrypted messaging, call recordings, FaceID authentication, and elegant dark mode support. Available on both Google Play Store and Apple App Store.'**
  String get comunikPhoneDescription;

  /// No description provided for @comunikVisioTitle.
  ///
  /// In en, this message translates to:
  /// **'Comunik Visio'**
  String get comunikVisioTitle;

  /// No description provided for @comunikVisioDescription.
  ///
  /// In en, this message translates to:
  /// **'Professional video conferencing app for seamless virtual meetings. Features high-quality video calls, screen sharing, and meeting management. Available on both Google Play Store and Apple App Store.'**
  String get comunikVisioDescription;

  /// No description provided for @comunikUnifiedTitle.
  ///
  /// In en, this message translates to:
  /// **'Comunik Unified'**
  String get comunikUnifiedTitle;

  /// No description provided for @allInOneSolution.
  ///
  /// In en, this message translates to:
  /// **'All-in-one communication solution combining chat, voice calls, and video calls in a single app. Streamlined interface for seamless communication experience. Available on both Google Play Store and Apple App Store.'**
  String get allInOneSolution;

  /// No description provided for @comunikChatTitle.
  ///
  /// In en, this message translates to:
  /// **'Comunik Chat'**
  String get comunikChatTitle;

  /// No description provided for @comunikChatDescription.
  ///
  /// In en, this message translates to:
  /// **'Collaborative chat application designed for team communication and project collaboration. Features group chats, file sharing, and real-time messaging. Available on both Google Play Store and Apple App Store.'**
  String get comunikChatDescription;

  /// No description provided for @comunikRmcTitle.
  ///
  /// In en, this message translates to:
  /// **'Comunik RMC'**
  String get comunikRmcTitle;

  /// No description provided for @comunikRmcDescription.
  ///
  /// In en, this message translates to:
  /// **'A comprehensive all-in-one solution for managing customer interactions across multiple channels including Messenger, WhatsApp, Instagram, Telegram and more. Features advanced supervision, reporting, and team management tools.'**
  String get comunikRmcDescription;

  /// No description provided for @viewApp.
  ///
  /// In en, this message translates to:
  /// **'View App'**
  String get viewApp;

  /// No description provided for @technicalSkillsTitle.
  ///
  /// In en, this message translates to:
  /// **'Technical Skills'**
  String get technicalSkillsTitle;

  /// No description provided for @mobileDevelopment.
  ///
  /// In en, this message translates to:
  /// **'Mobile Development'**
  String get mobileDevelopment;

  /// No description provided for @backendDatabase.
  ///
  /// In en, this message translates to:
  /// **'Backend & Database'**
  String get backendDatabase;

  /// No description provided for @toolsPlatforms.
  ///
  /// In en, this message translates to:
  /// **'Tools & Platforms'**
  String get toolsPlatforms;

  /// No description provided for @getInTouch.
  ///
  /// In en, this message translates to:
  /// **'Get In Touch'**
  String get getInTouch;

  /// No description provided for @choosePlatform.
  ///
  /// In en, this message translates to:
  /// **'Choose Platform'**
  String get choosePlatform;

  /// No description provided for @selectAppStore.
  ///
  /// In en, this message translates to:
  /// **'Select your preferred app store to view {appName}'**
  String selectAppStore(Object appName);

  /// No description provided for @googlePlay.
  ///
  /// In en, this message translates to:
  /// **'Google Play'**
  String get googlePlay;

  /// No description provided for @appStore.
  ///
  /// In en, this message translates to:
  /// **'App Store'**
  String get appStore;

  /// No description provided for @cancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get cancel;

  /// No description provided for @copyright.
  ///
  /// In en, this message translates to:
  /// **'© 2024 Dorsaf Boughdiri. All rights reserved.'**
  String get copyright;

  /// No description provided for @languageSelector.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get languageSelector;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en', 'fr'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
    case 'fr':
      return AppLocalizationsFr();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
