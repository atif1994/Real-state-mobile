import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart';
import 'package:prologic_29/Views/Drawer/googlemap.dart';

class contactus extends StatefulWidget {
  const contactus({super.key});

  @override
  State<contactus> createState() => _contactusState();
}

class _contactusState extends State<contactus> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Contact Us"),
      ),
      body: SafeArea(
          child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 18.0),
        children: <Widget>[
          Column(
            children: [
              SizedBox(
                height: 40.0,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Name',
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Email',
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Phone Number',
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Subject',
                ),
              ),
              SizedBox(
                height: 20.0,
                width: 300,
              ),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Message',
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Column(children: <Widget>[
                ButtonTheme(
                    height: 50,
                    disabledColor: Color.fromARGB(255, 1, 10, 18),
                    child: ElevatedButton(
                      child: Text("Submitt"),
                      onPressed: () {
                        makePostRequest();
                      },
                    )),
                SizedBox(
                  height: 20,
                ),
                Column(children: <Widget>[
                  ButtonTheme(
                      height: 70,
                      minWidth: 100,
                      disabledColor: Color.fromARGB(255, 1, 10, 18),
                      child: ElevatedButton(
                        child: Text("GOOGLE MAP"),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MapSample()));
                          //  var url = Uri.parse(
                          // "https://www.google.com/maps/d/viewer?mid=1_xJhYeS2A83UaCE9C2gVhCnWijI&hl=en_US&ll=53.30462100000002%2C-6.328125&z=17");
                        },
                      )),
                ])
              ])
            ],
          ),
        ],
      )),
    );
  }

  Future<void> makePostRequest() async {
    final url = Uri.parse('http://realestate.tecrux.net/api/v1/contact');
    final headers = {"Content-type": "application/json"};
    final json =
        '{"name":"Mari Hip0ckman","email":"zoron@mailionoator.com","subject":"Reprehenderit occaec","phone":"+1 (466) 595-2178","content":"Id commodo quia volu" }';
    final response = await post(url, headers: headers, body: json);
    print('Status code: ${response.statusCode}');
    print('Body: ${response.body}');
  }
}
