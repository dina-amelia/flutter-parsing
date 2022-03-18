import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:parsing/sample_json.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late String _name = "";
  late String _age = "";
  late String _usergithub = "";
  late String _repogithub = "";
  List _hobi = [];
  List<Article> _articles = [];

  Future _loadSampleJson() async {
    String jsonString = await rootBundle.loadString("assets/sample.json");
    final jsonData = json.decode(jsonString);
    Sample sample = Sample.fromJson(jsonData);

    setState(() {
      _name = sample.name.toString();
      _age = sample.age.toString();
      _usergithub = sample.github!.username.toString();
      _repogithub = sample.github!.repository.toString();
      _hobi = sample.hobi!.toList();
      _articles = sample.articles!.toList();
    });
  }

  void initState() {
    _loadSampleJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Profile')),
        backgroundColor: Colors.indigo.shade400,
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: ListView(
          children: [
            Card(
              margin: EdgeInsets.all(20),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.indigo.shade300, Colors.green.shade400]),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: Container(
                    child: Center(
                        child: Text(
                      "Nama : " + _name,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(20),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.indigo.shade300, Colors.green.shade400]),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: Container(
                    child: Center(
                        child: Text(
                      "Umur : " + _age + " Tahun",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
                  ),
                ),
              ),
            ),
            Card(
              margin: EdgeInsets.all(20),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [Colors.indigo.shade300, Colors.green.shade400]),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: Container(
                    child: Center(
                        child: Text(
                      "Github : " +
                          _usergithub +
                          "\n Repository : " +
                          _repogithub,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
              height: MediaQuery.of(context).size.height * 0.30,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _hobi.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Card(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              Colors.green.shade300,
                              Colors.green.shade400
                            ]),
                          ),
                          child: Center(
                              child: Text(
                            _hobi[index].toString(),
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )),
                        ),
                      ),
                    );
                  }),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
              height: MediaQuery.of(context).size.height * 0.30,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _articles.length,
                  itemBuilder: (context, index) {
                    return Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Card(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              Colors.green.shade300,
                              Colors.green.shade400
                            ]),
                          ),
                          child: Center(
                              child: Text(
                            _articles[index].id.toString() +
                                "." +
                                "\n" +
                                _articles[index].title +
                                "\n" +
                                _articles[index].subtitle,
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          )),
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
