# README Tugas 7, 8, dan 9

## Penjelasan Tugas 7

### Stateless Widget vs Stateful Widget

State adalah informasi yang dapat dibaca secara sinkronus ketika widget dibuat dan memiliki kemampuan untuk berubah sepanjang jalan widgetnya.

Stateless Widget adalah widget yang state-nya tidak bisa diubah setelah widget tersebut dibuat. Stateless Widget bersifat immutable. Stateful Widget adalah widget yang state-nya dapat diubah setelah pembuatan widget tersebut. Stateful Widget bersifat mutable dan dapat diubah berkali-kali. 

Dengan kata lain, Stateless Widget bersifat statis dan ketika sudah dibuat maka tidak akan bisa diubah lagi. Contoh dari Stateless Widget adalah misalnya terdapat suatu Text atau Icon yang akan selalu sama selama jalannya program tersebut. Stateful Widget bersifat dinamis dan dapat mengalami perubahan berkali-kali setelah widget tersebut dibuat. Perubahan ini bisa berubah jika ada perubahan input, data, variabel, dan sebagainya. Contoh dari Stateful Widget ini terdapat pada program yakni widget yang menampilkan data counter serta teks genap atau ganjil.

### Widget yang Digunakan

Pada program ini, digunakan beberapa widget yakni Button, Text, Styling, Icon, Stack, Padding, dan Align. Button digunakan sebagai penerima input berupa click dari user yang dapat melakukan clicking pada Increment ataupun Decrement button. Text digunakan untuk menampilkan text seperti ganjil/genap, application title, dan counter. Styling digunakan untuk menambahkan style seperti warna pada program. Icon digunakan pada Button untuk menambahkan logo. Stack, Padding, dan Align digunakan untuk positioning widget.

### Fungsi dari setState()

`setState()` adalah suatu function yang memiliki fungsi untuk memberitahu Flutter bahwa telah terjadi perubahan pada State tersebut. Hal ini membuatanya melakukan rerun method build yang akan membuat program menampilkan nilai-nilai atau perubahan-perubahan terbaru. Perubahan pada data yang tidak disertai pemanggilan `setState()` tidak akan memanggil `build()` lagi yang mengakibatkan tidak adanya refresh tampilan kepada user.

### Const vs Final

Keyword final digunakan untuk melakukan hardcode nilai ke dalam variabel. Variabel tersebut tidak akan bisa diubah isinya pada masa depan. Operasi yang dilakukan pada variabel tersebut juga tidak akan mengubahnya.

Keyword const mirip seperti keyword final, namun keyword const harus diketahui valuenya saat compile time.

Sebagai contoh:
`const dateConst = DateTime.now();`
tidak akan bekerja karena value dari DateTime ditentukan saat runtime. 

Sedangkan,
`final dateFinal = DateTime.now();`
tidak akan menghasilkan error

### Cara Implementasi
1. Program dibuat dengan command `flutter create counter_7`.
2. Membuat variabel `_counter` dengan tipe data int pada class `_MyHomePageState` yang akan menyimpan value angka.
3. Membuat variabel `_genapGanjil` dengan tipe data String pada class `_MyHomePageState` yang akan menyimpan value GENAP atau GANJIL.
4. Widget Text digunakan untuk mengganti title program, menampilkan variabel `_genapGanjil`, dan variabel `_counter`.
5. Widget Button berupa FloatingButtonAction ditambahkan pada bawah kiri dan kanan.
6. Widget Styling digunakan untuk mengubah tampilan atau style dari widget, seperti perubahan warna dan pemosisian widget. Pemosisian dilakukan dengan memanfaatkan Stack dengan alignment bottomLeft dan bottomRight. Padding dilakukan terhadap button pada bawah kiri karena posisi defaultnya menyebababkan button tersebut keluar dari layar.
7. Setiap button mempunyai atribut `onPressed` berupa function sesuai yang akan dipanggil setiap user melakukan klik pada button.
8. Function `_decrementCounter()` akan melakukan decrement pada `_counter` dan mengecek apakah `_counter` ganjil atau genap yang akan mengubah `_genapGanjil` dengan value yang sesuai. Function `_incrementCounter()` akan melakukan increment pada `_counter` dan juga akan melakukan pengecekan terhadap ganjil genapnya.
9. Bonus diimplementasikan dengan memanfaatkan conditional dengan ternary operator yang akan mengecek apakah `_counter` bernilai 0. Jika bernilai 0, maka button tidak akan dibuat. Berdasarkan sifat `setState()`, button yang tidak dibuat ini seakan-akan terlihat seperti button dihapus ketika nilai di-decrement menjadi 0.


## Penjelasan Tugas 8

### Navigator.push vs Navigator.pushReplacement
Pada Navigator.push(), route baru pada stack page akan ditambahkan yang diatur oleh navigator. Navigator.push() akan melakukan penambahan route pada stack dan berpindah ke page yang baru tersebut tanpa menghilangkan route yang lama. Sedangkan pada Navigator.pushReplacement() akan mengubah route yang terikat pada context dengan melakukan push dan replace. Atau dengan kata lain, Navigator.pushReplacement() akan berpindah ke page baru yang menggantikan atau menghapus page atau route yang lama.

