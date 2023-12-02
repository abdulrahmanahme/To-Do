import 'package:get_it/get_it.dart';

import '../../features/todo/data/datasources/todo_local_data_source.dart';

import '../../features/todo/data/repositories/todo_repertory.dart';
import '../../features/todo/domain/repositories/base_todo_repositories.dart';
import '../../features/todo/domain/usecases/close_use_case.dart';
import '../../features/todo/domain/usecases/create_db_use_case.dart';
import '../../features/todo/domain/usecases/create_note_use_case.dart';
import '../../features/todo/domain/usecases/delete_note_use_case.dart';
import '../../features/todo/domain/usecases/init_db_use_case.dart';
import '../../features/todo/domain/usecases/read_all_notes_use_case.dart';
import '../../features/todo/domain/usecases/read_note_use_case.dart';
import '../../features/todo/domain/usecases/update_use_case.dart';
import '../../features/todo/presentation/manager/cubit/todo_cubit.dart';

final sl = GetIt.instance;

class ServicesLocator {
  void init() {
    /// BLOC
    sl.registerFactory(
        () => ToDoCubit(sl(), sl(), sl(), sl(), sl(), sl(), sl(),sl()));

    /////UseCase
    sl.registerLazySingleton(() => InitDBUseCase(sl()));
    sl.registerLazySingleton(() => CreateDBUseCase(sl()));
    sl.registerLazySingleton(() => ReadAllNoteDBUseCase(sl()));
    sl.registerLazySingleton(() => ReadNoteDBUseCase(sl()));
    sl.registerLazySingleton(() => UpdateNoteDBUseCase(sl()));
    sl.registerLazySingleton(() => DeleteNoteDBUseCase(sl()));
    sl.registerLazySingleton(() => CloseNoteDBUseCase(sl()));
    sl.registerLazySingleton(() => CreateNoteDBUseCase(sl()));


    // Repository
    sl.registerLazySingleton<BaseToDoRepository>(() => ToDoRepertory(sl()));
    //Data Source
    sl.registerLazySingleton<BaseToDoLocalDataSource>(() => ToDoLocalDataSource());

  }
}
