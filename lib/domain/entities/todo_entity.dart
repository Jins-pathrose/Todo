import 'package:equatable/equatable.dart';

class TodoEntity extends Equatable {
  String? sId;
  String? title;
  String? description;
  bool? isCompleted;
  String? createdAt;
  String? updateAt;

  TodoEntity(
      {required this.sId,
      required this.title,
      required this.description,
      required this.isCompleted,
      required this.createdAt,
      required this.updateAt});

  @override
  List<Object?> get props => [
        this.sId,
        this.title,
        this.description,
        this.isCompleted,
        this.createdAt,
        this.updateAt
      ];
}
