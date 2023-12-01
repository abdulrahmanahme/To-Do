import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/model/parameter_todo_model.dart';
import '../../../../core/usecase/use_case.dart';
import '../repositories/base_todo_repositories.dart';

class CloseNoteDBUseCase extends BaseUseCase<dynamic, ParameterToDo> {
  final BaseToDoRepository baseToDoRepository;
  CloseNoteDBUseCase(this.baseToDoRepository);

  @override
  Future<Either<Failure, dynamic>> call(ParameterToDo parameter) async {
    return await baseToDoRepository.close();
  }
}
