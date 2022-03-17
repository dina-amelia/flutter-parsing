import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  final List<String> numbers = [
    "Article",
    "Article",
    "Article",
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 460,
                height: 100,
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.lightGreen, Colors.cyan]),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text("Nama : Dina Amelia",
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                ),
              ),
              Container(
                width: 460,
                height: 100,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.lightGreen, Colors.cyan]),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text("Umur : 17 Tahun",
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                ),
              ),
              Container(
                width: 460,
                height: 140,
                margin: EdgeInsets.all(6),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: [Colors.lightGreen, Colors.cyan]),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text("Github : dina-amelia",
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
                height: MediaQuery.of(context).size.height * 0.30,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: numbers.length,
                    itemBuilder: (context, index) {
                      return Container(
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Card(
                          color: Colors.blue,
                          child: Container(
                            child: Center(
                                child: Text(
                              numbers[index].toString(),
                              style: TextStyle(
                                  color: Colors.white, fontSize: 30.0),
                            )),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
