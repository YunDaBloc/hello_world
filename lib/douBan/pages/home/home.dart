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
          return Row(
            children: <Widget>[
              Image.asset("assets/images/tab_btn_sy_p.png", fit: BoxFit.cover, width: 0, height: 0),
              Image.asset("assets/images/tab_btn_wd_p.png", fit: BoxFit.cover, width: 0, height: 0),
              Image.asset("assets/images/tab_btn_xk_p.png", fit: BoxFit.cover, width: 0, height: 0),
              Image.asset("assets/images/tab_btn_xx_p.png", fit: BoxFit.cover, width: 0, height: 0),
              Image.asset("assets/images/tab_btn_zb_p.png", fit: BoxFit.cover, width: 0, height: 0)
            ],
          );
        });
  }
}
