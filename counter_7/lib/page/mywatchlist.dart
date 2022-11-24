import 'package:counter_7/page/watchlistdetail.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/page/databudget.dart';
import 'package:flutter/services.dart';
import 'package:counter_7/page/tambahbudget.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:counter_7/model/mywatchlistmodel.dart';

class MyWatchListPage extends StatefulWidget {
  const MyWatchListPage({Key? key}) : super(key: key);

  @override
  _MyWatchListPageState createState() => _MyWatchListPageState();
}

class _MyWatchListPageState extends State<MyWatchListPage> {

  Future<List<MyWatchList>> fetchMyWatchList() async {
    var url = Uri.parse('https://beaston-tugas-2.herokuapp.com/mywatchlist/json/');
    var response = await http.get(
      url,
      headers: {
        "Access-Control-Allow-Origin": "*",
        "Content-Type": "application/json",
      },
    );

    // Decodes response to JSON form
    var data = jsonDecode(utf8.decode(response.bodyBytes));

    // Converts from JSON to MyWatchList model
    List<MyWatchList> listOfWatchList = [];

    for (var d in data) {
      if (d != null) {
        listOfWatchList.add(MyWatchList.fromJson(d));
      }
    }

    return listOfWatchList;
  }





  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Watch List"),
      ),

      drawer: Drawer(
        child: Column(
          children: [
            // Adds clickable menu

            // Counter page
            ListTile(
              title: const Text('counter_7'),
              onTap: () {
                // Routes to main page
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage()),
                );
              },
            ),

            // Tambah budget page
            ListTile(
              title: const Text('Tambah Budget'),
              onTap: () {
                // Routes to tambah budget page
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyTambahBudgetPage()),
                );
              },
            ),

            ListTile(
              title: const Text('Data Budget'),
              onTap: () {
                // Routes to data budget page
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyDataBudgetPage()),
                );
              },
            ),

            ListTile(
              title: const Text("My Watch List"),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyWatchListPage()),
                );
              },
            ),
          ],
        ),
      ),

      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: const <Widget>[Text("Hello world!")],
      //   ),
      // ),

      body: FutureBuilder(
        future: fetchMyWatchList(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.data == null) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (!snapshot.hasData) {
              return Column(
                children: const [
                  Text(
                    'Tidak ada WatchList!',
                    style: TextStyle(
                      color: Color(0xff59A5D8),
                      fontSize: 20,
                    ),
                  ),

                  SizedBox(height: 8),
                ],
              );


            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (_, index) => Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  padding: const EdgeInsets.all(18.0),

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: const [
                      BoxShadow(color: Colors.black, blurRadius: 2.0),
                    ],
                  ),

                  child: InkWell(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${snapshot.data![index].fields.title}',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        // const SizedBox(height: 10),
                      ],
                      
                    ),
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (context) => WatchListDetail(
                            myWatchList: snapshot.data![index],
                          ),
                        )
                      );
                    },
                  ),
                  
                ),
              );
            }
          }
        },
      ),
    );
  }
}