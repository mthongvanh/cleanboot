import 'base_localizations.dart';

/// The translations for Chinese (`zh`).
class BaseLocalizationsZh extends BaseLocalizations {
  BaseLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get appName => 'Application Name';

  @override
  String get localeSwapButton => 'English';

  @override
  String get resultsPopupEnglishContent => '本内容由大都会艺术博物馆收藏API提供，仅提供英文版本。';

  @override
  String get resultsSemanticDismiss => '解除信息';

  @override
  String get scrollingContentSemanticYoutube => 'Youtube 视频缩略图';

  @override
  String get scrollingContentSemanticOpen => '打开全屏地图';

  @override
  String get searchInputTitleSuggestions => '建议';

  @override
  String get searchInputHintSearch => '搜索';

  @override
  String get searchInputSemanticClear => '删除搜索';

  @override
  String timelineSemanticDate(Object fromDate, Object endDate) {
    return '$fromDate 至 $endDate';
  }

  @override
  String titleLabelDate(Object fromDate, Object endDate) {
    return '$fromDate ~ $endDate';
  }

  @override
  String get appModalsButtonOk => '确定';

  @override
  String get appModalsButtonCancel => '取消';

  @override
  String get appPageDefaultTitlePage => '页';

  @override
  String appPageSemanticSwipe(Object pageTitle, Object total, Object count) {
    return '$pageTitle $total 之 $count.';
  }

  @override
  String semanticsPrevious(Object title) {
    return '之前的文物$title';
  }

  @override
  String semanticsNext(Object title) {
    return '下一个文物$title';
  }

  @override
  String get homeMenuButtonExplore => '探索历史年表';

  @override
  String get homeMenuButtonView => '观看您的收藏';

  @override
  String get homeMenuButtonAbout => '关于这个应用程序';

  @override
  String get homeMenuAboutWonderous => 'Wonderous是世界八大奇迹的视觉展示。';

  @override
  String homeMenuAboutBuilt(Object flutterUrl, Object gskinnerUrl) {
    return '由 $gskinnerUrl 团队使用 $flutterUrl 构建。';
  }

  @override
  String homeMenuAboutLearn(Object wonderousUrl) {
    return '在 $wonderousUrl 上了解更多信息。';
  }

  @override
  String homeMenuAboutSource(Object githubUrl) {
    return '要查看这个应用程序的源代码，请访问 $githubUrl。';
  }

  @override
  String get homeMenuAboutRepo => 'Wonderous github 储存库';

  @override
  String get homeMenuAboutFlutter => 'Flutter';

  @override
  String get homeMenuAboutGskinner => 'gskinner';

  @override
  String get homeMenuAboutApp => 'wonderous.app';

  @override
  String homeMenuAboutPublic(Object metUrl) {
    return '来自$metUrl的公共领域艺术品。';
  }

  @override
  String get homeMenuAboutMet => '纽约大都会艺术博物馆';

  @override
  String homeMenuAboutPhotography(Object unsplashUrl) {
    return '来自$unsplashUrl的照片。';
  }

  @override
  String get homeMenuAboutUnsplash => 'Unsplash';

  @override
  String get introTitleJourney => '穿越过去之旅';

  @override
  String get introDescriptionNavigate => '浏览时光、艺术和文化的交汇处。';

  @override
  String get introTitleExplore => '探索名胜古迹';

  @override
  String get introDescriptionUncover => '发掘世界各地非凡的人造建筑。';

  @override
  String get introTitleDiscover => '发现文物';

  @override
  String get introDescriptionLearn => '研究历史文物，了解历史文化';

  @override
  String get introSemanticNavigate => '浏览';

  @override
  String get introSemanticSwipeLeft => '向左滑动以继续浏览';

  @override
  String get introSemanticEnterApp => '进入应用程序';

  @override
  String get introSemanticWonderous => 'Wonderous';

  @override
  String get eraPrehistory => '史前时代';

  @override
  String get eraClassical => '古典时代';

  @override
  String get eraEarlyModern => '早期现代';

  @override
  String get eraModern => '现代';

  @override
  String get yearBCE => '公元前';

  @override
  String get yearCE => '公元后';

  @override
  String yearFormat(Object date, Object era) {
    return '$era$date年';
  }

  @override
  String get year => '年';

  @override
  String get privacyPolicy => '隐私政策';

  @override
  String privacyStatement(Object privacyUrl) {
    return 'gskinner 非常重视对用户隐私的保护，正如$privacyUrl里所诉，gskinner 不会收集您的个人信息。';
  }

  @override
  String get pageNotFoundBackButton => '回到文明';

  @override
  String get pageNotFoundMessage => '您正在寻找的页面不存在';
}
