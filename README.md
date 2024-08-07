# Clean Flutter

![Flutter Logo](https://flutter.dev/assets/homepage/carousel/slide_1-layer_0-7ef59332e8a035d48cf9cfb0d3c1d50448c9c3d7a6819a9ec69934ebd46b8ff.png) ![Dart Logo](https://dart.dev/tools/dartpad/images/dart-logo.png)

Bu proje, Flutter kullanarak geliştirilen bir mobil uygulamadır. Aşağıda, projenin içeriği ve kullanılan teknolojiler hakkında bilgi bulabilirsiniz.

## Yapılanlar

- **HttpManager Sınıfı**: HTTP isteklerini yöneten ve başlıkları dinamik olarak güncelleyebilen bir sınıf eklendi. `X-API-USER-CODE` başlığı, kullanıcı kodu ile güncelleniyor.
- **AbstractService Sınıfı**: CRUD işlemleri için temel bir servis sınıfı oluşturuldu. Bu sınıf, `get`, `post`, `put`, ve `delete` işlemlerini yönetir.
- **AuthService Sınıfı**: Kullanıcı ile ilgili oturum açma ve diğer işlemleri yönetmek için bir servis sınıfı eklendi.

## Kullanılan Paketler

### State Management
- [flutter_bloc](https://pub.dev/packages/flutter_bloc) - Versiyon: ^8.1.6

### Dependency Injection
- [get_it](https://pub.dev/packages/get_it) - Versiyon: ^7.7.0

### Network
- [dio](https://pub.dev/packages/dio) - Versiyon: ^5.5.0+1

### Utils
- [equatable](https://pub.dev/packages/equatable) - Versiyon: ^2.0.5
- [logger](https://pub.dev/packages/logger) - Versiyon: ^2.4.0
- [package_info_plus](https://pub.dev/packages/package_info_plus) - Versiyon: ^8.0.0
- [go_router](https://pub.dev/packages/go_router) - Versiyon: ^14.1.4
- [cupertino_icons](https://pub.dev/packages/cupertino_icons) - Versiyon: ^1.0.6
- [connectivity_plus](https://pub.dev/packages/connectivity_plus) - Versiyon: ^4.0.0
- [very_good_analysis](https://pub.dev/packages/very_good_analysis) - Versiyon: ^6.0.0

### Cache and Database
- [drift](https://pub.dev/packages/drift) - Versiyon: ^2.4.0
- [path_provider](https://pub.dev/packages/path_provider) - Versiyon: ^2.0.11
- [sqflite](https://pub.dev/packages/sqflite) - Versiyon: ^2.0.0+4
- [sqlite3_flutter_libs](https://pub.dev/packages/sqlite3_flutter_libs) - Versiyon: ^0.5.4
- [drift_flutter](https://pub.dev/packages/drift_flutter) - Versiyon: ^0.1.0

### Localization
- [flutter_localizations](https://flutter.dev/docs/development/accessibility-and-localization/internationalization) - Versiyon: Flutter SDK
