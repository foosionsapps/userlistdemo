import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/user_data.dart';
import '../../models/user.dart';
import '../../view_models/user_details_view_model.dart';
import '../components/connectivity_notification.dart';

class UserDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    UserDetailsViewModel userDetailsViewModel =
        Provider.of<UserDetailsViewModel>(context);

    User user = Provider.of<User>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Payever User Details",
            style: TextStyle(color: Colors.white, fontSize: 18)),
      ),
      body: ListView(
        children: <Widget>[
          ConnectivityNotification(),
          Padding(
            padding: EdgeInsets.all(5),
            child: FutureBuilder<UserData>(
                future: userDetailsViewModel.fetchUserDetails(user.id),
                builder: (BuildContext context, AsyncSnapshot<UserData> snapshot) {
                  if (snapshot.hasError) {
//                    return Center(child: Text("Error loading user data"));
                    return Center(child: Text(snapshot.error.toString()));
                  }

                  if (snapshot.hasData) {
                    return Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: listViewCard(snapshot.data));
                  }

                  return Center(child: CircularProgressIndicator());
                }),
          )
        ],
      ),
    );
  }

  Widget listViewCard(UserData user) {
    return Padding(
      padding: EdgeInsets.all(2),
      child: Card(
        elevation: 1,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.grey.withOpacity(0.2), width: 1.0),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          height: 190,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.0), color: Colors.white),
          child: Column(
            children: <Widget>[
              Text("User Details:",
                  style: TextStyle(color: Colors.black, fontSize: 25)),
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(user.avatar),
                              fit: BoxFit.cover),
                          borderRadius: BorderRadius.circular(7.0)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Id: ${user.id}", style: TextStyle(color:
                    Colors.black, fontSize: 20, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
              Text("Name: ${user.firstName} ${user.lastName}",
                  style: TextStyle(color: Colors.black)),
              Text("Email: ${user.email}",
                  style: TextStyle(color: Colors.black)),
            ],
          ),
        ),
      ),
    );
  }
}
