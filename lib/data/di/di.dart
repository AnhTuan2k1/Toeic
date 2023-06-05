
import 'package:get_it/get_it.dart';
import 'package:toeic/data/local/internal_storage.dart';
import 'package:toeic/data/remote/firebase_repository.dart';


final getIt = GetIt.instance;

void getItSetup(){
  getIt.registerLazySingleton<FirebaseRepository>(() => FirebaseRepository());
  getIt.registerLazySingleton<InternalStorage>(() => InternalStorage());
}