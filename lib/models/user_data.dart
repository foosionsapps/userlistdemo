class UserData {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  UserData({this.id, this.email, this.firstName, this.lastName, this.avatar});

  factory UserData.fromJson(user) {

    return UserData(
        id: user['data']['id'],
        email: user['data']['email'],
        firstName: user['data']['first_name'],
        lastName: user['data']['last_name'],
        avatar: user['data']['avatar']
    );
  }
}
