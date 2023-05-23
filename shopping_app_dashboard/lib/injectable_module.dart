import 'package:firebase_core/firebase_core.dart';
import 'package:injectable/injectable.dart';
import 'package:shopping_app_dashboard/firebase_options.dart';

@module
abstract class InjectableModule {
  @preResolve
  @lazySingleton
  Future<FirebaseApp> get firebaseApp =>
      Firebase.initializeApp(options: DefaultFirebaseOptions.web);
}
