
import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/model/parameter_todo_model.dart';
import '../../../../core/usecase/use_case.dart';
import '../entities/note_entite.dart';
import '../repositories/base_todo_repositories.dart';

class ReadAllNoteDBUseCase extends BaseUseCase<List<Note>,NoParameter> {
  final BaseToDoRepository baseToDoRepository;
  ReadAllNoteDBUseCase(this.baseToDoRepository);
  @override
  Future<Either<Failure,List<Note>>> call(NoParameter parameter) async {
    return await baseToDoRepository.readAllNotes();
  }
}
