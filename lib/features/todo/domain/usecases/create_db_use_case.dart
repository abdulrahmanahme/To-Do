import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:sqflite/sqlite_api.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/use_case.dart';
import '../repositories/base_todo_repositories.dart';

class CreateDBUseCase extends BaseUseCase<Database, ParameterDB> {
  final BaseToDoRepository baseToDoRepository;
  CreateDBUseCase(this.baseToDoRepository);

  @override
  Future<Either<Failure, Database>> call(ParameterDB parameter) async {
    return await baseToDoRepository.createDB(parameter, parameter);
  }
}

class ParameterDB extends Equatable {
  final Database db;
  final int version;

  const ParameterDB({required this.db, required this.version});

  @override
  List<Object?> get props => [db, version];
}
