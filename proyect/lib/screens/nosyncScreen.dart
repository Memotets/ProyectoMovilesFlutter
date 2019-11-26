import 'package:flutter/material.dart';
class NoSyncScreen extends StatefulWidget {
  @override
  _NoSyncScreenState createState() => _NoSyncScreenState();
}

class _NoSyncScreenState extends State<NoSyncScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('No sincronizados'),
      ),
      body: Center(
        child: Icon(Icons.signal_cellular_off),
      ),
    );
  }
}