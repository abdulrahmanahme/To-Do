import 'package:dartz/dartz.dart';
import 'package:todo/features/todo/data/models/note_model.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/model/parameter_todo_model.dart';
import '../../../../core/usecase/use_case.dart';
import '../entities/note_entite.dart';
import '../repositories/base_todo_repositories.dart';

class ReadNoteDBUseCase extends BaseUseCase<NoteModel, ParameterToDo> {
  final BaseToDoRepository baseToDoRepository;
  ReadNoteDBUseCase(this.baseToDoRepository);
  @override
  Future<Either<Failure, NoteModel>> call(ParameterToDo parameter) async {
    return await baseToDoRepository.readNote(parameter);
  }
}

