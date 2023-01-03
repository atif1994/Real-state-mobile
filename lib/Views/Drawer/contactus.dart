import 'package:flutter/material.dart';
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
        title: const Text("Contact Us"),
      ),
      body: SafeArea(
          child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 18.0),
        children: <Widget>[
          Column(
            children: [
              const SizedBox(
                height: 40.0,
              ),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Name',
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Email',
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Phone Number',
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Subject',
                ),
              ),
              const SizedBox(
                height: 20.0,
                width: 300,
              ),
              const TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Message',
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Column(children: <Widget>[
                ButtonTheme(
                    height: 50,
                    disabledColor: const Color.fromARGB(255, 1, 10, 18),
                    child: ElevatedButton(
                      child: const Text("Submitt"),
                      onPressed: () {
                        makePostRequest();
                      },
                    )),
                const SizedBox(
                  height: 20,
                ),
                Column(children: <Widget>[
                  ButtonTheme(
                      height: 70,
                      minWidth: 100,
                      disabledColor: const Color.fromARGB(255, 1, 10, 18),
                      child: ElevatedButton(
                        child: const Text("GOOGLE MAP"),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MapSample()));
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
    const json =
        '{"name":"Mari Hip0ckman","email":"zoron@mailionoator.com","subject":"Reprehenderit occaec","phone":"+1 (466) 595-2178","content":"Id commodo quia volu" }';
    final response = await post(url, headers: headers, body: json);
    print('Status code: ${response.statusCode}');
    print('Body: ${response.body}');
  }
}
