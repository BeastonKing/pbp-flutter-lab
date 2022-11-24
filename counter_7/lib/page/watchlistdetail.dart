import 'package:counter_7/model/mywatchlistmodel.dart';
import 'package:flutter/material.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/page/tambahbudget.dart';
import 'package:counter_7/page/mywatchlist.dart';
import 'package:counter_7/page/databudget.dart';

class WatchListDetail extends StatelessWidget {

  final MyWatchList myWatchList;

  const WatchListDetail({Key? key, required this.myWatchList}) : super(key: key);

  @override
  // State<WatchListDetail> createState() => _WatchListDetailState();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail"),
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

      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Title
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 15),

              child: Center(
                child: Text(myWatchList.fields.title, style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),    
              ),

            ),

            const SizedBox(height: 10,),
            // Release date
            Row(
              children: [
                const Text('Release Date: ', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                Text('\t ${myWatchList.fields.releaseDate}', style: const TextStyle(fontSize: 17),),
              ],
            ),
            const SizedBox(height: 10,),

            // Rating
            Row(
              children: [
                const Text('Rating: ', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                Text('\t ${myWatchList.fields.rating}', style: const TextStyle(fontSize: 17),),
              ],
            ),
            const SizedBox(height: 10,),

            // Status
            Row(
              children: [
                const Text('Status: ', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                Text('\t ${myWatchList.fields.watched.toString() == 'Watched.BELUM' ? "Belum" : "Sudah"}', style: const TextStyle(fontSize: 17),),
              ],
            ),
            const SizedBox(height: 10,),

            // Review
            Row(
              children: [
                const Text('Review: ', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
              ],
            ),

            Align(
              alignment: Alignment.centerLeft,
              child: 
                Container(
                  width: 800,
                  alignment: Alignment.centerLeft,
                  child: Text(myWatchList.fields.review, style: const TextStyle(fontSize: 17),),
                ),
            ),

            // Spacer untuk spacing whitespace
            Spacer(
              flex: 1,
            ),

            // Back button
            SizedBox(
              height: 40,
              width: 1000,
              child: TextButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blue)
                ),

                child: const Text('Back', style: TextStyle(color: Colors.white),),

                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const MyWatchListPage())
                  );
                }
              ),
            ),


            
          ],
        ),
      ),

    );
  }

}