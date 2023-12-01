import 'package:equatable/equatable.dart';

class ParameterToDo extends Equatable {
  final String? filePath;
  final int? version;
  final int? id;
  const ParameterToDo({this.filePath, this.version, this.id});

  @override
  List<Object?> get props => [filePath, version, id];
}
