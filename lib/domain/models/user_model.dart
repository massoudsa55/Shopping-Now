// For demo only

import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final int id;
  final String firstName;
  final String lastName;
  final String idCard;

  const UserModel(this.id, this.firstName, this.lastName, this.idCard);

  @override
  List<Object?> get props => [id, firstName, lastName, idCard];
}

UserModel demoUserModel =
    const UserModel(101, "Messaoud", "Benkouider", "123456789852");
