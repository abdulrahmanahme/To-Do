import '../../../../config/consts/note_const.dart';
import '../../domain/entities/note_entite.dart';

class NoteModel extends Note {
  const NoteModel(
      {super.id,
      required super.number,
      required super.title,
      required super.description,
      required super.createdTime});

  static NoteModel fromJson(Map<String, Object?> json) => NoteModel(
        id: json[NoteFields.id] as int,
        number: json[NoteFields.number] as int,
        title: json[NoteFields.title] as String,
        description: json[NoteFields.description] as String,
        createdTime: DateTime.parse(json[NoteFields.time] as String),
      );
      
  @override
  NoteModel copy({
    int? id,
    int? number,
    String? title,
    String? description,
    DateTime? createdTime,
  }) =>
      NoteModel(
        id: id ?? this.id,
        number: number ?? this.number,
        title: title ?? this.title,
        description: description ?? this.description,
        createdTime: createdTime ?? this.createdTime,
      );

  Map<String, Object?> toJson() => {
        NoteFields.id: id,
        NoteFields.title: title,
        NoteFields.number: number,
        NoteFields.description: description,
        NoteFields.time: createdTime.toIso8601String(),
      };
}
