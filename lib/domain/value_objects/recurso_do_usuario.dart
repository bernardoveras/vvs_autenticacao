import 'package:equatable/equatable.dart';

class RecursoDoUsuario extends Equatable {
  const RecursoDoUsuario({
    required this.serial,
    required this.recursos,
  });

  final String serial;
  final List<String> recursos;

  @override
  List<Object?> get props => [serial, recursos];
}
