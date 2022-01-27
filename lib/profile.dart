import 'package:flutter/material.dart';

class profile extends StatelessWidget {
  
  String name;
   String avatar;
    String url;
 

  profile({
    required this.name,
    required this.avatar,
    required this.url,

  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 1,
        title: Text(' Profile si ${name}'),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10)
              ),
              height: 150,
              width: (MediaQuery.of(context).size.width),
              child: Image.network(avatar,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              child: Text(name, style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24
              ),),
            ),
            Container(
              child: Text(url),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 20),
                    child: Column(
                      children: [
                        Text('Follower', style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),),
                        Text('0')
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 20),
                    child: Column(
                      children: [
                        Text('Following', style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),),
                        Text('0')
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}