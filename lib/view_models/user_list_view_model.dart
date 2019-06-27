
import 'package:meta/meta.dart';

import '../models/user.dart';
import '../models/users_list.dart';
import '../utils/view_state.dart';
import '../services/resources/repository.dart';
import 'base_model.dart';

class UserListViewModel extends BaseModel {

  final Repository repository;

  UserListViewModel({
    @required this.repository,
  }) : assert(repository != null);

  int currentPage = 1;

  List<User> usersListData = List<User>();

  get getCurrentPage => currentPage;

  updateCurrentPage() {
    currentPage++;
    notifyListeners();
  }

  updatePage() {
    currentPage = 1;
    notifyListeners();
  }

  Future<List<User>> fetchUsersList(int pageNumber) async {

//    setState(ViewState.Busy);
    UsersList data = await repository.getUsersList(pageNumber);

    usersListData.addAll(data.usersData);

//    setState(ViewState.Idle);
    return usersListData;

  }


}