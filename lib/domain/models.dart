import 'package:equatable/equatable.dart';

class OnBoardingModel extends Equatable {
  final String title;
  final String subTitle;
  final String image;
  final String txtButton;

  const OnBoardingModel(this.title, this.subTitle, this.image, this.txtButton);

  @override
  List<Object?> get props => [
        title,
        subTitle,
        image,
        txtButton,
      ];
}

class Customer {
  String id;
  String name;
  int numOfNotifications;
  Customer(this.id, this.name, this.numOfNotifications);
}

class Contacts {
  String phone;
  String email;
  String link;
  Contacts(this.phone, this.email, this.link);
}

class Authentication {
  Customer? customer;
  Contacts? contacts;
  Authentication(this.customer, this.contacts);
}
