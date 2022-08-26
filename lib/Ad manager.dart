class AdsManager {
  static const bool _testMode = false;

  static String? get bannerAdUnitId{
    if(_testMode){
      return 'ca-app-pub-3940256099942544/6300978111';
    }
    return 'ca-app-pub-1430997888895044/6512191355';
  }
}