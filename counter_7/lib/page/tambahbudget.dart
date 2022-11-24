import 'package:flutter/material.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/page/databudget.dart';
import 'package:flutter/services.dart';
import 'package:counter_7/page/mywatchlist.dart';

var listBudget = [];
class MyTambahBudgetPage extends StatefulWidget {
  const MyTambahBudgetPage({super.key});

  @override
  State<MyTambahBudgetPage> createState() => _MyTambahBudgetPageState();
}

class DataBudget {
  String judul;
  int nominal;
  String tipeBudget;

  DataBudget({required this.judul, required this.nominal, required this.tipeBudget});
}

class _MyTambahBudgetPageState extends State<MyTambahBudgetPage> {
  final _formKey = GlobalKey<FormState>();
  String _judul = "";
  int _nominal = 0;
  String _nominalString = "";
  String? tipeBudget = null;
  String tipeBudgetValidity = '';
  List<String> listTipeBudget = ['Pemasukan', 'Pengeluaran'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form Budget'),
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

      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),

            child: Column(
              children: [
                // JUDUL
                Padding(
                  padding: const EdgeInsets.all(8.0),

                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Judul',
                      labelText: 'Judul',
                      
                      // Adds border
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),

                    // Adds behaviour when judul is being typed
                    onChanged: (String? val) {
                      setState(() {
                        _judul = val!;
                      });
                    },

                    // Adds behaviour when judul is saved
                    onSaved: (String? val) {
                      setState(() {
                        _judul = val!;
                      });
                    },

                    // Validator
                    validator: (String? val) {
                      if (val == null || val.isEmpty) {
                        return 'Judul tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),

                // NOMINAL
                Padding(
                  padding: const EdgeInsets.all(8.0),

                  child: TextFormField(
                    // Only accepts numbers
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.digitsOnly
                    ],

                    decoration: InputDecoration(
                      hintText: 'Nominal',
                      // labelText: 'Nominal',
                      
                      // Adds border
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),

                    // Adds behaviour when nominal is being typed
                    onChanged: (String? val) {
                      setState(() {
                        _nominalString = val!;
                      });
                    },

                    // Adds behaviour when nominal is saved
                    onSaved: (String? val) {
                      setState(() {
                        // _nominal = int.parse(val!);
                        // _nominal = int.parse(_nominalString);
                        _nominalString = val!;
                      });
                    },

                    // Validator
                    validator: (String? val) {
                      if (val == null || val.isEmpty) {
                        return 'Nominal tidak boleh kosong!';
                      } else if (int.parse(val) == 0) {
                        return 'Nominal tidak boleh nol!';
                      }
                      return null;
                    },
                  ),
                ),


                // DROPDOWN WITHOUT UNDERLINE
                DropdownButtonHideUnderline(
                  child: DropdownButton(
                    hint: Text('Pilih Jenis'),
                    value: tipeBudget,
                    items: listTipeBudget.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),

                    onChanged: (String? newVal) {
                      setState(() {
                        tipeBudget = newVal!;
                      });
                    },
                  ),
                ),


                // Button to save data
                TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  child: const Text('Simpan', style: TextStyle(color: Colors.white),),

                  // Button to show dialog and is clickable iff tipeBudget != null
                  onPressed: tipeBudget != null ? () {
                    if (_formKey.currentState!.validate()) {
                      showDialog(
                        context: context,
                        builder: (context) {
                          // Dialog box
                          return Dialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            elevation: 15,
                            child: Container(
                              child: ListView(
                                padding: const EdgeInsets.only(top: 20, bottom: 20),
                                shrinkWrap: true,
                                children: <Widget>[
                                  // Padding(
                                  //   padding: EdgeInsets.only(bottom: 8.0),
                                  //   child: Center(child: const Text('Data Berhasil Disimpan!')),
                                  // ),
                                  
                                  Center(child: const Text('Informasi Data:')),
                                  SizedBox(height: 20),

                                  // Displays data that was inputted
                                  Padding(
                                    padding: const EdgeInsets.only(left: 12.0, bottom: 8.0),
                                    child: Text('Judul: $_judul'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 12.0, bottom: 8.0),
                                    child: Text('Nominal: ${int.parse(_nominalString)}'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 12.0, bottom: 8.0),
                                    child: Text('Tipe Budget: $tipeBudget'),
                                  ),

                                  // Button to save data
                                  TextButton(
                                    onPressed: () {
                                      // Creates new DataBudget object
                                      DataBudget newData = DataBudget(judul: _judul, nominal: int.parse(_nominalString), tipeBudget: tipeBudget!);
                                      // Adds newData to list
                                      listBudget.add(newData);
                                      // Pops page
                                      Navigator.pop(context);
                                      // Resets form to clear it
                                      _formKey.currentState!.reset();

                                      // FOR DEBUGGING
                                      // for (int i = 0; i < listBudget.length; i++) {
                                      //   print('ITEM KE-$i');
                                      //   print('Judul: ${listBudget[i].judul}');
                                      //   print('Nominal: ${listBudget[i].nominal}');
                                      //   print('Tipe: ${listBudget[i].tipeBudget}');
                                      //   print('');
                                      // }
                                    },
                                    child: const Text('Simpan!'),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                  } : null,
                ),


                // FOR DEBUGGING
                // ListTile(
                //   title: const Text('Yang dipilih sekarang:'),
                //   subtitle: tipeBudget == null? const Text('null') : Text(tipeBudget!),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}