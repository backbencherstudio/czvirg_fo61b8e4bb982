import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_bn.dart';
import 'app_localizations_en.dart';

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
    Locale('bn'),
    Locale('en')
  ];

  /// No description provided for @bottomNavigation.
  ///
  /// In en, this message translates to:
  /// **'--------------Bottom Navigation--------------'**
  String get bottomNavigation;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @exercises.
  ///
  /// In en, this message translates to:
  /// **'Exercises'**
  String get exercises;

  /// No description provided for @progress.
  ///
  /// In en, this message translates to:
  /// **'Progress'**
  String get progress;

  /// No description provided for @benefits.
  ///
  /// In en, this message translates to:
  /// **'Benefits'**
  String get benefits;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @homeScreen.
  ///
  /// In en, this message translates to:
  /// **'--------------Home Screen--------------'**
  String get homeScreen;

  /// No description provided for @breathingPractices.
  ///
  /// In en, this message translates to:
  /// **'Breathing Practices'**
  String get breathingPractices;

  /// No description provided for @startYourSession.
  ///
  /// In en, this message translates to:
  /// **'Start your session'**
  String get startYourSession;

  /// No description provided for @lifeEducationSeries.
  ///
  /// In en, this message translates to:
  /// **'Life Education Series'**
  String get lifeEducationSeries;

  /// No description provided for @videoLibraryAndResources.
  ///
  /// In en, this message translates to:
  /// **'Video library & resources'**
  String get videoLibraryAndResources;

  /// No description provided for @comingSoon.
  ///
  /// In en, this message translates to:
  /// **'Coming Soon'**
  String get comingSoon;

  /// No description provided for @breathingPractiseScreen.
  ///
  /// In en, this message translates to:
  /// **'--------------Breathing Practise Screen--------------'**
  String get breathingPractiseScreen;

  /// No description provided for @chooseATechniqueThatMatchesYourNeeds.
  ///
  /// In en, this message translates to:
  /// **'Choose a technique that matches your needs'**
  String get chooseATechniqueThatMatchesYourNeeds;

  /// No description provided for @fourSevenEightRelaxation.
  ///
  /// In en, this message translates to:
  /// **'4–7–8 Relaxation'**
  String get fourSevenEightRelaxation;

  /// No description provided for @calmYourNervousSystem.
  ///
  /// In en, this message translates to:
  /// **'Calm your nervous system'**
  String get calmYourNervousSystem;

  /// No description provided for @inOut.
  ///
  /// In en, this message translates to:
  /// **'4 In | 4 Out'**
  String get inOut;

  /// No description provided for @theSimplestAndMostNaturalBreathing.
  ///
  /// In en, this message translates to:
  /// **'The simplest and most natural breathing...'**
  String get theSimplestAndMostNaturalBreathing;

  /// No description provided for @boxBreathing.
  ///
  /// In en, this message translates to:
  /// **'Box Breathing'**
  String get boxBreathing;

  /// No description provided for @aPowerfulTechniqueUsedByNavySEALs.
  ///
  /// In en, this message translates to:
  /// **'A powerful technique used by Navy SEALs'**
  String get aPowerfulTechniqueUsedByNavySEALs;

  /// No description provided for @customMode.
  ///
  /// In en, this message translates to:
  /// **'Custom Mode'**
  String get customMode;

  /// No description provided for @setYourOwnBreathingPattern.
  ///
  /// In en, this message translates to:
  /// **'Set your own breathing pattern'**
  String get setYourOwnBreathingPattern;

  /// No description provided for @beginner.
  ///
  /// In en, this message translates to:
  /// **'Beginner'**
  String get beginner;

  /// No description provided for @balance.
  ///
  /// In en, this message translates to:
  /// **'Balance'**
  String get balance;

  /// No description provided for @dailyUse.
  ///
  /// In en, this message translates to:
  /// **'Daily Use'**
  String get dailyUse;

  /// No description provided for @inhaleHoldExhaleScreen.
  ///
  /// In en, this message translates to:
  /// **'--------------Inhale Hold Exhale Screen--------------'**
  String get inhaleHoldExhaleScreen;

  /// No description provided for @inhale.
  ///
  /// In en, this message translates to:
  /// **'INHALE'**
  String get inhale;

  /// No description provided for @hold.
  ///
  /// In en, this message translates to:
  /// **'HOLD'**
  String get hold;

  /// No description provided for @exhale.
  ///
  /// In en, this message translates to:
  /// **'EXHALE'**
  String get exhale;

  /// No description provided for @fiveCyclesLeft.
  ///
  /// In en, this message translates to:
  /// **'5 cycles left'**
  String get fiveCyclesLeft;

  /// No description provided for @fourCyclesLeft.
  ///
  /// In en, this message translates to:
  /// **'4 cycles left'**
  String get fourCyclesLeft;

  /// No description provided for @paused.
  ///
  /// In en, this message translates to:
  /// **'Paused'**
  String get paused;

  /// No description provided for @resumeSession.
  ///
  /// In en, this message translates to:
  /// **'Resume Session'**
  String get resumeSession;

  /// No description provided for @quitSession.
  ///
  /// In en, this message translates to:
  /// **'Quit Session'**
  String get quitSession;

  /// No description provided for @sessionComplete.
  ///
  /// In en, this message translates to:
  /// **'Session Complete!'**
  String get sessionComplete;

  /// No description provided for @wellDoneTakeAMomentToNoticeHowYouFeel.
  ///
  /// In en, this message translates to:
  /// **'Well done. Take a moment to notice how you feel.'**
  String get wellDoneTakeAMomentToNoticeHowYouFeel;

  /// No description provided for @duration.
  ///
  /// In en, this message translates to:
  /// **'Duration'**
  String get duration;

  /// No description provided for @cycles.
  ///
  /// In en, this message translates to:
  /// **'Cycles'**
  String get cycles;

  /// No description provided for @mode.
  ///
  /// In en, this message translates to:
  /// **'Mode'**
  String get mode;

  /// No description provided for @breatheAgain.
  ///
  /// In en, this message translates to:
  /// **'Breathe Again'**
  String get breatheAgain;

  /// No description provided for @returnHome.
  ///
  /// In en, this message translates to:
  /// **'Return Home'**
  String get returnHome;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['bn', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'bn': return AppLocalizationsBn();
    case 'en': return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
