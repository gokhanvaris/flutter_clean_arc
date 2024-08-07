class AssetLoader {
  static const String _baseImagePath = 'assets/images/';

  static String get logo => '$_baseImagePath/logo.png';
  static String get userAvatar => '$_baseImagePath/user_avatar.png';
  static String get background => '$_baseImagePath/background.jpg';

  static const String _baseAudioPath = 'assets/audios/';

  static String get notificationSound => '$_baseAudioPath/notification.mp3';
  static String get clickSound => '$_baseAudioPath/click.mp3';

  static const String _baseFontPath = 'assets/fonts/';

  static String get robotoRegular => '$_baseFontPath/Roboto-Regular.ttf';
  static String get robotoBold => '$_baseFontPath/Roboto-Bold.ttf';

  static const String _baseJsonPath = 'assets/json/';

  static String get userProfileJson => '$_baseJsonPath/user_profile.json';
}
