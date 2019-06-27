import 'user.dart';

class UsersList {
  final int page;
  final int perPage;
  final int total;
  final int totalPages;
  final List<User> usersData;

  UsersList(
      {this.page, this.perPage, this.total, this.totalPages, this.usersData});

  factory UsersList.fromJson(Map<String, dynamic> userList) {
    var usersData = userList['data'] as List;
    List<User> userDataList = usersData.map((i) => User.fromJson(i)).toList();

    return UsersList(
        page: userList['page'],
        perPage: userList['per_page'],
        total: userList['total'],
        totalPages: userList['total_pages'],
        usersData: userDataList);
  }
}
