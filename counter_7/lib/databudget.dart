import 'package:flutter/material.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/tambahbudget.dart';

class MyDataBudgetPage extends StatefulWidget {
  const MyDataBudgetPage({super.key});

  @override
  State<MyDataBudgetPage> createState() => _MyDataBudgetPageState();
}


class _MyDataBudgetPageState extends State<MyDataBudgetPage> {
  var list = listBudget;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Budget'),
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
          ],
        ),
      ),


      body: Container(
        padding: const EdgeInsets.all(20.0),


        child: ListViewHome(),
      ),
    );
  }
}

// Utilizes ListViewBuilder to create cards
class ListViewHome extends StatelessWidget {
  var list = listBudget;

  @override
  Widget build(BuildContext context) {
    return list.isNotEmpty ? ListView.builder(
      padding: const EdgeInsets.all(20.0),
      itemCount: list.length,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            title: Text(list[index].judul),
            subtitle: Text( list[index].nominal.toString()),
            trailing: Text(list[index].tipeBudget),
          ),
        );
      },
      
      
    ) : const Align(
      alignment: Alignment.topCenter,
      child: Text('Anda belum menambahkan data!'),
    );
  }
}