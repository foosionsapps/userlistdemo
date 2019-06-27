
import '../../models/user.dart';
import '../../models/user_data.dart';
import '../../models/users_list.dart';
import 'api.dart';

class Repository {
  Api api = Api();

  Future<UsersList> getUsersList(int pageNumber) =>
      api.getAvailableUsers(pageNumber);

  Future<UserData> getUserDetails(int userId) =>
      api.getUserDetailsInfo(userId);

}
