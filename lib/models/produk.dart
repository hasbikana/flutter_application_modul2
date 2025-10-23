class Produk {
  final String id;
  final String nama;
  final String deskripsi;
  final double harga;

  Produk({required this.id, required this.nama, required this.deskripsi, required this.harga});

  Produk salin({String? id, String? nama, String? deskripsi, double? harga}) {
    return Produk(
      id: id ?? this.id,
      nama: nama ?? this.nama,
      deskripsi: deskripsi ?? this.deskripsi,
      harga: harga ?? this.harga,
    );
  }
}