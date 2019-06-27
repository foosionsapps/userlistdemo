import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../utils/conectivity_status.dart';


class ConnectivityNotification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var connectionStatus = Provider.of<ConnectivityStatus>(context);

//    print("connectionStatus: $connectionStatus");

    if (connectionStatus == ConnectivityStatus.WiFi ||
        connectionStatus == ConnectivityStatus.Cellular ||
        connectionStatus == null) {
      return Container(width: 0, height: 0);
    }

    return Container(
      width: double.infinity,
      height: 50,
      color: Colors.red,
      child: Center(
        child: Text("No internet connection!", style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.white)),
      ),
    );

  }
}
