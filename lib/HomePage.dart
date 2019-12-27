import 'package:flutter/material.dart';
import 'Authentication.dart';
class HomePage extends StatefulWidget {
  HomePage({
    this.auth,
    this.onSignedOut,
  });
  final AuthImplementaion auth;
  final VoidCallback onSignedOut;
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}
class _HomePageState extends  State<HomePage>{
  void _logoutUser() async{
    try{
      await widget.auth.signOut();
      widget.onSignedOut();
    } catch (e) {
      print(e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      
      body: new Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: ExactAssetImage("images/back.png"),
            fit: BoxFit.fill
            ),
          ),
        ),
      bottomNavigationBar: new BottomAppBar(
        color: Color(0xfff44336),
        child: new Container(
          margin: const EdgeInsets.only(left: 50.0, right: 50.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              new IconButton(
                icon: new Icon(Icons.add_a_photo),
                color: Colors.white,
                iconSize: 30.0,
                onPressed: null,
              ),
              new IconButton(
                icon: new Icon(Icons.exit_to_app),
                color: Colors.white,
                iconSize: 30.0,
                onPressed: _logoutUser,
              ),
            ],
          ),
        ),
      ),
    );
  }
}