### Widget yang Digunakan

TextFormField digunakan untuk menerima input dari pengguna. Button digunakan sebagai pemicu event berdasarkan pengguna, atau dalam program ini akan melakukan penambahan data budget ke array. Widget styling dan layout seperti Padding, Align, Column, dan ListTile berguna untuk melakukan layouting dan positioning terhadap elemen-elemen pada aplikasi. Drawer digunakan untuk membuat sidebar yang akan berfungsi untuk berpindah page. Card digunakan untuk menampilkan data dari array. Text digunakan untuk menampilkan informasi dalam bentuk string.

### Jenis-jenis Event pada Flutter
onPressed dipanggil ketika user selesai melakukan penekanan (mis. pada button)
onTap dipanggil ketika user melakukan tap
onChanged dipanggil setelah terjadi perubahan

### Cara Kerja Navigator
Navigator bekerja dengan stack. Page baru akan di-push dan akan ditampilkan. Untuk kembali ke halaman sebelumnya, maka akan dilakukan pop. Oleh karena itu, sistem navigator menggunakan First In First Out.

### Cara Implementasi

1. Membuat dua buah file .dart baru yaitu tambahbudget.dart dan databudget.dart
2. Melakukan implementasi drawer pada ketiga file yang akan mampu melakukan route ke masing-masing page.
3. Pada tambahbudget.dart ditambahkan dua TextFormField yang akan menerima input berupa judul dan nominal. Kemudian ditambahkan dropdown untuk memilih jenis pemasukkan atau pengeluaran serta ditambahkan button untuk melakukan penyimpanan data.
4. Input pada judul dan nominal berupa String. Namun, tipe data nominal akan diubah menjadi integer saat melakukan penyimpanan data. Lalu memasukkannya ke variabel.
5. Handling konversi agar selalu sesuai adalah dengan hanya menerima input nominal berupa angka saja dengan memanfaatkan TextInputType dan TextInputFormatter.
6. Dropdown berisi data Pemasukkan atau Pengeluaran. Dengan hintnya adalah "Pilih Jenis".
7. Button setelah diklik akan membuat objek budget dengan parameter judul, nominal, dan tipe budget. Lalu memasukkannya ke dalam array.
9. databudget.dart memanfaatkan ListView builder untuk membuat linear array of widget yang dapat di-scroll berdasarkan data. Dalam kasus ini, data yang digunakan adalah data dari list yang berisi object budget. itemCount berisikan panjang dari list tersebut. Lalu ListView builder akan membuat widget Card untuk menampilkan data dari object tersebut. Data yang ditampilkan adalah judul, nominal, dan tipe budget. Jika list masih kosong, atau belum ada data yang ditambahkan, maka halaman databudget hanya akan menampilkan Text yang akan memberitahu pengguna bahwa mereka belum menambahkan data.

## Penjelasan Tugas 9
### Melakukan Pengambilan Data JSON Tanpa Membuat Model
JSON dapat di-fetch tanpa melalui pembuatan model terlebih dahulu. Namun, hal tersebut bukanlah best practice karena bertujuan untuk meminimalkan data loss serta mampu menampung seluruh data JSON yang di-fetch.

### Widget yang Digunakan
Selain widget-widget yang digunakan pada tugas-tugas sebelumnya. Pada tugas 9 ini, memanfaatkan widget InkWell agar setiap elemen pada ListView mampu diimplementasikan onTap yang akan menampilkan detail setiap watchlist yang diklik. Spacer digunakan sebagai pengisi whitespace untuk meletakkan button di posisi paling bawah. SizedBox digunakan sebagai pengatur spacing atau gap antar widget.

### Mekanisme Pengambilan Data JSON
1. Membuat model pengambilan JSON.
2. Memanfaatkan http.get untuk melakukan fetching terhadap website yang kita inginkan. URL dan header disesuaikan.
3. Men-decode response dari GET tersebut dengan `jsonDecode()`.
4. Menampilkan data dengan FutureBuilder dengan mengimplementasikan ListView builder.

### Cara Implementasi

1. Melakukan penambahan page baru pada drawer.
2. Melakukan implementasi pengambilan JSON. Implementasi pengambilan JSON seperti yang sudah dijelaskan di atas.
3. Menampilkan setiap data JSON yang sudah di-fetch dengan menggunakan ListView Builder, dengan child-nya yang sudah di-wrap oleh InkWell agar bisa diterapkan onTap
4. Setiap pemanggilan onTap, data JSON tersebut akan dikirimkan ke suatu page baru.
5. Membuat page baru tersebut, berdasarkan data JSON tertentu, maka akan menampilkan detail dari watchlist tersebut.
6. Tombol back disediakan pada page baru tersebut untuk bisa kembali ke ListView data JSON.