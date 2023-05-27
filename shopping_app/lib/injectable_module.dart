import 'package:firebase_core/firebase_core.dart';
import 'package:injectable/injectable.dart';

import 'firebase_options.dart';

@module
abstract class InjectableModule {
  @preResolve
  @lazySingleton
  Future<FirebaseApp> get firebaseApp =>
      Firebase.initializeApp(options: DefaultFirebaseOptions.android);
}
