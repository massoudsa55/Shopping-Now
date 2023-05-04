import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final int status;
  final String message;

  const Failure(this.status, this.message);

  @override
  List<Object?> get props => [status, message];
}
