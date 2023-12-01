import 'package:dartz/dartz.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:todo/core/model/parameter_todo_model.dart';
import 'package:todo/features/todo/domain/repositories/base_todo_repositories.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/usecase/use_case.dart';

class InitDBUseCase extends BaseUseCase<Database, ParameterToDo> {
  final BaseToDoRepository baseToDoRepository;
  InitDBUseCase(this.baseToDoRepository);
  @override
  Future<Either<Failure, Database>> call(ParameterToDo parameter) async {
    return await baseToDoRepository.initDB(parameter.filePath!);
  }
}

