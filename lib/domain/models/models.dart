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

class SliderViewObject extends Equatable {
  final OnBoardingModel onBoardingModel;
  final int numOfSlides;
  final int currentIndex;

  const SliderViewObject(
      this.onBoardingModel, this.numOfSlides, this.currentIndex);

  @override
  List<Object?> get props => [onBoardingModel, numOfSlides, currentIndex];
}

class Customer extends Equatable {
  final String id;
  final String name;
  final int numOfNotifications;
  const Customer(this.id, this.name, this.numOfNotifications);

  @override
  List<Object?> get props => [id, name, numOfNotifications];
}

class Contacts extends Equatable {
  final String phone;
  final String email;
  final String link;
  const Contacts(this.phone, this.email, this.link);

  @override
  List<Object?> get props => [phone, email, link];
}

class Authentication extends Equatable {
  final Customer? customer;
  final Contacts? contacts;
  const Authentication(this.customer, this.contacts);

  @override
  List<Object?> get props => [customer, contacts];
}
