import 'package:shopping_now/app/extensions.dart';

import '../../app/app_constants.dart';
import '../../domain/models/models.dart';
import '../response/responses.dart';

extension CustomerResponseMapper on CustomerResponse? {
  Customer toDomain() => Customer(
        this?.id.orEmpty() ?? AppConstants.empty,
        this?.name.orEmpty() ?? AppConstants.empty,
        this?.numOfNotifications.orZero() ?? AppConstants.zero,
      );
}

extension ContactsResponseMapper on ContactsResponse? {
  Contacts toDomain() => Contacts(
        this?.phone.orEmpty() ?? AppConstants.empty,
        this?.email.orEmpty() ?? AppConstants.empty,
        this?.link.orEmpty() ?? AppConstants.empty,
      );
}

extension AuthenticationResponseMapper on AuthenticationResponse? {
  Authentication toDomain() => Authentication(
        this?.customer.toDomain(),
        this?.contacts.toDomain(),
      );
}
