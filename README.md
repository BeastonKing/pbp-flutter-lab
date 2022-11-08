# Penjelasan Tugas 7

### Stateless Widget vs Stateful Widget

State adalah informasi yang dapat dibaca secara sinkronus ketika widget dibuat dan memiliki kemampuan untuk berubah sepanjang jalan widgetnya.

Stateless Widget adalah widget yang state-nya tidak bisa diubah setelah widget tersebut dibuat. Stateless Widget bersifat immutable. Stateful Widget adalah widget yang state-nya dapat diubah setelah pembuatan widget tersebut. Stateful Widget bersifat mutable dan dapat diubah berkali-kali. 

Dengan kata lain, Stateless Widget bersifat statis dan ketika sudah dibuat maka tidak akan bisa diubah lagi. Contoh dari Stateless Widget adalah misalnya terdapat suatu Text atau Icon yang akan selalu sama selama jalannya program tersebut. Stateful Widget bersifat dinamis dan dapat mengalami perubahan berkali-kali setelah widget tersebut dibuat. Perubahan ini bisa berubah jika ada perubahan input, data, variabel, dan sebagainya. Contoh dari Stateful Widget ini terdapat pada program yakni widget yang menampilkan data counter serta teks genap atau ganjil.

### Widget yang Dipakai

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