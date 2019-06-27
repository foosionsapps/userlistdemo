import 'package:flutter/material.dart';
import 'package:getpayeverdemo/models/user.dart';
import 'package:getpayeverdemo/models/users_list.dart';
import 'package:provider/provider.dart';

import '../components/connectivity_notification.dart';
import '../../view_models/user_list_view_model.dart';

class UserListScreen extends StatefulWidget {
  @override
  createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  @override
  Widget build(BuildContext context) {
    UserListViewModel userListViewModel =
        Provider.of<UserListViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text("Payever UserList",
            style: TextStyle(color: Colors.white, fontSize: 18)),
      ),
      body: ListView(
        children: <Widget>[
          ConnectivityNotification(),
          Padding(
            padding: EdgeInsets.all(5),
            child: FutureBuilder<List<User>>(
                future: userListViewModel.fetchUsersList(userListViewModel.getCurrentPage),
                builder:
                    (BuildContext context, AsyncSnapshot<List<User>> snapshot) {
                  if (snapshot.hasError) {
                    return Center(child: Text("Error loading users"));
                  }

                  if (snapshot.hasData) {
                    if (snapshot.data.length == 0) {
                      return Column(
                        children: <Widget>[
                          Center(child: Text('No more users')),
//                          Center(child: RaisedButton(
//                            padding: EdgeInsets.all(5),
//                            child: Text("Start Page",
//                                style: TextStyle(
//                                    fontFamily: 'Quicksand',
//                                    fontSize: 15,
//                                    fontWeight: FontWeight.bold)),
//                            onPressed: () {
//                              userListViewModel.updatePage();
//                            },
//                          )),

                        ],
                      );
                    } else {
                      return Stack(
                        children: <Widget>[
                          Padding(
                              padding: const EdgeInsets.all(1.0),
                              child: ListView.builder(
                                itemCount: snapshot.data.length,
                                shrinkWrap: true,
                                physics: ClampingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  User user = snapshot.data[index];
                                  return GestureDetector(
                                    child: listViewCard(user),
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, '/userDetails',
                                          arguments: user);
                                    },
                                  );
                                },
                              )),
                          Positioned(
                            bottom: 60,
                            right: 1,
                            child: RaisedButton(
                              padding: EdgeInsets.all(5),
                              child: Text("Load More",
                                  style: TextStyle(
                                      fontFamily: 'Quicksand',
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold)),
                              onPressed: () {
                                userListViewModel.updateCurrentPage();
                              },
                            ),
                          ),
                        ],
                      );
                    }
                  }

                  return Center(child: CircularProgressIndicator());
                }),
          )
        ],
      ),
    );
  }

  Widget listViewCard(User user) {
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
          height: 170,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.0), color: Colors.white),
          child: Column(
            children: <Widget>[
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
