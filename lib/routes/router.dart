import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../models/user.dart';
import '../ui/screens/user_details_screen.dart';
import '../ui/screens/users_list_screen.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/usersList':
        return MaterialPageRoute(builder: (_) => UserListScreen());
      case '/userDetails':
        var user = settings.arguments as User;
        return MaterialPageRoute(
          builder: (_) => Provider.value(value: user, child: UserDetailsScreen()),
        );
      default:
        return null;
    }
  }
}