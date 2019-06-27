
import 'package:meta/meta.dart';

import '../models/user_data.dart';
import '../services/resources/repository.dart';
import 'base_model.dart';

class UserDetailsViewModel extends BaseModel {

  final Repository repository;

  UserDetailsViewModel({
    @required this.repository,
  }) : assert(repository != null);

  Future<UserData> fetchUserDetails(int userId) async {
    UserData userData = await repository.getUserDetails(userId);
    return userData;

  }


}