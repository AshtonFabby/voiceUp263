import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'city_feeds.dart';

class LocalAuthorities extends StatelessWidget {
  const LocalAuthorities ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Local Authorities"),
        backgroundColor: Colors.indigo[800],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              ListTile(
                leading: Image.asset(
                    "assets/images/Harare.png" /*+ data['image']*/),
                title: Text(
                  "Harare",
                  style: TextStyle(color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "Harare City Council feed",
                  style: TextStyle(color: Colors.grey),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CityFeed(
                            title: "Harare",
                          )));
                  // print("thing tapped");
                },
              ),

              ListTile(
                leading: Image.asset(
                    "assets/images/Bulawayo.png" /*+ data['image']*/),
                title: Text(
                  "Bulawayo",
                  style: TextStyle(color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "Bulawayo City Council feed",
                  style: TextStyle(color: Colors.grey),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CityFeed(
                            title: "Bulawayo",
                          )));
                  // print("thing tapped");
                },
              ),
              ListTile(
                leading: Image.asset(
                    "assets/images/Gweru.png" /*+ data['image']*/),
                title: Text(
                  "Gweru",
                  style: TextStyle(color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "Gweru City Council feed",
                  style: TextStyle(color: Colors.grey),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CityFeed(
                            title: "Gweru",
                          )));
                  // print("thing tapped");
                },
              ),

              ListTile(
                leading: Image.asset(
                    "assets/images/Kadoma.png" /*+ data['image']*/),
                title: Text(
                  "Kadoma",
                  style: TextStyle(color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "Kadoma Town Council feed",
                  style: TextStyle(color: Colors.grey),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CityFeed(
                            title: "Kadoma",
                          )));
                  // print("thing tapped");
                },
              ),
            ],
          ),
        ),
        
      )
    );
  }
}
