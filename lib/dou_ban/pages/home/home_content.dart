import 'package:flutter/material.dart';
import 'package:hello_world/dou_ban/model/home_model.dart';
import '../../../service/home_request.dart';

class KSJHomeContent extends StatefulWidget {
  @override
  _KSJHomeContentState createState() => _KSJHomeContentState();
}

class _KSJHomeContentState extends State<KSJHomeContent> {

  final List<MovieItem> movies = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    HomeRequest.homeRequestMovieList(0).then((value) {
      setState(() {
        movies.addAll(value);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("首页内容", style: TextStyle(fontSize: 30, color: Colors.green)),
    );
  }
}
