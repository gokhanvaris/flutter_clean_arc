# Clean Flutter

<img src="https://storage.googleapis.com/cms-storage-bucket/ec64036b4eacc9f3fd73.svg" alt="Flutter Logo" width="100" height="100"/> <br/> <img src="https://dart.dev/assets/img/logo/logo-white-text.svg" alt="Dart Logo" width="100" height="100"/>

Bu proje, Flutter kullanarak geliştirilen bir mobil uygulamadır. Aşağıda, projenin içeriği ve kullanılan teknolojiler hakkında bilgi bulabilirsiniz.

## Yapılanlar

- **HttpManager Sınıfı**: 
  - HTTP isteklerini yönetir ve dinamik başlıkları günceller.
  - `X-API-USER-CODE` başlığı, kullanıcı kodu ile güncellenir.
  - İstek, yanıt ve hata günlüklerini kaydeden `DioLogger` kullanılır.

- **AbstractService Sınıfı**: 
  - CRUD işlemleri için temel bir servis sınıfı sağlar.
  - `get`, `post`, `put`, `delete` işlemlerini destekler.
  - Hatalı yanıt durumlarında `HttpException` fırlatılır.

- **AuthService Sınıfı**: 
  - Kullanıcı oturum açma ve diğer kullanıcı işlemlerini yönetir.
  - `connect` yöntemi, kullanıcı bağlantısını gerçekleştiren bir POST isteği yapar.

- **Cache Manager**:
  - Uygulama içi verilerin önbelleğe alınmasını ve yönetilmesini sağlar.
  - Verimli veri erişimi ve performans için cache kullanımı yapılır.

- **Network Manager**:
  - API isteklerini ve yanıtlarını yönetir.
  - Bağlantı kontrolü ve ağ hatalarını ele alır.
  - `Dio` paketini kullanarak HTTP işlemlerini yönetir.

- **Asset Loader**:
  - Uygulama içindeki varlıkları (resimler, sesler vb.) merkezi bir yerden yönetir.
  - Varlıkların düzenli ve erişilebilir olmasını sağlar.

- **MVVM (Model-View-ViewModel)**:
  - Uygulama mimarisinde MVVM desenini kullanır.
  - Verilerin ve iş mantığının kullanıcı arayüzünden ayrılmasını sağlar.

- **Dependency Injection (GetIt)**:
  - Servislerin ve bileşenlerin bağımlılıklarını yönetir.
  - `get_it` paketini kullanarak bağımlılıkları çözümleyip sağlar.

- **BLoC (Business Logic Component)**:
  - İş mantığını ve durum yönetimini ayırır.
  - `flutter_bloc` paketini kullanarak olaylara tepki verir ve durumu yönetir.

- **Localization**:
  - Uygulama çok dilli destek sağlar.
  - `flutter_localizations` paketini kullanarak çeşitli dillerde kullanıcı arayüzü sağlar.

- **Constants**:
  - Uygulama genelinde kullanılan sabit değerleri merkezi bir yerde tutar.
  - API URL'leri, hata mesajları ve diğer sabitler burada tanımlanır.

- **Enums**:
  - Sabitler ve durumlar için enum sınıfları kullanılır.
  - Kodun okunabilirliğini artırır ve hataları azaltır.

- **Extensions**:
  - Mevcut sınıflara yeni işlevsellikler ekler.
  - Kodun daha temiz ve okunabilir olmasını sağlar.

- **Routers**:
  - Uygulama içi yönlendirmeleri yönetir.
  - `go_router` veya benzeri paketleri kullanarak ekranlar arası geçişleri yönetir.

- **Initialization**:
  - Uygulama başlatıldığında gerekli tüm yapılandırmalar ve başlangıç işlemleri yapılır.
  - Bağımlılıkların ve servislerin başlatılması burada gerçekleştirilir.

- **Custom Exception Handler**:
  - Özel hata yönetimi ve hata mesajlarını ele alır.
  - `HttpException` sınıfını kullanarak ağ hatalarını ve diğer istisnaları işler.

- **Theme Management**:
  - Uygulamanın temasını ve stilini yönetir.
  - `ThemeData` kullanarak uygulama genelinde tutarlı bir görünüm sağlar.

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
