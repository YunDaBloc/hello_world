import 'package:flutter/material.dart';
import '../../../service/home_request.dart';

class KSJHomePage extends StatefulWidget {
  @override
  _KSJHomePageState createState() => _KSJHomePageState();
}

class _KSJHomePageState extends State<KSJHomePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    HomeRequest.homeRequestMovieList(0);
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) {
          return ListTile(title: Text("item$index"));
        });
  }
}
