import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/use_case.dart';
import '../entities/note_entite.dart';
import '../repositories/base_todo_repositories.dart';

class ReadAllNoteDBUseCase extends BaseUseCase<int, Note> {
  final BaseToDoRepository baseToDoRepository;
  ReadAllNoteDBUseCase(this.baseToDoRepository);

  @override
  Future<Either<Failure, int>> call(Note note) async {
    return await baseToDoRepository.update(note);
  }
}
