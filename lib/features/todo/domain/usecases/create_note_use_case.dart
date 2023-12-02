import 'package:dartz/dartz.dart';
import 'package:todo/features/todo/domain/entities/note_entite.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/model/parameter_todo_model.dart';
import '../../../../core/usecase/use_case.dart';
import '../repositories/base_todo_repositories.dart';

class CreateNoteDBUseCase extends BaseUseCase<Note, ParameterToDo> {
  final BaseToDoRepository baseToDoRepository;
  CreateNoteDBUseCase(this.baseToDoRepository);

  @override
  Future<Either<Failure, Note>> call(ParameterToDo parameter) async {
    return await baseToDoRepository.create(parameter);
  }
}
