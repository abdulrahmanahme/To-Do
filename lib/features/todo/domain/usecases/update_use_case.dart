import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/model/parameter_todo_model.dart';
import '../../../../core/usecase/use_case.dart';
import '../repositories/base_todo_repositories.dart';

class UpdateNoteDBUseCase extends BaseUseCase<int, ParameterToDo> {
  final BaseToDoRepository baseToDoRepository;
  UpdateNoteDBUseCase(this.baseToDoRepository);

  @override
  Future<Either<Failure, int>> call(ParameterToDo parameter) async {
    return await baseToDoRepository.update(parameter);
  }
}
