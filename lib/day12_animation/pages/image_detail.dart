import 'package:flutter/material.dart';

class KSJImageDetailPage extends StatelessWidget {

  final String imageURL;

  KSJImageDetailPage(this.imageURL);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(

        child: GestureDetector(
          child: Hero(
            tag: imageURL,
              child: Image.network(imageURL)
          ),
          onTap: (){
            Navigator.pop(context);
          },
        ),

      ),
    );
  }
}
