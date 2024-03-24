import 'base_localizations.dart';

/// The translations for English (`en`).
class BaseLocalizationsEn extends BaseLocalizations {
  BaseLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appName => 'Application Name';

  @override
  String get localeSwapButton => '简体中文';

  @override
  String get resultsPopupEnglishContent => 'This content is provided by the Metropolitan Museum of Art Collection API, and is only available in English.';

  @override
  String get resultsSemanticDismiss => 'dismiss message';

  @override
  String get scrollingContentSemanticYoutube => 'Youtube thumbnail';

  @override
  String get scrollingContentSemanticOpen => 'Open fullscreen maps view';

  @override
  String get searchInputTitleSuggestions => 'Suggestions';

  @override
  String get searchInputHintSearch => 'Search (ex. type or material)';

  @override
  String get searchInputSemanticClear => 'clear search';

  @override
  String timelineSemanticDate(Object fromDate, Object endDate) {
    return '$fromDate to $endDate';
  }

  @override
  String titleLabelDate(Object fromDate, Object endDate) {
    return '$fromDate to $endDate';
  }

  @override
  String get appModalsButtonOk => 'Ok';

  @override
  String get appModalsButtonCancel => 'Cancel';

  @override
  String get appPageDefaultTitlePage => 'page';

  @override
  String appPageSemanticSwipe(Object pageTitle, Object total, Object count) {
    return '$pageTitle $count of $total.';
  }

  @override
  String semanticsPrevious(Object title) {
    return 'Previous $title';
  }

  @override
  String semanticsNext(Object title) {
    return 'Next $title';
  }

  @override
  String get homeMenuButtonExplore => 'Explore the timeline';

  @override
  String get homeMenuButtonView => 'View your collection';

  @override
  String get homeMenuButtonAbout => 'About this app';

  @override
  String get homeMenuAboutWonderous => 'Wonderous is a visual showcase of eight wonders of the world. ';

  @override
  String homeMenuAboutBuilt(Object flutterUrl, Object gskinnerUrl) {
    return 'Built with $flutterUrl by the team at $gskinnerUrl.';
  }

  @override
  String homeMenuAboutLearn(Object wonderousUrl) {
    return 'Learn more at $wonderousUrl.';
  }

  @override
  String homeMenuAboutSource(Object githubUrl) {
    return 'To see the source code for this app, please visit the $githubUrl.';
  }

  @override
  String get homeMenuAboutRepo => 'Wonderous github repo';

  @override
  String get homeMenuAboutFlutter => 'Flutter';

  @override
  String get homeMenuAboutGskinner => 'gskinner';

  @override
  String get homeMenuAboutApp => 'wonderous.app';

  @override
  String homeMenuAboutPublic(Object metUrl) {
    return 'Public-domain artworks from $metUrl.';
  }

  @override
  String get homeMenuAboutMet => 'The Metropolitan Museum of Art, New York';

  @override
  String homeMenuAboutPhotography(Object unsplashUrl) {
    return 'Photography from $unsplashUrl.';
  }

  @override
  String get homeMenuAboutUnsplash => 'Unsplash';

  @override
  String get introTitleJourney => 'Journey to the past';

  @override
  String get introDescriptionNavigate => 'Navigate the intersection of time, art, and culture.';

  @override
  String get introTitleExplore => 'Explore places';

  @override
  String get introDescriptionUncover => 'Uncover remarkable human-made structures from around the world.';

  @override
  String get introTitleDiscover => 'Discover artifacts';

  @override
  String get introDescriptionLearn => 'Learn about cultures throughout time by examining things they left behind.';

  @override
  String get introSemanticNavigate => 'Navigate';

  @override
  String get introSemanticSwipeLeft => 'Swipe left to continue';

  @override
  String get introSemanticEnterApp => 'Enter the app';

  @override
  String get introSemanticWonderous => 'Wonderous';

  @override
  String get eraPrehistory => 'Prehistory';

  @override
  String get eraClassical => 'Classical Era';

  @override
  String get eraEarlyModern => 'Early Modern Era';

  @override
  String get eraModern => 'Modern Era';

  @override
  String get yearBCE => 'BCE';

  @override
  String get yearCE => 'CE';

  @override
  String yearFormat(Object date, Object era) {
    return '$date $era';
  }

  @override
  String get year => 'Year';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String privacyStatement(Object privacyUrl) {
    return 'As explained in our $privacyUrl we do not collect any personal information.';
  }

  @override
  String get pageNotFoundBackButton => 'Back to civilization';

  @override
  String get pageNotFoundMessage => 'The page you are looking for does not exist.';
}
