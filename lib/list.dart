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
                  "City of Harare",
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
                  "City of Bulawayo",
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
                    "assets/images/Mutare.png" /*+ data['image']*/),
                title: Text(
                  "City of Mutare",
                  style: TextStyle(color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "Mutare City Council feed",
                  style: TextStyle(color: Colors.grey),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CityFeed(
                            title: "Mutare",
                          )));
                  // print("thing tapped");
                },
              ),

              ListTile(
                leading: Image.asset(
                    "assets/images/Chitungwiza.png" /*+ data['image']*/),
                title: Text(
                  "City of Chitungwiza",
                  style: TextStyle(color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "Chitungwiza Town Council feed",
                  style: TextStyle(color: Colors.grey),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CityFeed(
                            title: "Chitungwiza",
                          )));
                  // print("thing tapped");
                },
              ),
              ListTile(
                leading: Image.asset(
                    "assets/images/Shurugwi.png" /*+ data['image']*/),
                title: Text(
                  "City of Shurugwi",
                  style: TextStyle(color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  "Shurugwi Town Council feed",
                  style: TextStyle(color: Colors.grey),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CityFeed(
                            title: "Shurugwi",
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
