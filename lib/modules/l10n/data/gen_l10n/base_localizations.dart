import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'base_localizations_en.dart';
import 'base_localizations_zh.dart';

/// Callers can lookup localized strings with an instance of BaseLocalizations
/// returned by `BaseLocalizations.of(context)`.
///
/// Applications need to include `BaseLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen_l10n/base_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: BaseLocalizations.localizationsDelegates,
///   supportedLocales: BaseLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the BaseLocalizations.supportedLocales
/// property.
abstract class BaseLocalizations {
  BaseLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static BaseLocalizations? of(BuildContext context) {
    return Localizations.of<BaseLocalizations>(context, BaseLocalizations);
  }

  static const LocalizationsDelegate<BaseLocalizations> delegate = _BaseLocalizationsDelegate();

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
    Locale('en'),
    Locale('zh')
  ];

  /// No description provided for @appName.
  ///
  /// In en, this message translates to:
  /// **'Application Name'**
  String get appName;

  /// No description provided for @localeSwapButton.
  ///
  /// In en, this message translates to:
  /// **'简体中文'**
  String get localeSwapButton;

  /// No description provided for @resultsPopupEnglishContent.
  ///
  /// In en, this message translates to:
  /// **'This content is provided by the Metropolitan Museum of Art Collection API, and is only available in English.'**
  String get resultsPopupEnglishContent;

  /// No description provided for @resultsSemanticDismiss.
  ///
  /// In en, this message translates to:
  /// **'dismiss message'**
  String get resultsSemanticDismiss;

  /// No description provided for @scrollingContentSemanticYoutube.
  ///
  /// In en, this message translates to:
  /// **'Youtube thumbnail'**
  String get scrollingContentSemanticYoutube;

  /// No description provided for @scrollingContentSemanticOpen.
  ///
  /// In en, this message translates to:
  /// **'Open fullscreen maps view'**
  String get scrollingContentSemanticOpen;

  /// No description provided for @searchInputTitleSuggestions.
  ///
  /// In en, this message translates to:
  /// **'Suggestions'**
  String get searchInputTitleSuggestions;

  /// No description provided for @searchInputHintSearch.
  ///
  /// In en, this message translates to:
  /// **'Search (ex. type or material)'**
  String get searchInputHintSearch;

  /// No description provided for @searchInputSemanticClear.
  ///
  /// In en, this message translates to:
  /// **'clear search'**
  String get searchInputSemanticClear;

  /// No description provided for @timelineSemanticDate.
  ///
  /// In en, this message translates to:
  /// **'{fromDate} to {endDate}'**
  String timelineSemanticDate(Object fromDate, Object endDate);

  /// No description provided for @titleLabelDate.
  ///
  /// In en, this message translates to:
  /// **'{fromDate} to {endDate}'**
  String titleLabelDate(Object fromDate, Object endDate);

  /// No description provided for @appModalsButtonOk.
  ///
  /// In en, this message translates to:
  /// **'Ok'**
  String get appModalsButtonOk;

  /// No description provided for @appModalsButtonCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get appModalsButtonCancel;

  /// No description provided for @appPageDefaultTitlePage.
  ///
  /// In en, this message translates to:
  /// **'page'**
  String get appPageDefaultTitlePage;

  /// No description provided for @appPageSemanticSwipe.
  ///
  /// In en, this message translates to:
  /// **'{pageTitle} {count} of {total}.'**
  String appPageSemanticSwipe(Object pageTitle, Object total, Object count);

  /// No description provided for @semanticsPrevious.
  ///
  /// In en, this message translates to:
  /// **'Previous {title}'**
  String semanticsPrevious(Object title);

  /// No description provided for @semanticsNext.
  ///
  /// In en, this message translates to:
  /// **'Next {title}'**
  String semanticsNext(Object title);

  /// No description provided for @homeMenuButtonExplore.
  ///
  /// In en, this message translates to:
  /// **'Explore the timeline'**
  String get homeMenuButtonExplore;

  /// No description provided for @homeMenuButtonView.
  ///
  /// In en, this message translates to:
  /// **'View your collection'**
  String get homeMenuButtonView;

  /// No description provided for @homeMenuButtonAbout.
  ///
  /// In en, this message translates to:
  /// **'About this app'**
  String get homeMenuButtonAbout;

  /// No description provided for @homeMenuAboutWonderous.
  ///
  /// In en, this message translates to:
  /// **'Wonderous is a visual showcase of eight wonders of the world. '**
  String get homeMenuAboutWonderous;

  /// No description provided for @homeMenuAboutBuilt.
  ///
  /// In en, this message translates to:
  /// **'Built with {flutterUrl} by the team at {gskinnerUrl}.'**
  String homeMenuAboutBuilt(Object flutterUrl, Object gskinnerUrl);

  /// No description provided for @homeMenuAboutLearn.
  ///
  /// In en, this message translates to:
  /// **'Learn more at {wonderousUrl}.'**
  String homeMenuAboutLearn(Object wonderousUrl);

  /// No description provided for @homeMenuAboutSource.
  ///
  /// In en, this message translates to:
  /// **'To see the source code for this app, please visit the {githubUrl}.'**
  String homeMenuAboutSource(Object githubUrl);

  /// No description provided for @homeMenuAboutRepo.
  ///
  /// In en, this message translates to:
  /// **'Wonderous github repo'**
  String get homeMenuAboutRepo;

  /// No description provided for @homeMenuAboutFlutter.
  ///
  /// In en, this message translates to:
  /// **'Flutter'**
  String get homeMenuAboutFlutter;

  /// No description provided for @homeMenuAboutGskinner.
  ///
  /// In en, this message translates to:
  /// **'gskinner'**
  String get homeMenuAboutGskinner;

  /// No description provided for @homeMenuAboutApp.
  ///
  /// In en, this message translates to:
  /// **'wonderous.app'**
  String get homeMenuAboutApp;

  /// No description provided for @homeMenuAboutPublic.
  ///
  /// In en, this message translates to:
  /// **'Public-domain artworks from {metUrl}.'**
  String homeMenuAboutPublic(Object metUrl);

  /// No description provided for @homeMenuAboutMet.
  ///
  /// In en, this message translates to:
  /// **'The Metropolitan Museum of Art, New York'**
  String get homeMenuAboutMet;

  /// No description provided for @homeMenuAboutPhotography.
  ///
  /// In en, this message translates to:
  /// **'Photography from {unsplashUrl}.'**
  String homeMenuAboutPhotography(Object unsplashUrl);

  /// No description provided for @homeMenuAboutUnsplash.
  ///
  /// In en, this message translates to:
  /// **'Unsplash'**
  String get homeMenuAboutUnsplash;

  /// No description provided for @introTitleJourney.
  ///
  /// In en, this message translates to:
  /// **'Journey to the past'**
  String get introTitleJourney;

  /// No description provided for @introDescriptionNavigate.
  ///
  /// In en, this message translates to:
  /// **'Navigate the intersection of time, art, and culture.'**
  String get introDescriptionNavigate;

  /// No description provided for @introTitleExplore.
  ///
  /// In en, this message translates to:
  /// **'Explore places'**
  String get introTitleExplore;

  /// No description provided for @introDescriptionUncover.
  ///
  /// In en, this message translates to:
  /// **'Uncover remarkable human-made structures from around the world.'**
  String get introDescriptionUncover;

  /// No description provided for @introTitleDiscover.
  ///
  /// In en, this message translates to:
  /// **'Discover artifacts'**
  String get introTitleDiscover;

  /// No description provided for @introDescriptionLearn.
  ///
  /// In en, this message translates to:
  /// **'Learn about cultures throughout time by examining things they left behind.'**
  String get introDescriptionLearn;

  /// No description provided for @introSemanticNavigate.
  ///
  /// In en, this message translates to:
  /// **'Navigate'**
  String get introSemanticNavigate;

  /// No description provided for @introSemanticSwipeLeft.
  ///
  /// In en, this message translates to:
  /// **'Swipe left to continue'**
  String get introSemanticSwipeLeft;

  /// No description provided for @introSemanticEnterApp.
  ///
  /// In en, this message translates to:
  /// **'Enter the app'**
  String get introSemanticEnterApp;

  /// No description provided for @introSemanticWonderous.
  ///
  /// In en, this message translates to:
  /// **'Wonderous'**
  String get introSemanticWonderous;

  /// No description provided for @eraPrehistory.
  ///
  /// In en, this message translates to:
  /// **'Prehistory'**
  String get eraPrehistory;

  /// No description provided for @eraClassical.
  ///
  /// In en, this message translates to:
  /// **'Classical Era'**
  String get eraClassical;

  /// No description provided for @eraEarlyModern.
  ///
  /// In en, this message translates to:
  /// **'Early Modern Era'**
  String get eraEarlyModern;

  /// No description provided for @eraModern.
  ///
  /// In en, this message translates to:
  /// **'Modern Era'**
  String get eraModern;

  /// No description provided for @yearBCE.
  ///
  /// In en, this message translates to:
  /// **'BCE'**
  String get yearBCE;

  /// No description provided for @yearCE.
  ///
  /// In en, this message translates to:
  /// **'CE'**
  String get yearCE;

  /// No description provided for @yearFormat.
  ///
  /// In en, this message translates to:
  /// **'{date} {era}'**
  String yearFormat(Object date, Object era);

  /// No description provided for @year.
  ///
  /// In en, this message translates to:
  /// **'Year'**
  String get year;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @privacyStatement.
  ///
  /// In en, this message translates to:
  /// **'As explained in our {privacyUrl} we do not collect any personal information.'**
  String privacyStatement(Object privacyUrl);

  /// No description provided for @pageNotFoundBackButton.
  ///
  /// In en, this message translates to:
  /// **'Back to civilization'**
  String get pageNotFoundBackButton;

  /// No description provided for @pageNotFoundMessage.
  ///
  /// In en, this message translates to:
  /// **'The page you are looking for does not exist.'**
  String get pageNotFoundMessage;
}

class _BaseLocalizationsDelegate extends LocalizationsDelegate<BaseLocalizations> {
  const _BaseLocalizationsDelegate();

  @override
  Future<BaseLocalizations> load(Locale locale) {
    return SynchronousFuture<BaseLocalizations>(lookupBaseLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'zh'].contains(locale.languageCode);

  @override
  bool shouldReload(_BaseLocalizationsDelegate old) => false;
}

BaseLocalizations lookupBaseLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return BaseLocalizationsEn();
    case 'zh': return BaseLocalizationsZh();
  }

  throw FlutterError(
    'BaseLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
