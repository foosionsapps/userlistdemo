class User {

  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  User({this.id, this.email, this.firstName, this.lastName, this.avatar});


  factory User.fromJson(user) {

    return User(
      id: user['id'],
      email: user['email'],
      firstName: user['first_name'],
      lastName: user['last_name'],
      avatar: user['avatar']
    );
  }




}