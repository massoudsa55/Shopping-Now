// For demo only

import 'package:equatable/equatable.dart';

class ProfileModel extends Equatable {
  final int id;
  final String fullNam;
  final String email;
  final String urlPicture;

  const ProfileModel(this.id, this.fullNam, this.email, this.urlPicture);

  @override
  List<Object?> get props => [id, fullNam, email, urlPicture];
}

ProfileModel demoProfileModel = const ProfileModel(
  101,
  "Benkouider Messaoud",
  "messaoud.benkouider1@gmail.com",
  "https://drive.google.com/drive/folders/1EGicJof5qgWiIZwd9TGVxi2Z943dUq55",
);
