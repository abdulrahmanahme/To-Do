import 'package:equatable/equatable.dart';
import 'package:todo/features/todo/data/models/note_model.dart';

import '../../features/todo/domain/entities/note_entite.dart';

class ParameterToDo extends Equatable {
  final String? filePath;
  final int? version;
  final int? id;
  final NoteModel? note;
  const ParameterToDo({this.filePath, this.version, this.id, this.note});

  @override
  List<Object?> get props => [filePath, version, id];
}
