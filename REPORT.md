# Laporan Fitur Produk

Deskripsi singkat:

Proyek ini menambahkan fitur manajemen produk sederhana pada aplikasi Flutter modul 1. Fitur mencakup:

- Halaman Daftar Produk (ListView) yang menampilkan produk dari repository in-memory.
- Halaman Detail Produk yang menampilkan nama, harga, dan deskripsi.
- Halaman Form untuk menambah produk baru; tombol "Simpan" menyimpan ke repository dan kembali ke daftar.

File penting yang ditambahkan:

- `lib/models/product.dart` — model data Product.
- `lib/repository/product_repository.dart` — repository in-memory menggunakan `ValueNotifier<List<Product>>`.
- `lib/widgets/product_list.dart` — halaman daftar produk.
- `lib/widgets/product_detail.dart` — halaman detail produk.
- `lib/widgets/product_form.dart` — form tambah produk.

Alur penggunaan:

1. Dari halaman utama pilih "Produk (ListView & Detail)".
2. Di halaman Daftar Produk, tekan tombol + untuk membuka Form Tambah Produk.
3. Isi Nama, Harga, Deskripsi kemudian tekan "Simpan".
4. Produk baru akan muncul di daftar; klik untuk melihat Detail.

Validasi & keterbatasan:

- Validasi sederhana: Nama dan Harga wajib diisi.
- Data disimpan hanya di memory (volatile). Setelah restart aplikasi, data baru hilang.

Langkah pengujian singkat:

1. Jalankan `flutter run`.
2. Masuk ke menu Produk.
3. Tambah produk baru; verifikasi muncul di daftar.
4. Klik item untuk melihat detail.

Screenshots yang diharapkan dan penamaan file disarankan ada di `screenshots/README.md`.
