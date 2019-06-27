import 'package:flutter/material.dart';
import '../components/connectivity_notification.dart';

class SplashScreen extends StatefulWidget {
  @override
  createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _formKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    _redirectUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _formKey,
      backgroundColor: Colors.white,
      body: Center(child: _SplashScreenBody()),
    );
  }

  void _redirectUser() async {

    await Future.delayed(Duration(seconds: 3), () => print("Redirecting user..."));

    Navigator.of(_formKey.currentContext).pushReplacementNamed('/usersList');

  }

}

class _SplashScreenBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        ConnectivityNotification(),
        Center(
          child: Text("Payever demo",
              style: TextStyle(color: Colors.black, fontSize: 20)),
        ),
        Padding(
          padding: EdgeInsets.all(48.0),
        ),
        Center(
          child: CircularProgressIndicator(),
        ),
      ],
    );
  }
}
